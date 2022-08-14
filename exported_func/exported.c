#include <emscripten.h>
#include <stdlib.h>

extern unsigned int curTime();
extern void logProgress(double progress);

int main() { return 0; }

EMSCRIPTEN_KEEPALIVE
unsigned char *randString(int len)
{
    unsigned char *str = malloc(len + 1);

    srand(curTime());

    for (int i = 0; i < len; i++)
    {
        // generate a printable character
        str[i] = rand() % (127 - 33) + 33;
        logProgress((double)(i + 1) / (double)len);
        for (int j = 0; j < 100000000; j++)
        {
        }
    }

    str[len] = 0;
    return str;
}