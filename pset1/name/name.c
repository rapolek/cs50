#include <cs50.h>
#include <stdio.h>
#include <string.h>
 
int main(void)
{
    string name = get_string("Name: ");
    
    for (int i = 0, n = strlen(name); i < n; i++)
    {
        printf("%c\n", name[i]);
    }
}