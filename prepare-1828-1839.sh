#!/bin/bash

# Steps for the preparation of the Royal Corpus V1
# Here: Years 1828-1839

# Reorder pages

xsltproc --output  transactions/fla/1828/10.2307_107833.xml --stringparam order "4,5,6,7,8,9,10,11,12,13,14,1,2,3" pagesort.xsl  transactions/fla/1828/10.2307_107833.xml

# Apply patterns to articles
for  ((year=1828; year<1840; year++)); do sed -f all_caps.sed  -i transactions/fla/$year/*.xml ; done

for ((year=1828; year<1840; year++)); do sed -f patterns-1828-1839.sed  -i transactions/fla/$year/*.xml ; done

