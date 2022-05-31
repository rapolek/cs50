import csv
import re
import sys
from sys import argv, exit

# create a function that finds the longest run of consecutive STRs


def longest_match(seq, subseq):
    count = 0
    while(True):
        count += 1
        if (re.search(subseq * count, seq) == None):
            break

    return count - 1
    

# make sure the number of command-line arguments is 3
if len(argv) != 3:
    print("Usage: python dna.py data.csv sequence.txt")

# open the CSV file and read its contents into memory
database = csv.DictReader(open(argv[1]))
data = []

'''
for one_dict in database:
    data.append(one_dict)

database =  csv.DictReader(open(argv[1]))
'''
# open the DNA sequence and read its contents into memoryf = open(argv[2])
f = open(argv[2])
sequence = f.read()

# compute the longest run of consecutive repeats of the STR in the DNA sequence
dicty = {}

for subsequence in database.fieldnames[1:]:
    dicty[subsequence] = longest_match(sequence, subsequence)

# find and print match
for one_dicty in database:
    match = True
    for subseq in dicty:
        if (dicty[subseq] != int(one_dicty[subseq])):
            match = False
            break

    if(match == True):
        print(one_dicty[database.fieldnames[0]])
        sys.exit()

print('No match')







# open and read csv

# open and read txt


