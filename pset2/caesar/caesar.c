#include <stdio.h>
#include <cs50.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

//get key
int main(int argc, string argv[])
{
    //make sure the argument consists of 2 arguments
    if (argc != 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }

    //iterate over each character of the 1st argument, reject the argument if it isn't entirely made up of digits
    for (int j = 0, alen = strlen(argv[1]); j < alen; j++)
    {
        string argument1 = argv[1];
        char ac = argument1[j];

        if (!isdigit(ac))
        {
            printf("Usage: ./caesar key\n");
            return 1;
        }
    }

    //convert string to int
    int key = atoi(argv[1]);

    //get plaintext
    string plaintext = get_string("plaintext: ");
    printf("ciphertext: ");

    //iterate over each character of the plaintext
    for (int i = 0, len = strlen(plaintext); i < len; i++)
    {
        char c = plaintext[i];

        //encipher and print ciphertext
        if (islower(c))
        {
            printf("%c", (c - 97 + key) % 26 + 97);
        }
        else if (isupper(c))
        {
            printf("%c", (c - 65 + key) % 26 + 65);
        }
        else
        {
            printf("%c", c);
        }

    }

    printf("\n");

}