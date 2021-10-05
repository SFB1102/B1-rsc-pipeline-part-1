# Some patterns to clean the Abstracts printed

# Remove adjounement notes from the end of a session
s/The Society \(then \)\{0,1\}adjourned.*<\/page>/<\/page>/g

# Page numbers at start of page
s/<page>\([0-9I]\{1,4\}\) /<page id=\"\1\">/g

# Remove Bogensignaturen starting with "VOL"
s/VOL.*<\/page>/<\/page>/g

# Remove simple Bogensignaturen
s/[1-9] [A-Z]<\/page>/<\/page>/g
s/[1-9] [A-Z] 2<\/page>/<\/page>/g
s/[A-Z]<\/page>/<\/page>/g
s/[A-Z] 2<\/page>/<\/page>/g
s/2<\/page>/<\/page>/g



