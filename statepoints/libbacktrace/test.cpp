#include "backtrace.h"
#include <cxxabi.h>
#include <malloc.h>
#include <stdio.h>

#include <iostream>
#include <string>
#include <vector>

namespace Backtrace {
    namespace {
        static backtrace_state* state = nullptr;
    }

    struct StackFrame {
        std::string function;
        std::string filename;
        int lineno;
        uintptr_t addr;
    };

    void initialize(char* filename) {
        if (state == nullptr) {
            const auto onError = [](void*, const char* msg, int errnum) {
                std::cerr << "Error #" << errnum << " while setting up backtrace. Message: " << msg << std::endl;
            };

            state = backtrace_create_state(filename, true, onError, nullptr);
        }
    }

    std::vector<StackFrame> getBacktrace(int skip) {
        const auto onError = [](void*, const char* msg, int errnum) {
            std::cerr << "Error #" << errnum << " while getting backtrace. Message: " << msg << std::endl;
        };

        const auto onStackFrame = [](void* data, uintptr_t pc, const char* filename, int lineno, const char* function) {
            auto* backtrace = static_cast<std::vector<StackFrame>*>(data);

            StackFrame frame;

            // If we have no information, we skip this frame.
            if (!function && !filename) {
                return 0;
            }

            if (!function) {
                frame.function = "[UNKNOWN]";
            } else {
                int status;
                char* demangled_function = abi::__cxa_demangle(function, nullptr, nullptr, &status);
                if (status == 0) {
                    frame.function = std::string(demangled_function);
                    free(demangled_function);
                } else {
                    frame.function = std::string(function);
                }
            }

            frame.filename = (!filename) ? "[UNKNOWN]" : std::string(filename);
            frame.lineno = lineno;
            frame.addr = pc + 1;

            backtrace->insert(backtrace->begin(), frame);

            return 0;
        };

        std::vector<StackFrame> backtrace;
        backtrace_full(state, skip + 1, onStackFrame, onError, &backtrace);
        return backtrace;
    }

    std::vector<StackFrame> getBacktrace() {
        return getBacktrace(1);
    }
} // namespace Backtrace

void printCurrentBacktrace() {
    for (auto frame : Backtrace::getBacktrace()) {
        std::cout << frame.function << " @ " << frame.filename << " : " << frame.lineno << std::endl;
        printf("Address : %p\n", frame.addr);
    }

    std::cout << "==================================================" << std::endl;
}

void initialize(char * arg) {
    Backtrace::initialize(arg);
}

void recursion(int i) {
    if (i > 0) {
        printCurrentBacktrace();
        recursion(i - 1);
    }
}

int main(int argc, char* argv[]) {
    initialize(argv[0]);
    printCurrentBacktrace();
    recursion(2);
    return 0;
}
