#!/usr/bin/python

# find_pairs.py: Finde Paare von Artikel und Abstrakt
#                Eingabe: all_titles.txt
#                Ausgabe: art_abs.txt

import sys
import os
import re

lastfile = "dummy"
lasttitle = "dummy"

infile = open("all_titles.txt", "r")
outfile = open("art_abs.txt", "w")

for line in infile:
  (thisfile, thistitle) = line.split(":", 1)
  if "abs_" in thisfile or "proceeding" in thisfile:
    if "[Abstract]" in thistitle:
      if (lasttitle.strip()+". [Abstract]")  in thistitle:
        outfile.write(lastfile+" "+thisfile+"\n")
      if (lasttitle.strip()+" [Abstract]")  in thistitle:
        outfile.write(lastfile+" "+thisfile+"\n")
  lastfile=thisfile
  lasttitle=thistitle

outfile.close()
infile.close()
