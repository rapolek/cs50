#include <stdio.h>
#include <stdlib.h>
#include <cs50.h>

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        printf("missing command line argument\n");
        return 1;
    }

    //continue
    if (argc == 2)
    {
        FILE *f = fopen(argv[1], "r");

        if (argv[1] == NULL)
        {
            printf("image cannot be opened\n");
            return 1;
        }

        unsigned char buffer[512];

        bool JPEG = false;

        int JPEGTtotal = 0;

        FILE *image = NULL;

        //repeat until end of file
        while (fread(buffer, sizeof(buffer), 1, f) == 1)
        {
            int x = 0xff;
            int y = 0xd8;
            int z = 0xff;

            //
            if (buffer[0] == x && buffer[1] == y && buffer[2] == z && (buffer[3]& 0xf0) == 0xe0)
            {
                //if found as start of new jpeg
                if (JPEG == true)
                {
                    fclose(image);
                }
                else
                {
                    JPEG = true;
                }

                char filename[0];
                sprintf(filename, "%03i.jpeg", JPEGTtotal);
                JPEGTtotal++;

                //open a new file and write in it
                image = fopen(filename, "w");
            }

            if (JPEG)
            {
                fwrite(buffer, sizeof(buffer),1 , image);
            }
        }
        //close all files
        fclose(image);
        fclose(f);
    }
    return 0;
}