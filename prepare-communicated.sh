#!/bin/bash

# Steps for the preparation of the Royal Corpus V1
# Here: Abstracts Communicated

# Apply patterns to articles

for year in 1843 1850; do sed -f patterns-communicated.sed -i abs_communicated/fla/$year/*.xml; done

