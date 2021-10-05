#undo_letterspacing.de

# Undo letterspacing

# With help from this answer: 
# http://unix.stackexchange.com/questions/213766/undo-letterspacing-with-sed

# Preparations

# Do something with isolated punctuation marks

s/??/§§/g
s/? \([1-9]\)/§ \1/g
s/ \([?\!;:,\.]\)/\1/g

# Now the real thing

s/ \([^ ][^ ]\)/\n\1/g
s/\([^ ][^ ]\) /\1\n/g
s/ //g;y/\n/ /

# Some post-processing

s/\bSI R\b/SIR/g
s/\bTRANSACTION S\b/TRANSACTIONS/g

