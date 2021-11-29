## 2. After all the core gene sequences are extracted, blastp searchh is performed to compare the core genes in original and simulated genome datasets.

# Roary_core_gene_compare.sh (save in the directory: "Core_gene/Roary_core_gene")
#!/bin/sh
species="Escherichia_coli"
group=random_$1

mkdir -p $PWD/Core_gene/Roary_core_gene/$species/$group
path1="$PWD/pan-genome_$species/simulation/$group"
path2="$path1/ori_roary/i90cd100"
path3="$path1/simulation/50cut/99comp/roary/i90cd100"
dir="$PWD/Core_gene/Roary_core_gene"
path4="$dir/$species/$group"

cd $dir
bash blast_generate.sh $path3 $path2 $path4
mv blastp.sh $path4
bash $path4/blastp.sh
