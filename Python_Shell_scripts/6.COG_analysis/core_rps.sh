## 6. Run rps-blast (Use 100% core genes as example).
# core_rps.sh

#!/bin/sh
species=$1
random_num=random_$2
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
dir="COG/COG_analysis"

python gene_id_extract.py $path2/gene_presence_absence.csv # extract gene ids
mv output.txt $path2/gene_presence_absence.csv.gene_id
less $path2/gene_presence_absence.csv.gene_id | awk '$2==100' | cut -f 1 > $path2/gene_presence_absence.csv.gene_id.core.txt # Here, use 100% core gene threshold.
python extract_core_gene_faa.py $path2/gene_presence_absence.csv.gene_id.core.txt $path2/pan_genome_reference.fa
python DNA_to_protein.py $path2/pan_genome_reference.fa.core
bash rpsblast_batch.sh $path2/pan_genome_reference.fa.core.protein.fa
mv rpsblast.sh $path2
bash $path2/rpsblast.sh
