# 4. Pan-genome analysis by using Roary.

#!/bin/sh
species=Escherichia_coli
path="$PWD/pan-genome_$species"

mkdir -p $path/original_roary
ls $path/original_data/*prokka/*gff > $path/original_data/gff_list
bash gen_gff.sh
mv gff.sh $path/original_data
bash $path/original_data/gff.sh $path/original_data/gff_list
sleep 10
bash roary_species.sh $species
mv i90cd100.sh $path/original_roary
bash $path/original_roary/i90cd100.sh
