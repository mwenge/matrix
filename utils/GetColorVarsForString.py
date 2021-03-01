import sys
import os

colormap = {
    "$00": "BLACK",
    "$01": "WHITE",
    "$02": "RED",
    "$03": "CYAN",
    "$04": "PURPLE",
    "$05": "GREEN",
    "$06": "BLUE",
    "$07": "YELLOW",
    "$08": "ORANGE",
    "$09": "BROWN",
    "$0A": "LTRED",
    "$0B": "GRAY1",
    "$0C": "GRAY2",
    "$0D": "LTGREEN",
    "$0E": "LTBLUE",
    "$0F": "GRAY3",
    }

ls = "$00,$06,$02,$04,$05,$03,$07,$01".split(",")

r = [colormap[c]  if c in colormap else "" for c in ls]
print(','.join(r))
