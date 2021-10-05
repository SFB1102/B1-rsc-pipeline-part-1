# Patterns for OCR corrections for the Royal Society Corpus
# version: 4.0

# A selection of patterns from BestLcOCRRules
# Selected, Changed and Extended by Jörg Knappen
# Including patterns mined by Peter using word2vec and clustering

# Part 3: Suffixes (Only applied at the end of a "word")

s/allce\b/ance/g
s/allces\b/ances/g
s/allv\b/ally/g
s/atlce\b/ance/g
s/atlces\b/ances/g
s/atlt\b/ant/g
s/calne\b/came/g
s/creafing\b/creasing/g
# require 3 letters before "ecl\b" to exclude Decl./decl.
s/\([a-z]\{3\}\)ecl\b/\1ed/g
s/eitler\b/either/g
s/ellt\b/ent/g
s/ellts\b/ents/g
s/elnt\b/ent/g
s/elnts\b/ents/g
s/en-t\b/ent/g
s/en-ts\b/ents/g
s/erlt\b/ent/g
s/erlts\b/ents/g
s/ernt\b/ent/g
s/ernts\b/ents/g
s/etlt\b/ent/g
s/etlts\b/ents/g
s/iiig\b/ing/g
s/iilg\b/ing/g
s/iing\b/ing/g
s/illg\b/ing/g
s/illgs\b/ings/g
s/ilng\b/ing/g
s/ilngs\b/ings/g
s/imlum\b/imum/g
s/inig\b/ing/g
s/inigs\b/ings/g
s/inlg\b/ing/g
s/inlgs\b/ings/g
s/ioii\b/ion/g
s/ioiis\b/ions/g
s/ioil\b/ion/g
s/ioils\b/ions/g
s/ioin\b/ion/g
s/ioins\b/ions/g
s/ioin\b/ion/g
s/ioins\b/ions/g
s/ioll\b/ion/g
s/iolls\b/ions/g
s/ionn\b/ion/g
s/ionns\b/ions/g
s/iotn\b/ion/g
s/iorl\b/ion/g
s/iorls\b/ions/g
s/iorn\b/ion/g
s/iorns\b/ions/g
s/iotns\b/ions/g
s/irlg\b/ing/g
s/irlgs\b/ings/g
s/irng\b/ing/g
s/isll\b/ish/g
s/itlg\b/ing/g
s/itng\b/ing/g
s/itv\b/ity/g
s/iveiy\b/ively/g
s/lltly\g/ntly/g
s/meIlt\b/ment/g
s/meIlts\b/ments/g
s/melit\b/ment/g
s/melits\b/ments/g
s/merlt\b/ment/g
s/merlts\b/ments/g
s/mlent\b/ment/g
s/mlents\b/ments/g
s/mneter\b/meter/g
s/mneters\b/meters/g
s/ncss\b/ness/g
s/nefs\b/ness/g
s/nmeter\b/meter/g
s/nmeters\b/meters/g
s/ovv\b/ow/g
s/rnent\b/ment/g
s/rnents\b/ments/g
s/selvcs\b/selves/g
s/thougll\b/though/g
s/tiolz\b/tions/g
s/tiotl\b/tion/g
s/tiotls\b/tions/g
s/tlgh\b/ugh/g
s/tltly\g/ntly/g
s/ulgh\b/ugh/g
s/ullv\b/ully/g
s/utn\b/um/g
s/\(\w\)\+g,h\b/\1gh/g
# Patterns starting with some interpuctuation
s/ -and\b/ and/g
s/,-and\b/, and/g
s/; -and\b/; and/g
s/\.-and\b/\. and/g
s/:-and\b/: and/g
s/ -in\b/ in/g
s/,-in\b/, in/g
s/;-in\b/; in/g
s/\.-in\b/\. in/g
s/:-in\b/: in/g
s/-In\b/ In/g
s/ -of\b/ of/g
s/,-of\b/, of/g
s/;-of\b/; of/g
s/ -to\b/ to/g
s/,-to\b/, to/g
s/;-to\b/; to/g
s/ t his\b/ this/g
s/\s*-also\b/ also/g
s/\s*-any\b/ any/g
s/\s*-had\b/ had/g
s/\s*-has\b/ has/g
s/\s*-have\b/ have/g
s/\s*-nanner\b/ manner/g
s/\s*-more\b/ more/g
s/\s*-the\b/ the/g
s/\s*-their\b/ their/g
s/\s*-then\b/ then/g
s/\s*-they\b/ they/g
s/\s*-we\b/ we/g
s/\s*-were\b/ were/g
s/\s*-will\b/ will/g
s/'at\b/ at/g
s/'by\b/ by/g
s/'from\b/ from/g
s/'in\b/ in/g
s/'have\b/ have/g
s/'the\b/ the/g
s/'to\b/ to/g
s/'which\b/ which/g
s/'will\b/ will/g
s/'with\b/ with/g

