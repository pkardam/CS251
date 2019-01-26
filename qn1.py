import sys
print(sys.argv[1])

items={
    '0':0,
    '1':1,
    '2':2,
    '3':3,
    '4':4,
    '5':5,
    '6':6,
    '7':7,
    '8':8,
    '9':9,
    'A':10,
    'B':11,
    'C':12,
    'D':13,
    'E':14,
    'F':15,
    'G':16,
    'H':17,
    'I':18,
    'J':19,
    'K':20,
    'L':21,
    'M':22,
    'N':23,
    'O':24,
    'P':25,
    'Q':26,
    'R':27,
    'S':28,
    'T':29,
    'U':30,
    'V':31,
    'W':32,
    'X':33,
    'Y':34,
    'Z':35
    }
a = raw_input()
neg = 1
dot = 0
l = raw_input()
invalid = 0
base = 0
n = 0
for val in l:
    if ord(val)>=ord('0') and ord(val)<=ord('9'):
        base = base*10+ord(val)-ord('0')
        m=base
    else:
        invalid=1

if base<2 or base>36:
    invalid=1
if invalid==0:
    for val in a:
        if val == '-' and  a[0]=='-' and neg==1:
            neg = -1
        elif val == '.':
            dot = dot + 1
        elif val in items.keys() and items[val]<base and dot==0:
            n=n*base+items[val]
        elif val in items.keys() and items[val]<base and dot==1:
            n=n+1.0*items[val]/m
            m=m*base
        else:
            invalid=1
            
if invalid != 0:
    print ('Invalid input')
else:
    print (neg*n)