# prompt the user for a string
text = input("Text: ")

letters = 0
words = 0
sentences = 0

# count the number of letters, words, and sentences in the text
for i in text:
    if i.isalpha() == True:
        letters += 1
    if i == " ":
        words += 1
    if i == "!" or i == "?" or i == ".":
        sentences += 1

words = words + 1

# calculate grade level
L = letters / words * 100
S = sentences / words * 100

index = 0.0588 * L - 0.296 * S - 15.8

grade = round(index)

# print output
if (grade < 1):
    print("Before Grade 1")
elif (grade > 16):
    print("Grade 16+")
else:
    print("Grade", grade)