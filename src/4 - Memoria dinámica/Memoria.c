#include "Memoria.h"

/* Pueden programar alguna rutina auxiliar acá */
uint32_t strLen_c(char *a) {
    uint32_t count = 0;
    while (*a != '\0')
    {
        count++;
        a++;
    }
    return count;
}

void strPrint_c(char *a, FILE *pFile) {
    if (a != NULL) fprintf(pFile, a);
    else fprintf(pFile, "NULL\n");
}

char* strClone_c(char *a) {
    uint32_t len = strLen_c(a) + 1; //incluyendo el /0
    char* clone = malloc(sizeof(char) * len);  //1*len
    char* clone_pointer = clone;
    while (len != 0)
    {
        *clone_pointer = *a;
        clone_pointer++;
        a++;
        len--;
    }
    return clone;
}

int32_t strCmp_c(char *a, char *b) {
    while (true)
    {
        if (*a == '\0' && *b == '\0') return 0;
        if (*a < *b || *a == '\0') return 1;
        if (*a > *b || *b == '\0') return -1;
        a++;
        b++;
    }   
}

int32_t strCmp_c2(char *a, char *b) {
    while (true)
    {
        char ch_a = *a;
        char ch_b = *b;
        if (ch_a == '\0') {
            if (ch_b == '\0') return 0;
            return 1;
        }
        if (ch_b == '\0') return -1;
        if (ch_a < ch_b) return 1;
        if (ch_a > ch_b) return -1;
        a++;
        b++;
    }
}

void strDelete_c(char *a) {
    free(a);
}
