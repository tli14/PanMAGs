## Perform prokka annotation.

#!/bin/sh
species=$1
random_num=random_$2

path1="$PWD/pan-genome_$species"
path2="$path1/simulation/$random_num"
path3="$path2/ori_data" # original genomes
path4="$path2/simulation/100cut"
path5="$path4/100comp/data" # fragmentated genomes
path6="$path4/99comp/data" # incomplete genomes
path7="$path4/99comp/cont/2.0cont/data" # contaminated genomes

mkdir -p $PWD/pan-genome/rad_prokka
cd $PWD/pan-genome/rad_prokka

bash prokka_generate.sh $path3/*fna
mv prokka.sh $path3
bash $path3/prokka.sh
sleep 5
bash prokka_generate.sh $path5/*cut
mv prokka.sh $path5
bash $path5/prokka.sh
sleep 5
bash prokka_generate.sh $path6/*comp
mv prokka.sh $path6
bash $path6/prokka.sh
sleep 5
bash prokka_generate.sh $path7/*cont
mv prokka.sh $path7
bash $path7/prokka.sh
sleep 5
