# Remove superfluous spaces
# \+ is a GNU extension to sed syntax (is there someone with an sed without
# it?---Use \{1,\} instead!)
s/^\s\+//g
s/\s\+/ /g
s/\s\+$//g
s/<page>\s\+/<page>/g

# We reveal some "hidden markup" from the text

s/&lt;inferred&gt;/<inferred>/g
s/&lt;\/inferred&gt;/<\/inferred>/g
s/&lt;sup&gt;/<sup>/g
s/&lt;\/sup&gt;/<\/sup>/g
s/&lt;sub&gt;/<sub>/g
s/&lt;\/sub&gt;/<\/sub>/g

