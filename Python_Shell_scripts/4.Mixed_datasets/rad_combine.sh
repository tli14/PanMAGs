## Generate mixed datasets with different percentage of MAGs.
## Use Escherichia coli as example species

#!/bin/sh
percent=$1 # percentage of MAGs in the new dataset
sim_group=sim_$2 # the id number of the newly generated combined dataset

# Prepare the original dataset and simulated MAG dataset.
mkdir -p $PWD/pan-genome/MAG_percentage/EC_test
path1="$PWD/pan-genome/MAG_percentage/EC_test"
mkdir -p $path1/EC_ori_gff
mkdir -p $path1/EC_100cut_99comp
cp $PWD/pan-genome_Escherichia_coli/simulation/random_001/ori_data/*gff $path1/EC_ori_gff # The original dataset contains 100 complete genomes
cp $PWD/pan-genome_Escherichia_coli/simulation/random_001/100cut/99comp/data/*gff $path1/EC_100cut_99comp # The simulated MAG dataset contains 100 genomes with an average of 100 fragmentation and 99% completeness
cd $path1/EC_ori_gff
ls *gff | awk -F '.' '{print $1"."$2"."$3}' > ori_list
cd $path1/EC_100cut_99comp
ls *gff | awk -F '.' '{print $1"."$2"."$3}' > sim_list

# Generate mixed dataset according to the percentage of MAGs.
mkdir -p $path1/sim_data/MAG_$percent
path2="$path1/sim_data/MAG_$percent"
mkdir -p $path2/$sim_group/data
cp $(ls $path1/EC_100cut_99comp/*gff | sort -R | head -n $percent) $path2/$sim_group/data # The number of genomes is 100, so the percentage (e.g, 80%) means that 80 simulated MAG genomes in the new dataset.
cd $path2/$sim_group/data
ls *gff | awk -F '.' '{print $1"."$2"."$3}' > $path2/$sim_group/data/sim_list
cd $path1
python copy_ori_file.py $path1/EC_ori_gff/ori_list $path2/$sim_group/data/sim_list $1 $2
