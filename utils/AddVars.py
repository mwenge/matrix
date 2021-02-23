import sys
import os
import re

if len(sys.argv) < 2:
    print("No filename given")
    exit()

fn = sys.argv[1]
if not os.path.isfile(fn):
    print(fn + " does not exist")
    exit()

f = open(fn, 'r')
ls = f.readlines()
f.close()

vs = {}
ols = []
for l in ls:
    exps = re.findall(r'\$[1-4]{1}[0-9A-F]{3}',l)
    vs.update({v.replace("$","f"): v for v in exps if v not in vs})
    ol = l
    for v in exps: ol = ol.replace(v, v.replace("$","f"))
    ols += ol

o = open(fn, 'w')
for v in vs: o.write(v + " = " + vs[v] + '\n')
o.write(''.join(ols))


