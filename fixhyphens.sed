#fixhyphens.sed

# This sed pattern removes hyphens at the end of a page and throws the whole
# word to the new page.

# Input: 
# la bla bla experi-</page>
# </page>ment bla bla bla

# Output:
# la bla bla</page>
# </page>experiment bla bla bla

# Reference: http://unix.stackexchange.com/questions/255541/remove-hyphenation-with-sed

# Note: Needs to be applied twice because of consecutive hyphens

/\s\S*-<\/page>$/{
N
s/\s\(\S*\)-\(<\/page>\)\n\(<page\sid=\"[0-9a-z]\+\">\)/\2\n\3\1/g
s/\s\(\S*\)-\(<\/page>\)\n\(<page>\)/\2\n\3\1/g
}
