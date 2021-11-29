## Compare two phylogenetic trees by using ETE3 toolkit.

# tree_compare.sh
#!/bin/sh
group=random_$1
# for tree based on gene presence and absence
path="$PWD/phylogenetic_tree/gene_presence_absence/EC_10_datasets/$group"
# for tree based on core gene alignment
#path="$PWD/phylogenetic_tree/gene_presence_absence/EC_10_datasets/$group"

ete3 compare -r $path/EC_ori.nw -t $path/EC_50cut.nw $path/EC_99comp.nw $path/EC_2.0cont.nw --unrooted --taboutput > $path/compare.tab
