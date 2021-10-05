#!/usr/bin/python

# topicalize.py

# Add topics to the rsc v2.0 (or later)  according to the topic model with
# 24 topics and random_seed 142

# The topic model is documented on the dokowiki under
# http://www.elts.uni-saarland.de/dokuwiki-2012-01-25a/doku.php?id=b1:corpora:royal_society:topic-modelling#topic_model_on_corpusbuild_20


import sys
import re
import lxml.etree as etree
import os

topic_name = ["Physiology I", "Solar System", "Chemistry I",
              "Terrestrial Magnetism", "Chemistry II", "Observation",
              "Geography", "Paleontology", "Formulae",
              "Electromagnetism", "French", "Meteorology",
              "Latin", "Experiment", "Weather",
              "Physiology II", "Botany", "Reproduction",
              "Optics", "Galaxy", "Mathematics",
              "Mechanics", "Headmatter", "Thermodynamics"]

infile = open("rsc_v2.0-24E-142-composition.txt", "r")

for zeile in infile:
  feld = zeile.strip().split("\t")
  if "#" not in feld[0]:
    current_file = feld[1].strip().replace("file:/home/knappen/MALLET/mallet-2.0.7/rsc_v2.0/","")
    topic = topic_name[int(feld[2].strip())]
    percentage = 100.0*float(feld[3].strip())
    topic2 = topic_name[int(feld[4].strip())]
    percentage2 = 100.0*float(feld[5].strip())
    try:
      tree = etree.parse(current_file)
      text = tree.getroot()
      text.set("primaryTopic", topic)
      text.set("primaryTopicPercentage", str(percentage))
      text.set("secondaryTopic", topic2)
      text.set("secondaryTopicPercentage", str(percentage2))
      outfile = open(current_file, "w")
      outfile.write(etree.tostring(tree))
      outfile.close()
    except:
      print ("Something went wrong while processing file "+current_file)
