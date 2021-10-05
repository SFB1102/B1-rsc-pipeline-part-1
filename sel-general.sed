# Patterns for OCR corrections for the Royal Society Corpus
# version: 4.0

# A selection of patterns from BestLcOCRRules
# Selected, Changed and Extended by Jörg Knappen
# Including patterns mined by Peter using word2vec and clustering

# Part 1: General patterns applied everywhere 

s/'I'he/The/g
s/'l'he/The/g
s/claa/cha/g
s/clh/ch/g
s/comlb/comb/g
s/comlp/comp/g
s/conla/conn/g
s/conlb/comb/g
s/conlc/conc/g
# Note:  s/\bconld\b/could/g
s/conld\(\w\)/cond\1/g
s/conlf/conf/g
s/conlg/cong/g
s/conll/conn/g
s/conlm/comm/g
s/conln/conn/g
s/conlp/comp/g
s/conls/cons/g
s/conlt/cont/g
s/conlv/conv/g
s/filnd/find/g
s/foulld/found/
s/foulnd/found/
s/fourld/found/g
s/ghlt/ght/g
s/glh/gh/g
s/gtlt/ght/g
s/ioIl/ion/g
s/ioln/ion/g
s/luinat/minat/g
s/meilt/ment/g
s/melnt/ment/g
s/menlt/ment/g
s/mient/ment/g
s/mnagnet/magnet/g
s/mnenit/ment/g
s/mnent/ment/g
s/mnetric/metric/g
s/nmetric/metric/g
s/o:ften/often/g
s/otlher/other/g
s/qll/qu/g
s/qtl/qu/g
s/spller/spher/g
s/tlh/th/g
s/tlz/th/g
s/tnent/ment/g
s/t}l/th/g
s/t}z/th/g
s/vvh/wh/g
s/wv/w/g
