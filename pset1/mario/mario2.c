#include <stdio.h>
#include <cs50.h>

int main(void)
{
    int height;

    do
    {
        height = get_int("height: ");
    }

    while (height <= 0 || height > 8);

    for (int i = 0; i < height; i++)
    {
        for (int j = -1; j < i; j++)
        {
            printf("#");
        }

        for (int j = 0; j <= i; j++)
        {
            printf(" ");
        }

        printf("\n");
    }
}