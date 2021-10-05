#!/bin/bash

# Steps for the preparation of the Royal Corpus V1
# Here: Years 1776-1791

# Apply patterns to articles
for ((year=1776; year<1792; year++)); do sed -f patterns-1776-1791.sed  -i transactions/fla/$year/*.xml ; done

# Create a list of defective footers for manual postprocessing
for ((year=1776; year<1792; year++)); do grep ".\+<\/page>" transactions/fla/$year/*.xml >>remaining_footers.txt ; done

# wc remaining_footers.txt
#   1082  13414 124883 remaining_footers.txt
# -- There are 1082 lines left for inspection

