import sys
import os

o = open("../src/charset.asm", 'r')
charmap = {l[60:63].strip().upper():l[65:].strip() 
             for l in o.readlines() 
             if "CHARACTER" in l and l[65:].strip() != ""}

ls = "$75,$76,$77".split(",")

r = [charmap[c]  if c in charmap else "" for c in ls]
print(','.join(r))
