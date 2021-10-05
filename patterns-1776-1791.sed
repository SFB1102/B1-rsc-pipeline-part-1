# Patterns to clean up the Royal Corpus
# For articles from 1772--1791

# Remove page numbers from inital pages (e.g., [ 17 ])
# Some special cases first: Patterns ending with M, Dr, DR, Sir, SIR, X
# where the last letter(s) need to be preserved
s/<page>[[aCcEeFfIiíjLlrtu125:;?!,.({/'] [0-9IiOo]* M/<page>M/g
s/<page>[[aCcEeFfIiíjLlrtu125:;?!,.({/'] [0-9IiOo]* Dr/<page>Dr/g
s/<page>[[aCcEeFfIiíjLlrtu125:;?!,.({/'] [0-9IiOo]* DR/<page>DR/g
s/<page>[[aCcEeFfIiíjLlrtu125:;?!,.({/'] [0-9IiOo]* Si/<page>Si/g
s/<page>[[aCcEeFfIiíjLlrtu125:;?!,.({/'] [0-9IiOo]* SI/<page>SI/g
s/<page>[[aCcEeFfIiíjLlrtu125:;?!,.({/'] [0-9IiOo]* X/<page>X/g

s/<page>[[aCcEeFfIiíjLlrtu125:;?!,.({/'] [0-9IiOo]* []aDgIiJjlostz12379_:^')}] */<page>/g


# Remove Figure plate placeholders
/^\s*<page>Philos.*<\/page>\s*$/d

# Cleaning footers
## Remove custodes and Bogensignaturen
s/^<\inferred>.*<\/inferred>-\{0,1\}<\/page>/<\/page>/
s/^.\{1,18\}<\/page>/<\/page>/
s/^V.*<\/page>/<\/page>/

# Cleaning headers
s/<page>.*[^>]$/<page>/

# Remove artifacts of continued quotation marks
s/\([a-z]\)`` /\1/g
s/^``\s*//g

