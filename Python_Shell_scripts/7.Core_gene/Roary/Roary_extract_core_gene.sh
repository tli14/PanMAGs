## 1. Extract core gene representative sequences from pan-genome reference.
mkdir -p $PWD/Core_gene/Roary_core_gene

# Roary_extract_core_gene.sh (saved in the directory: "$PWD/Core_gene/Roary_core_gene")

#!/bin/sh
species=$1
random_num=random_$2
core=100 # core gene (CG) threshold
#frag=$3cut
#comp=$4comp
#cont=$5cont

path1="$PWD/pan-genome_$species/simulation/$random_num"
# for original genomes
path2="$path1/ori_roary"
# for fragmentated genomes
#path2="$path1/simulation/$frag/100comp/roary/i90cd100"
# for incomplete genomes
#path2="$path1/simulation/$frag/$comp/roary/i90cd100"
# for contaminated genomes
#path2="$path1/simulation/$frag/$comp/cont/$cont/roary/i90cd100"

cd $PWD/Core_gene/Roary_core_gene
python gene_id_extract.py $path2/gene_presence_absence.csv # extract gene ids
mv output.txt $path2/gene_presence_absence.csv.gene_id
less $path2/gene_presence_absence.csv.gene_id | awk '$2=="'$core'"'  | cut -f 1 > $path2/gene_presence_absence.csv.gene_id.CG_$core.txt
# less $path2/gene_presence_absence.csv.gene_id | awk '$2>="'$core'"'  | cut -f 1 > $path2/gene_presence_absence.csv.gene_id.CG_$core.txt
python extract_core_gene_faa.py $path2/gene_presence_absence.csv.gene_id.CG_$core.txt $path2/pan_genome_reference.fa
mv $path2/pan_genome_reference.fa.core $path2/core_genome_reference.CG_$core
python DNA_to_protein.py $path2/core_genome_reference.CG_$core
