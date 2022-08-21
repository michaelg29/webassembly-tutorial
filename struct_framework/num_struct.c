#include <emscripten.h>
#include <stdlib.h>

typedef struct
{
    int a;
    int b;
} pair;

int main() { return 0; }

EMSCRIPTEN_KEEPALIVE
float computeSum(pair *p)
{
    return p->a + p->b;
}

EMSCRIPTEN_KEEPALIVE
pair *createPair(int a, int b)
{
    pair *p = malloc(sizeof(pair));
    p->a = a;
    p->b = b;
    return p;
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