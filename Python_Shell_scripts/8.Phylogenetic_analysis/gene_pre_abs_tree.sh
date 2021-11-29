## Change genome ids for tree comparison

# gene_pre_abs_tree.sh (saved in the directory: "$PWD/phylogenetic_tree/gene_presence_absence")
#!/bin/sh
species="Escherichia_coli"
group=random_$1
sim="ori" # "50cut"/"100cut", "99comp" or "2.0cont"
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

mkdir -p $PWD/phylogenetic_tree/gene_presence_absence/EC_10_datasets/$group
dir="$PWD/phylogenetic_tree/gene_presence_absence/EC_10_datasets"

cd $path2
ls *.prokka.gff > list_$sim
less list_$sim | awk 'BEGIN{FS=OFS="."}{NF--; print}' > $dir/$group/id_$sim
cp $path3/accessory_binary_genes.fa.newick $dir/$group/$file
cd $PWD/phylogenetic_tree/gene_presence_absence
less $dir/$group/id_ori | awk -F "_" '{print $1"_"$2}' > $dir/$group/new_id # run this line only for original genomes
paste -d '\t' $dir/$group/id_$sim $dir/$group/new_id > $dir/$group/new_id_$sim
cd $PWD/phylogenetic_tree
python change_tree_id.py $dir/$group/new_id_$sim $dir/$group/$file
