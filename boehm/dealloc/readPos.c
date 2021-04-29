#include <stdio.h>

int readPos() {
    FILE* fptr = fopen("pos.txt", "r");
    int pos = 0;
    fscanf (fptr, "%d", &pos);    
    while (!feof (fptr)) {
        fscanf (fptr, "%d", &pos);      
    }
    printf("%d\n", pos);
    return pos;
}
