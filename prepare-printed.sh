#!/bin/bash

# Steps for the preparation of the Royal Corpus V1
# Here: Abstracts Printed

# Apply patterns to articles

for year in 1800 1815 1830 1837; do sed -f patterns-printed.sed -i abs_printed/fla/$year/*.xml; done

