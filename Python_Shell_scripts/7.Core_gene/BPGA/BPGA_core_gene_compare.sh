## 2. After all the core gene sequences are extracted, blastp searchh is performed to compare the core genes in original and simulated genome datasets.

# BPGA_core_gene_compare.sh (saved in the directory: "$PWD/Core_gene/BPGA_core_gene")
#!/bin/sh
species="Escherichia_coli"
group=random_$1

dir="$PWD/Core_gene/BPGA_core_gene"
path1="$dir/$species/$group"

cd $dir
bash blast_generate.sh $path1
mv blastp.sh $path1
bash $path1/blastp.sh
