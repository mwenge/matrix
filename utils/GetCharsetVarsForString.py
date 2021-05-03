import sys
import os
import re

o = open("../src/c64/charset.asm", 'r')
charmap = {l[60:63].strip().upper():l[65:].strip() 
             for l in o.readlines() 
             if "CHARACTER" in l and l[65:].strip() != ""}

s = """
shipExplosionAnimation .BYTE $73,$74,$76,$40
"""
ls = re.split("([, \n])", s)

r = [charmap[c]  if c in charmap else c for c in ls]
print(''.join(r))
