# fasttree_generate.sh (saved in the directory: "$PWD/phylogenetic_tree/fasttree")

path1=$1
path2=$2
file=$3
cat << EOF> fasttree_build.sh
#!/bin/sh
FastTree -nt $path1/core_gene_alignment.aln > $path2/$file
EOF>
