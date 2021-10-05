#!/usr/bin/python

# art_abs.py: Creates the relations between articles and abstracts
# Eingabe: art_abs.txt
#          + The Royal Society Corpus
# Ausgabe: Verbesserte Version des RSC

import sys
import lxml.etree as etree
import re
import os

infile = open("art_abs.txt", "r")

for zeile in infile:
  (article, abstract) = zeile.strip().split(" ")
  art_id = article.split("_")[-1]
  abs_id = abstract.split("_")[-1]
  art_file = article+".xml"
  abs_file = abstract+".xml"
  art_tree = etree.parse(art_file)
  text = art_tree.getroot()
  text.set("hasAbstract", abs_id)
  outfile = open(art_file, "w")
  outfile.write(etree.tostring(art_tree))
  outfile.close()
  abs_tree = etree.parse(abs_file)
  text = abs_tree.getroot()
  text.set("isAbstractOf", art_id)
  outfile = open(abs_file, "w")
  outfile.write(etree.tostring(abs_tree)) 
  outfile.close()

infile.close()
