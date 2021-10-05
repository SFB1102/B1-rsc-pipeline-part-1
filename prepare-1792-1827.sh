#!/bin/bash

# Steps for the preparation of the Royal Corpus V1
# Here: Years 1792-1827

# Do something special for 10.2307_107231 (reorder pages) ?

# reorder pages

xsltproc --output transactions/fla/1807/10.2307_107231.xml --stringparam order "91, 92, 83, 84, 85, 86, 87, 88, 89, 90" pagesort.xsl transactions/fla/1807/10.2307_107231.xml

# Apply patterns to articles
for ((year=1792; year<1828; year++)); do sed -f patterns-1792-1827.sed  -i transactions/fla/$year/*.xml ; done
