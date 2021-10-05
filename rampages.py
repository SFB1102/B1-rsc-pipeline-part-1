#!/usr/bin/python

# rampages.py: Removes specified pages from an XML file
# Argument inputfile: A file that containt the xml files to change, 
# one per line followed by a space and the list of pages to remove.
# In the input file, the first page is numbered "1", "0" denotes the last page
# The list of pages must be in ascending order.
# When you want to remove more than one page from the end, use "0,0" etc.

import sys
import lxml.etree as etree
import re
import os

usage = "Usage: rampages.py inputfile\n"
if len(sys.argv) != 2:
  print usage
  exit()

infile = open(sys.argv[1], "r")

for line in infile:
  (file,rest) = line.strip().split(" ")
  pagelist = rest.split(",")
  indices = [(int(j)-1) for j in pagelist]
  indices.reverse()
  # Reversing the list is necessary, because pages get renumbered after
  # removal
  try:
    text = etree.parse(file)
  except:
    print "Error parsing "+file

  root=text.getroot()
  for i in indices:
    root.remove(root[i])

  outfile = open(file, "w")
  outfile.write(etree.tostring(text).replace("&#", "\#").replace("&quot;", "\quot;"))
  outfile.close()

