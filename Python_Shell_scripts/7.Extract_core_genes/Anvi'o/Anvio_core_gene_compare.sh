# Anvio_core_gene_compare.sh (saved in the directory: "Core_gene/Anvio_core_gene")

#!/bin/sh
species="Escherichia_coli"
group=random_$1

dir="$PWD/Core_gene/Anvio_core_gene"
path1="$dir/$species/$group"

cd $path1
bash $dir/blast_generate.sh $path1
mv blastp.sh $path1
bash $path1/blastp.sh
