# Some patterns to clean the Abstracts Communicated

# Remove adjounement notes from the end of a session
s/The Society then adjourned.*<\/page>/<\/page>/g

# Remove Bogensignatur starting in PROCEEDINGS OF THE ROYAL SOCIETY. VOL.
s/PR.\{40,70\}<\/page>/<\/page>/g

# Remove Bogensignatur consisting of digit(s) and star
s/[0-9I]\{1,2\} \{0,1\}\*<\/page>/<\/page>/g

# Page numbers at start of page
s/<page>\([0-9I]\{1,4\}\) /<page id=\"\1\">/g
