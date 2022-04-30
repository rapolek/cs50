credit = input("Number: ")

x = credit[-2::-2]
y = credit[-1::-2]

sum1 = 0
sum2 = 0

for n in x:
    a = int(n) * 2
    if a > 9:
        b = a // 10
        c = a % 10
        sum1 = sum1 + b + c
    else:
        sum1 += a

for n in y:
    sum2 += int(n)

total = sum1 + sum2

if total % 10 == 0:
    first = credit[0]
    second = credit[1]
    if first == '3' and (second == '4' or second == '7'):
        print("AMEX")

    elif first == '5' and (second == '1' or second == '2' or second == '3' or second == '4' or second == '5'):
        print("MASTERCARD")

    elif first == '4':
        print("VISA")
else:
    print("INVALID")
