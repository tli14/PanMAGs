## Perform COG functional analysis for core gene families after pan-genome analysis

## 1. Make and change directory for COG analysis
mkdir -p $PWD/COG/COG_CDD
cd $PWD/COG/COG_CDD

## 2. Download COG conserved domain database (CDD) from NCBI.
wget "ftp://ftp.ncbi.nih.gov/pub/mmdb/cdd/little_endian/Cog_LE.tar.gz"
tar -xvzf Cog_LE.tar.gz
rm Cog_LE.tar.gz

## 3. Download the table matching CDD ids and COG ids.
mkdir -p $PWD/COG/COG_analysis
cd $PWD/COG/COG_analysis
wget "ftp://ftp.ncbi.nih.gov/pub/mmdb/cdd/cddid_all.tbl.gz"
gunzip cddid_all.tbl.gz

## 4. Download the table matching COG ids and COG categories.
wget "ftp://ftp.ncbi.nih.gov/pub/COG/COG2020/data/cog-20.def.tab"
