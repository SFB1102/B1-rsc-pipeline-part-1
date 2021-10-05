#!/bin/bash

# Import some variables

. ./prepare_all.cfg

echo "preparing the Royal Corpus, corpusBuild=$CORPUS_BUILD"

echo "cleaning up old files and directories"
# Cleanup

rm -rf transactions
rm -rf abs_communicated
rm -rf abs_printed
rm -rf proceedings
rm -f remaining_footers.txt
rm -f all_titles.txt art_abs.txt
mkdir transactions
mkdir abs_communicated
mkdir abs_printed
mkdir proceedings

# Copy from the source again

echo "copying the source files"
cp -r $RSC_SOURCE_DIR/transactions/fla ./transactions
cp -r $RSC_SOURCE_DIR/transactions/brv ./transactions
cp -r $RSC_SOURCE_DIR/abs_communicated/fla ./abs_communicated
cp -r $RSC_SOURCE_DIR/abs_printed/fla ./abs_printed
cp -r $RSC_SOURCE_DIR/proceedings/fla ./proceedings
cp -r $RSC_SOURCE_DIR/proceedings/nws ./proceedings
cp -r $RSC_MANUAL_CORR_DIR/transactions ./
cp -r $RSC_MANUAL_CORR_DIR/abs_communicated/fla ./abs_communicated
cp -r $RSC_MANUAL_CORR_DIR/abs_printed/fla ./abs_printed
cp -r $RSC_MANUAL_CORR_DIR/proceedings/fla ./proceedings
cp -r $RSC_MANUAL_CORR_DIR/proceedings/nws ./proceedings
cp -r $RSC_MANUAL_CORR_DIR_2/transactions ./

# Remove "Meteorological Journal" tables

rm -f `grep -l "<title>Meteorological Journal" transactions/fla/*/*`

# Remove some other articles consisting almost completely of tables

rm -f transactions/fla/1733/10.2307_103813 transactions/fla/1733/10.2307_103824 transactions/fla/1733/10.2307_103825 transactions/fla/1733/10.2307_103853.xml

# Remove two "pageless" articles (cannot be converted to XML)
rm -f transactions/fla/1695/10.2307_102417 transactions/fla/1753/10.2307_105129

# Remove "textless" article (pure metadata)
rm -f transactions/fla/1726/10.2307_103488

# Remove another three "textless" article (the whole text consists in pages 
# containing "**"
rm -f transactions/fla/1700/10.2307_102739
rm -f transactions/fla/1700/10.2307_102740
rm -f transactions/fla/1739/10.2307_104336

# Remove article that states only "temporaily unavailable"
rm -f transactions/fla/1780/10.2307_106385

# Remove errata with incomplete metadata
rm -f proceedings/fla/1854/10.2307_111722
rm -f proceedings/fla/1856/10.2307_111337
rm -f proceedings/fla/1856/10.2307_111338
rm -f proceedings/fla/1856/10.2307_111339
rm -f proceedings/fla/1856/10.2307_111340

# The following very short article causes a problem with the 
# Genzel-Charniak script
rm -f proceedings/fla/1863/10.2307_111984

# Remove tables from the following articles
echo "removing tables"
for i in transactions/fla/1684/10.2307_102026 transactions/fla/1684/10.2307_102105 transactions/fla/1685/10.2307_102186 transactions/fla/1685/10.2307_102187 transactions/fla/1686/10.2307_101865 transactions/fla/1686/10.2307_101871 transactions/fla/1686/10.2307_101906 transactions/fla/1695/10.2307_102334 transactions/fla/1717/10.2307_103358 transactions/fla/1726/10.2307_103448 transactions/fla/1731/10.2307_104108 transactions/fla/1735/10.2307_103965 transactions/fla/1737/10.2307_103929 transactions/fla/1739/10.2307_104254 transactions/fla/1749/10.2307_104642 transactions/fla/1759/10.2307_105384 transactions/fla/1763/10.2307_105694 transactions/fla/1764/10.2307_105543; do ./striptables.py $i; done

# Build the list of all titles
echo "building the list of all titles"
grep "<title>" */*/*/* | sed -e "s/<title>//" -e "s/<\/title>//"| sort -t ":" -k 2 > ./all_titles.txt
./find_pairs.py

# Create intermediate xml format (was named vrt until v 1.3)

echo "converting file format to cpq-friendly XML"
# We don't need to create "one word per line" at this stage; the importing
# tools take care for it (and for handling interpunctuation)

