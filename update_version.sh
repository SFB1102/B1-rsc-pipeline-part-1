#!/bin/bash

# Import some variables

. ./prepare_all.cfg

echo "Updating some version stamps, version=$CORPUS_BUILD"

for i in hyphen_repair.sed sel-*.sed;  do sed -e "s/\# version:.*/\# version: $CORPUS_BUILD/g" -i $i; done

