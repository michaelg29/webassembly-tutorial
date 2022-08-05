#include <emscripten.h>
#include <stdlib.h>

extern void print(int arg);
extern unsigned char randomNum(unsigned char min, unsigned char max);

int main() { return 0; }

EMSCRIPTEN_KEEPALIVE
unsigned char *randString(int len)
{
    unsigned char *str = malloc(len + 1);
    print((int)str);

    for (int i = 0; i < len; i++)
    {
        unsigned char c = randomNum(33, 126);
        str[i] = c;
    }

    return str;
}