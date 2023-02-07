#include <emscripten.h>

static char b64table[65] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

EMSCRIPTEN_KEEPALIVE
int b64encode(unsigned char *data, int length, unsigned char *out)
{
    int outLength = 4 * ((length + 2) / 3);

    // iterate through three octets, output four base64 characters
    for (int i = 0, j = 0; i < length;)
    {
        unsigned int octet1 = i < length ? data[i++] : 0;
        unsigned int octet2 = i < length ? data[i++] : 0;
        unsigned int octet3 = i < length ? data[i++] : 0;

        // concatenate to get 24b = octet1 | octet2 | octet3
        unsigned int concat = (octet1 << 16) | (octet2 << 8) | (octet3);

        out[j++] = b64table[(concat >> 18) & 0x3f];
        out[j++] = b64table[(concat >> 12) & 0x3f];
        out[j++] = b64table[(concat >> 6) & 0x3f];
        out[j++] = b64table[(concat >> 0) & 0x3f];
    }

    int padding;
    switch (length % 3)
    {
    case 0:
        padding = 0;
        break;
    case 1:
        padding = 2;
        break;
    case 2:
        padding = 1;
        break;
    }
    for (int i = 0; i < padding; i++)
    {
        out[outLength - 1 - i] = '=';
    }

    return outLength;
}