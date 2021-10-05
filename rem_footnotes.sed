#rem_footnotes.sed

# We attempt to remove footnotes from the Royal Society Corpus

# The first footnote is marked with a star (usually attached to a word
# or a formula. The text of the first footnote is preceeded by " * ".
# We will remove evrything from this indicator (including the indicator itself)
# to the end of page.
# The footnote marker itself is left in the text.

# Not 100% foolproof, but pages where the pattern occurs for other reasons
# are often consisting of figures, formulae, or tabular material

# This pattern does not work for some of the older texts where line breaks
# are preserved.

s/\(<page>.*\*.*\) \* .*\(<\/page>\)/\1\2/g
