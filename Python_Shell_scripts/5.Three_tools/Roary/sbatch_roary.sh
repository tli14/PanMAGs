#!/bin/sh
species=$1
random_num=random_$2

path1="$PWD/pan-genome_$species"
path2="$path1/simulation/$random_num"
path3="$path2/ori_data" # original genomes
path4="$path2/simulation/100cut"
path5="$path4/100comp" # fragmentated genomes
path6="$path4/99comp" # incomplete genomes
path7="$path4/99comp/cont/2.0cont"  # contaminated genomes
mkdir -p pan-genome/rad_roary
dir="pan-genome/rad_roary"

# original genomes
mkdir -p $path2/ori_roary
ls $path3/*prokka/*gff > $path3/gff_list
sleep 5
bash gen_gff.sh
mv gff.sh $path3
cd $path3
bash gff.sh gff_list
sleep 5
cd $dir
bash roary.sh $path2/ori_roary $path3
mv i90cd100.sh $path2/ori_roary
bash $path2/ori_roary/i90cd100.sh
sleep 5

# fragmentated genomes
mkdir -p $path5/roary
ls $path5/data/*prokka/*gff > $path5/data/gff_list
sleep 5
bash gen_gff.sh
mv gff.sh $path5/data
cd $path5/data
bash gff.sh gff_list
sleep 10
cd $dir
bash roary.sh $path5/roary $path5/data
mv i90cd100.sh $path5/roary
bash $path5/roary/i90cd100.sh
sleep 5

# incomplete genomes
mkdir -p $path6/roary
ls $path6/data/*prokka/*gff > $path6/data/gff_list
sleep 5
bash gen_gff.sh
mv gff.sh $path6/data
cd $path6/data
bash gff.sh gff_list
sleep 5
cd $dir
bash roary.sh $path6/roary $path6/data
mv i90cd100.sh $path6/roary
bash $path6/roary/i90cd100.sh
sleep 5

# contaminated genomes
mkdir -p $path7/roary
ls $path7/data/*prokka/*gff > $path7/data/gff_list
sleep 5
bash gen_gff.sh
mv gff.sh $path7/data
cd $path7/data
bash gff.sh gff_list
sleep 5
cd $dir
bash roary.sh $path7/roary $path7/data
mv i90cd100.sh $path7/roary
bash $path7/roary/i90cd100.sh
sleep 5
