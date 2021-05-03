import sys
import os

o = open("../src/c64/charset.asm", 'r')
charmap = {l[60:63].strip().upper():l[65:].strip() 
             for l in o.readlines() 
             if "CHARACTER" in l and l[65:].strip() != ""}

ls = "$08,$03,$04,$05,$06,$0A,$13,$14,$15".split(",")

r = [charmap[c]  if c in charmap else "" for c in ls]
print(', '.join(r))
