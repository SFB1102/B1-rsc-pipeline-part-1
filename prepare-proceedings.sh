#!/bin/bash

# Steps for the preparation of the Royal Corpus V1
# Here: Proceedings of the Royal Society

# Apply patterns to articles
for year in 1854  1856  1857  1859  1860  1862  1863  1865  1866  1867  1868  1869; do sed -f patterns-proceedings.sed -i proceedings/*/$year/*.xml; done

