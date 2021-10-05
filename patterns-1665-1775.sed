# Patterns to clean up the Royal Corpus
# For articles from 1665--1775

# Move page numbers in the <page> tag
s/<page>[[(]\s*\([0-9cdijlmvx]\{1,8\}\)\s*[])]/<page id=\"\1\">/g

# Remove Figure plate placeholders
/^\s*<page>Philos.*<\/page>\s*$/d

# Cleaning footers
## Remove custodes and Bogensignaturen
s/^<\inferred>.*<\/inferred>-\{0,1\}<\/page>/<\/page>/
s/^.\{1,18\}<\/page>/<\/page>/
s/^V.*<\/page>/<\/page>/

# Remove artifacts of continued quotation marks
s/\([a-z]\)`` /\1/g
s/^``\s*//g
