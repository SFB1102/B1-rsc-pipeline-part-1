#prefixhyphens.sed

# Sometimes, pagenumbers get in out way. When a hyphen before a page number
# was removed, we find relics like:

# la bla bla experi234-</page>
# </page>ment bla bla bla

# We undo this first

s/\([a-z]\{2\}\)[0-9]\+\(<\/page>\)/\1-\2/g

