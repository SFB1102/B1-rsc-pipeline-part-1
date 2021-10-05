#!/usr/bin/python

# make_vrt.py: Creates an XML file for import into cqp/cqpweb

import sys
import argparse         # requires python 2.7 or later
import lxml.etree as etree
import re
import os

def remove_lb(s):
  """ Removes linebreaks from a string and replaces them with a space.
      The reulting string is strip'ped from whitespace at ist ends. 
      We also apply some sanitising to the string (remove entities and
      tags)"""
  return s.replace("\n", " ").replace("&", "\\").replace("<", "\lt;").replace(">", "\gt;").strip()


aparser = argparse.ArgumentParser()
aparser.add_argument("--build", action="store", dest="build")
aparser.add_argument('filelist', nargs='+')
options = aparser.parse_args()

# usage = "Usage: make_vrt.py [--build=corpusBuild] inputfiles\n"
# if len(sys.argv) < 2:
#  print usage
#  exit()

jstor_prefix = "http://www.jstor.org/stable/"
n = 0
while n < len(options.filelist) :
  try:
    oldtree = etree.parse(options.filelist[n])
  except:
    print "Error parsing "+options.filelist[n]

  newtree = oldtree.find("pages")
  newtree.tag = "text"

  for list_item in newtree.findall('list-item'):
      list_item.tag = 'page'

  for t in newtree.findall("page[@table]"):
    if t.attrib["table"]=="yes":
      newtree.remove(t)  
    elif t.attrib["table"]=="no" or t.attrib["table"]=="mixed":
      del t.attrib["table"]
    
  newtree.set("id", remove_lb(oldtree.xpath("//article/id/text()")[0].split("/")[1]))
  newtree.set("issn", remove_lb(oldtree.xpath("//article/issn/text()")[0]))
  newtree.set("title", remove_lb(oldtree.xpath("//article/title/text()")[0]))
  newtree.set("fpage", remove_lb(oldtree.xpath("//article/fpage/text()")[0]))
  newtree.set("lpage", remove_lb(oldtree.xpath("//article/lpage/text()")[0]))
  newtree.set("year", remove_lb(oldtree.xpath("//article/year/text()")[0]))
  newtree.set("volume", remove_lb(oldtree.xpath("//article/volume/text()")[0]))
  newtree.set("journal", remove_lb(oldtree.xpath("//article/journaltitle/text()")[0]))

  authlist = oldtree.xpath("//article/authors/list-item/text()")
  authors  = remove_lb("|".join(authlist))

  newtree.set("author", authors)
  if "[Abstract]" in oldtree.xpath("//article/title/text()")[0]:
    newtree.set("type", "abs")
  else:
    newtree.set("type", remove_lb(oldtree.xpath("//article/type/text()")[0]))
  if options.build:
    newtree.set("corpusBuild", options.build)
  newtree.set("jstorLink", jstor_prefix+remove_lb(oldtree.xpath("//article/id/text()")[0].split("/")[1]))
# print etree.tostring(newtree)

  outfile = open(options.filelist[n]+".xml", "w")
  outfile.write(etree.tostring(newtree).replace("&#", "\#").replace("&quot;", "\quot;"))
  outfile.close()

# remove the original file (we won't hold superfluos copies)

  os.unlink(options.filelist[n])

# step the n in the while loop!
  n = n+1
