#include <emscripten.h>
#include <stdlib.h>

extern void printNameToConsole(char *str);

typedef struct
{
    int val;
    int a;
} sub_s;

typedef struct
{
    int a;
    int b;
    sub_s structure;
    int **ptr;
    int *int_arr;
    int arr_size;
    char *name;
} s;

int main() { return 0; }

EMSCRIPTEN_KEEPALIVE
s *createStruct(int a, int b, int l, int c)
{
    s *ret = malloc(sizeof(s));
    ret->a = a;
    ret->b = b;
    ret->structure.val = l;
    ret->structure.a = c;
    return ret;
}

EMSCRIPTEN_KEEPALIVE
int computeSum(s *obj)
{
    return obj->a * obj->b + obj->structure.val / obj->structure.a;
}

EMSCRIPTEN_KEEPALIVE
int getPtr(s *obj)
{
    return obj->ptr[0][0];
}

EMSCRIPTEN_KEEPALIVE
int compSumTerminator(s *obj)
{
    int sum = 0;
    int i = 0;
    while (obj->int_arr[i])
    {
        sum += obj->int_arr[i++];
    }
    return sum;
}

EMSCRIPTEN_KEEPALIVE
int compSumSize(s *obj)
{
    int sum = 0;
    for (int i = 0; i < obj->arr_size; i++)
    {
        sum += obj->int_arr[i];
    }
    return sum;
}

EMSCRIPTEN_KEEPALIVE
void printName(s *obj)
{
    printNameToConsole(obj->name);
}

EMSCRIPTEN_KEEPALIVE
void *wasmmalloc(int size)
{
    return malloc(size);
}

EMSCRIPTEN_KEEPALIVE
void wasmfree(void *ptr)
{
    free(ptr);
}