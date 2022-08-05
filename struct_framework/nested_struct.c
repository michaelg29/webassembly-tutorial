#include <emscripten.h>
#include <stdlib.h>

typedef struct {
    char *first;
    char *last;
} name;

typedef struct {
    int a;
    int b;
    name n;
} pair;

int main() { return 0; }

EMSCRIPTEN_KEEPALIVE
void *createPair(int a, int b) {
    pair *ret = malloc(sizeof(pair));

    ret->a = a;
    ret->b = b;
    ret->n.first = "michael";
    ret->n.last = "grieco";

    return ret;
}

EMSCRIPTEN_KEEPALIVE
int sum(pair *p) {
    return p->a + p->b;
}

EMSCRIPTEN_KEEPALIVE
void *wasmmalloc(size_t n) {
    return malloc(n);
}

EMSCRIPTEN_KEEPALIVE
void wasmfree(void *ptr) {
    free(ptr);
}