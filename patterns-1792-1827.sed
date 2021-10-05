# some pattern to purge the royal corpus (years 1792-1827)

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
# Removing first part of Bogensignatur
s/MDC.\{0,22\}<\/page>/<\/page>/g

# Removing second part of Bogensignatur

# In the newer ones, only a space separates the Bogensignatur from 
# the main texts (we do not touch cases where it is directly attached)
s/\s[2-9\$SsI]\s\{0,1\}[A-Z]\s\{0,1\}2<\/page>/<\/page>/g
s/\s[A-Z]\s\{0,1\}[A-Za-z]\s\{0,1\}[A-Za-z]\s\{0,1\}2<\/page>/<\/page>/g
s/\s[A-Z]\s\{0,1\}[A-Za-z]\s\{0,1\}2<\/page>/<\/page>/g
s/\s[A-Z]\s\{0,1\}2<\/page>/<\/page>/g

# In one article of 1796 there are still continued quotation marks.
# Remove artifacts of continued quotation marks
s/\([a-z]\)`` /\1/g
s/^``\s*//g

