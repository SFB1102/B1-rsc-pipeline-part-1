# Some patterns to clean the Proceedings of the RSC

# Remove some strange headline relics
s/\s*\[Recess.*<\/page>/<\/page>/g

# Remove adjounement notes from the end of a session
s/The Society \(then \)\{0,1\}adjourned.*<\/page>/<\/page>/g

# Remove Bogensignaturen starting with "VOL"
s/VOL.*<\/page>/<\/page>/g

# Remove simple Bogensignaturen
s/[1-9] [A-Z]<\/page>/<\/page>/g
s/[1-9] [A-Z] 2<\/page>/<\/page>/g
s/[A-Z]<\/page>/<\/page>/g
s/[A-Z] 2<\/page>/<\/page>/g
s/2<\/page>/<\/page>/g

