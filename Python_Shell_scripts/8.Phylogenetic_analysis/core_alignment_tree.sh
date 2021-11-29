## Build tree based on core gene alignment by using fasttree
mkidr -p phylogenetic_tree/fasttree

## Change genome ids for tree comparison.
# core_alignment_tree.sh (saved in the directory: "$PWD/phylogenetic_tree/fasttree")

#!/bin/sh
species="Escherichia_coli"
group=random_$1
sim="ori" # "50cut", "99comp" or "2.0cont"
file="EC_$sim"

path1="$PWD/pan-genome_$species/simulation/$group"
# for original genomes
path2="$path1/ori_data"
path3="$path1/ori_roary/i90cd100"
# for fragmentated genomes
#path2="$path1/simulation/50cut/100comp/data"
#path3="$path1/simulation/50cut/100comp/roary/i90cd100"
# for incomplete genomes
#path2="$path1/simulation/50cut/99comp/data"
#path3="$path1/simulation/50cut/99comp/roary/i90cd100"
# for contaminated genomes
#path2="$path1/simulation/50cut/99comp/cont/2.0cont/data"
#path3="$path1/simulation/50cut/99comp/cont/2.0cont/roary/i90cd100"
mkdir -p $PWD/phylogenetic_tree/fasttree/EC_10_datasets/$group
dir="$PWD/phylogenetic_tree/fasttree/EC_10_datasets"

cd $PWD/phylogenetic_tree/fasttree
bash fasttree_generate.sh $path3 $dir/$group $file
mv fasttree_build.sh $path3
bash $path3/fasttree_build.sh
cd $path2
ls *.prokka.gff > list_$sim
less list_$sim | awk 'BEGIN{FS=OFS="."}{NF--; print}' >  $dir/$group/id_$sim
cd $PWD/phylogenetic_tree/fasttree
less $dir/$group/id_ori | awk -F "_" '{print $1"_"$2}' > $dir/$group/new_id # run this line only for original genome datasets
paste -d '\t' $dir/$group/id_$sim $dir/$group/new_id > $dir/$group/new_id_$sim
cd $PWD/phylogenetic_tree
python change_tree_id.py $dir/$group/new_id_$sim $dir/$group/$file
