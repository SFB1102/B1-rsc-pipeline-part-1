#!/bin/bash

# Steps for the preparation of the Royal Corpus V1
# Here: Years 1665-1791

# Reorder pages
xsltproc --output transactions/fla/1677/10.2307_101782.xml --stringparam order "907 905 906" pagesort.xsl transactions/fla/1677/10.2307_101782.xml

# Apply patterns to articles
for ((year=1665; year<1776; year++)); do if [ -d transactions/fla/$year ]; then sed -f patterns-1665-1775.sed  -i transactions/fla/$year/*.xml ; fi; done

for ((year=1665; year<1776; year++)); do if [ -d transactions/brv/$year ]; then sed -f patterns-1665-1775.sed  -i transactions/brv/$year/*.xml ; fi; done

# Create a list of defective footers for manual postprocessing
for ((year=1665; year<1776; year++)); do if [ -d transactions/fla/$year ]; then grep ".\+<\/page>" transactions/fla/$year/*.xml >>remaining_footers.txt ; fi; done

for ((year=1665; year<1776; year++)); do if [ -d transactions/brv/$year ]; then grep ".\+<\/page>" transactions/brv/$year/*.xml >>remaining_footers.txt ; fi; done

# wc remaining_footers.txt
#   1082  13414 124883 remaining_footers.txt
# -- There are 1082 lines left for inspection

