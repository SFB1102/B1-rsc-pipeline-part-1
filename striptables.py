#!/usr/bin/python

# Reads a file, deletes everything from a a single line containing
# only "<table>" upto a single line containing "</table>"; including 
# the tag lines. Overwrites the original file.

# Input: The name of the file to  process

import sys
import re
import os
import shutil

usage = "Usage: striptables.py inputfile\n"
if len(sys.argv) != 2:
  print usage
  exit()

infile = open(sys.argv[1], "r")
outfile = open(sys.argv[1]+"_tmp","w")

state = 0  # Copy lines
for zeile in infile:
  if zeile.strip() == "<table>":
    state = 1 # Drop lines
  if state==0:
    outfile.write(zeile)
  if zeile.strip() == "</table>":
    state=0

infile.close()
outfile.close()

os.remove(sys.argv[1])
shutil.move(sys.argv[1]+"_tmp",sys.argv[1])