for ((year=1665; year<1870; year++)); do  if [ -d transactions/fla/$year ]; then sed -f remempty.sed -i  transactions/fla/$year/* ; fi; done

for ((year=1665; year<1762; year++)); do  if [ -d transactions/brv/$year ]; then sed -f remempty.sed -i  transactions/brv/$year/* ; fi; done

for ((year=1665; year<1870; year++)); do  if [ -d transactions/fla/$year ]; then ./make_vrt3.py --build=$CORPUS_BUILD transactions/fla/$year/*; fi; done;

for ((year=1665; year<1762; year++)); do  if [ -d transactions/brv/$year ]; then ./make_vrt3.py --build=$CORPUS_BUILD transactions/brv/$year/*; fi; done;

for year in 1843 1850; do ./make_vrt3.py  --build=$CORPUS_BUILD abs_communicated/fla/$year/*; done

for year in 1800 1815 1830 1837; do ./make_vrt3.py  --build=$CORPUS_BUILD abs_printed/fla/$year/*; done

for year in 1854  1856  1857  1859  1860  1862  1863  1865  1866  1867  1868  1869; do ./make_vrt3.py --build=$CORPUS_BUILD proceedings/*/$year/*; done

./rampages.py rampages_list.txt

# Add the hasAbstract/isAbstractOf relation to the relevant xml filess

echo "correlating articles and their abstracts"
./art_abs.py

# un-hide hidden markup. We do this last to avoid mangling of the additional
# markup by make_vrt.py
echo "running some very simple patterns on all files"

for ((year=1665; year<1870; year++)); do  if [ -d transactions/fla/$year ]; then sed -f postprocess.sed  -i transactions/fla/$year/*.xml ; fi; done

for ((year=1665; year<1762; year++)); do  if [ -d transactions/brv/$year ]; then sed -f postprocess.sed  -i transactions/brv/$year/*.xml ; fi; done

for year in 1843 1850; do sed -f postprocess.sed -i abs_communicated/fla/$year/*.xml; done

for year in 1800 1815 1830 1837; do sed -f postprocess.sed -i abs_printed/fla/$year/*.xml; done

for year in 1854  1856  1857  1859  1860  1862  1863  1865  1866  1867  1868  1869; do sed -f postprocess.sed -i proceedings/*/$year/*.xml; done

# Remove footnote
echo "removing footnotes"

# Special treatment for some articles to prevent the removal of real text
sed -e "s/, Number of Blows.*1-X I//" -i transactions/fla/1822/10.2307_107684.xml

sed -e "s/\* F/\*F/" -i transactions/fla/1868/10.2307_108916.xml

for ((year=1665; year<1870; year++)); do  if [ -d transactions/fla/$year ]; then sed -f rem_footnotes.sed  -i transactions/fla/$year/*.xml ; fi; done

for ((year=1665; year<1762; year++)); do  if [ -d transactions/brv/$year ]; then sed -f rem_footnotes.sed  -i transactions/brv/$year/*.xml ; fi; done

for year in 1843 1850; do sed -f rem_footnotes.sed -i abs_communicated/fla/$year/*.xml; done

for year in 1800 1815 1830 1837; do sed -f rem_footnotes.sed -i abs_printed/fla/$year/*.xml; done

for year in 1854  1856  1857  1859  1860  1862  1863  1865  1866  1867  1868  1869; do sed -f rem_footnotes.sed -i proceedings/*/$year/*.xml; done

# Remove extremly short pages (otherwise tags may be removed leading to 
# invalid xml later on)

# sed -i -e "/^\s*<page>.\{0,12\}<\/page>\s*$/d" transactions/*/*/*.xml

# Remove pages shorter than 129 characters in one line. This removes 1294 
# pages (by inspection, they all containt more or less junk from OCR'ed
# figures and tables)

sed -i -e "/^\s*<page>.\{0,128\}<\/page>\s*$/d" transactions/*/*/*.xml

# Run the period specific scripts
echo "preparing years 1665--1775 (including the book reviews)"
./prepare-1665-1775.sh
echo "preparing years 1776--1791"
./prepare-1776-1791.sh
echo "preparing years 1792--1827"
./prepare-1792-1827.sh
echo "preparing years 1828--1839"
./prepare-1828-1839.sh
echo "preparing years 1840--1869"
./prepare-1840-1869.sh
echo "preparing the Abstracts Communicated (1843, 1850)"
./prepare-communicated.sh
echo "preparing the Abstracts Printed (1800, 1815, 1830, 1837)"
./prepare-printed.sh
echo "preparing the proceedings (1854--1869)"
./prepare-proceedings.sh

# Undo letterspacing
echo "undoing letterspacing"
sed -f undo_letterspacing.sed -i transactions/*/*/*.xml
sed -f undo_letterspacing.sed -i abs_*/*/*/*.xml
sed -f undo_letterspacing.sed -i proceedings/*/*/*.xml

# Remove hyphenation over page breaks (needs to be applied twice)
echo "removing hyphenation over page breaks"
sed -f prefixhyphens.sed -i transactions/*/*/*.xml
sed -f prefixhyphens.sed -i abs_*/*/*/*.xml
sed -f prefixhyphens.sed -i proceedings/*/*/*.xml
sed -f fixhyphens.sed -i transactions/*/*/*.xml
sed -f fixhyphens.sed -i abs_*/*/*/*.xml
sed -f fixhyphens.sed -i proceedings/*/*/*.xml
sed -f fixhyphens.sed -i transactions/*/*/*.xml
sed -f fixhyphens.sed -i abs_*/*/*/*.xml
sed -f fixhyphens.sed -i proceedings/*/*/*.xml

echo "repairing some more hyphenations"
sed -f hyphen_repair.sed -i transactions/*/*/*.xml
sed -f hyphen_repair.sed -i abs_*/*/*/*.xml
sed -f hyphen_repair.sed -i proceedings/*/*/*.xml

# This one takes too long time to run every time
# for i in transactions/fla/*/*.xml; do sed -f BestLcOCRRules.sed  $i > "$i"2; done

# We apply only a selection of the rules, fine tuned to our corpus ...
echo "prenormalising the whole corpus (lots of patterns)"
sed -f selection8.sed -i transactions/*/*/*.xml
sed -f selection8.sed -i abs_*/*/*/*.xml
sed -f selection8.sed -i proceedings/*/*/*.xml
echo "running the patterns a second time"
sed -f selection8.sed -i transactions/*/*/*.xml
sed -f selection8.sed -i abs_*/*/*/*.xml
sed -f selection8.sed -i proceedings/*/*/*.xml

# Quality Assurance: Test that all xml files are well-formed

echo "Testing the well-formedness of the XML files"
for i in transactions/*/*/*.xml; do xmllint --noout $i; done
for i in abs*/*/*/*.xml; do xmllint --noout $i; done
for i in proceedings/*/*/*.xml; do xmllint --noout $i; done
echo "Tests for well-formedness completed"
