// #include <inttypes.h>
// #include <stdlib.h>
// #include <stdio.h>
// #include <llvm/IR/LLVMContext.h>
// #include <llvm/IR/Module.h>
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/ADT/Triple.h"

#include <iostream>
#include <sstream>
// #include <llvm/IR/GlobalVariable.h>

int main() {
    std::string moduleName = "__module__";
    std::unique_ptr<llvm::LLVMContext> context = std::make_unique<llvm::LLVMContext>();
    std::unique_ptr<llvm::Module> module = std::make_unique<llvm::Module>(moduleName, *context);
    std::unique_ptr<llvm::IRBuilder<>> builder = std::make_unique<llvm::IRBuilder<>>(*context);

    llvm::Triple triple = llvm::Triple(LLVM_DEFAULT_TARGET_TRIPLE);
    std::string tripleString = triple.getTriple();
    module -> setDataLayout("e-m:e-i64:64-f80:128-n8:16:32:64-S128");
    module -> setTargetTriple(tripleString);

    llvm::Type* structAnon = llvm::StructType::create(
            *context,  llvm::ArrayRef<llvm::Type *>({llvm::Type::getInt32Ty(*context), llvm::Type::getInt32Ty(*context), llvm::Type::getInt32Ty(*context)}), "struct.anon");
    llvm::GlobalVariable(*module, structAnon, false, llvm::GlobalValue::InternalLinkage, nullptr, "__LLVM_StackMaps");
}
