#include <emscripten.h>

EMSCRIPTEN_KEEPALIVE
int add(int a, int b)
{
    return a + b;
}

EMSCRIPTEN_KEEPALIVE
int sub(int a, int b)
{
    return a - b;
}

EMSCRIPTEN_KEEPALIVE
int mul(int a, int b)
{
    return a * b;
}

EMSCRIPTEN_KEEPALIVE
int div(int a, int b)
{
    return a / b;
}