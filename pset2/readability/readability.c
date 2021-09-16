#include <stdio.h>
#include <cs50.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

int main(void)
{
    string text = get_string("Text: ");
    int letters = 0;
    int words = 1;
    int sentences = 0;
    float L = 0;
    float S = 0;
    float index = 0;

    for (int i = 0, sl = strlen(text); i < sl; i++)
    {
        if (isalpha(text[i]))
        {
            letters++;
        }

        if (text[i] == ' ')
        {
            words++;
        }

        if ((text[i] == '.') || (text[i] == '!') || (text[i] == '?'))
        {
            sentences++;
        }
    }

    L = (float) letters / (float) words * 100;
    S = (float) sentences / (float) words * 100;
    index = 0.0588 * L - 0.296 * S - 15.8;

    if (round(index) > 16)
    {
        printf("Grade 16+\n");

    }
    else
    {

        if (round(index) < 1)
        {
            printf("Before Grade 1\n");

        }
        else
        {

            printf("Grade %i\n", (int) round(index));
        }
    }
}