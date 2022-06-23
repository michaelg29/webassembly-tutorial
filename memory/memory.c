#include <emscripten.h>

int main() { return 0; }

EMSCRIPTEN_KEEPALIVE
int accumulate(int *arr, int n)
{
    int sum = 0;
    while (n)
    {
        sum += arr[--n];
    }
    return sum;
}

EMSCRIPTEN_KEEPALIVE
const char *getString()
{
    return "Hello, asdfasdfgagyhaqwetrqew!";
}