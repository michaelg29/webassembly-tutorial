#include <emscripten.h>
#include <stdlib.h>

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
void *wasmmalloc(int size)
{
    return malloc(size);
}

EMSCRIPTEN_KEEPALIVE
void wasmfree(void *ptr)
{
    free(ptr);
}