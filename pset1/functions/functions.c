#include <stdio.h>
#include <cs50.h>
#include <string.h>

string str(string hello);
int count(int n);
void nothing(void);
void four(int i, string s, char c);

int main(void)
{
    string hi = "hi";
    printf("%s\n", str(hi));

    int x = 3;
    printf("%i\n", count(x));

    nothing();

    int i = 1;
    string s = "string";
    char c = 'c';
    four(i, s, c);
}

string str(string hello)
{
    return hello;
}

int count(int n)
{
    return n + 2;
}

void nothing(void)
{
    printf("hello world \n");
}

void four(int i, string s, char c)
{
    printf("%i\n" "%s\n" "%c\n", i, s, c);
}
