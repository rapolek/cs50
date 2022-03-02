from cs50 import get_int
import sys

# create a variable called 'height'
height = 0

# if the user fails to provide an integer between 1 and 8, re-prompt for the same again
while height < 1 or height > 8:
    height = get_int("height: ")

# print the pyramid
for i in range(height):
    print(" " * (height - 1 - i), end="")
    print("#" * (i + 1))
