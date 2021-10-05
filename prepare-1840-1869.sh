#!/bin/bash

# Steps for the preparation of the Royal Corpus V1
# Here: Years 1840-1869

# Apply patterns to articles
for ((year=1840; year<1870; year++)); do sed -f all_caps.sed  -i transactions/fla/$year/*.xml ; done

for ((year=1840; year<1870; year++)); do sed -f patterns-1840-1869.sed  -i transactions/fla/$year/*.xml ; done

