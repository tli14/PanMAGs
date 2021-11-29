## 1. Extract core genes from anvi'o outputs
mkdir -P $PWD/Core_gene/Anvio_core_gene

# Anvio_extract_core.sh (saved in the directory: "$PWD/Core_gene/Anvio_core_gene")

#!/bin/sh
species="Escherichia_coli"
group=random_$1
file="ori" # ori or comp folder

mkdir -p $PWD/Core_gene/Anvio_core_gene/$species/$group/$file
# original genomes
path1="$PWD/pan-genome_$species/simulation/$group/ori_data"
# incomplete genomes
#path1="$PWD/pan-genome_$species/simulation/$group/simulation/50cut/99comp/data"
path2="$PWD/Core_gene/Anvio_core_gene/$species/$group"
dir="$PWD/Core_gene/Anvio_core_gene"

# Unzip the anvi'o summary file.
gunzip -k $path1/pan_sum/ECtest_gene_clusters_summary.txt.gz
mv $path1/pan_sum/ECtest_gene_clusters_summary.txt $path2/$file

# List the core gene families in anvio results under different core gene thresholds.
less $path1/pan_sum/misc_data_items/default.txt | awk '$2>=90' | awk 'NR>1' > $path2/$file/90core_set.txt # core gene (CG) threshold: 90%
cd $path2/$file
less 90core_set.txt |  awk '$2==100' > 100core_set.txt
less 90core_set.txt |  awk '$2>=99'  > 99core_set.txt
less 90core_set.txt |  awk '$2>=98'  > 98core_set.txt
less 90core_set.txt |  awk '$2>=95'  > 95core_set.txt

# Extract core gene representatives under different core gene thresholds.
python $dir/extract_all_fasta_seq.py ECtest_gene_clusters_summary.txt 90core_set.txt
python $dir/Anvio_extract_ref_core_seq.py 90core_set.txt 90core_set.txt.fasta
