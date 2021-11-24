## Automatic simulation script (Each script should be saved and run separately).

## select.sh (select 100 random genomes from original big dataset)
#!/bin/sh
species=$1
random_num=random_$2

path1="$PWD/pan-genome_$species"
mkdir -p $path1/simulation/$random_num/ori_data
path2="$path1/simulation/$random_num"
path3="$path2/ori_data"

cp $(ls $path1/original_data/*.fna| sort -R | head -n 100) $path3
ls -d -1 $path3/*fna > $path3/list.txt
bash generate_number.sh $path3/list.txt > $path3/list_num.txt

#e.g. bash select.sh Escherichia_coli 01


## frag.sh (fragmentation simulation)
#!/bin/sh
species=$1
random_num=random_$2
frag=$3cut

path1="$PWD/pan-genome_$species"
path2="$path1/simulation/$random_num"
path3="$path2/ori_data"

python frag_dist.py $3 > fnumbers.txt
bash batch_sim.sh $path3/list_num.txt
mkdir -p $path2/simulation/$frag/100comp/data
path4="$path2/simulation/$frag"
path5="$path4/100comp/data"
mv $path3/*cut $path5
ls -d -1 $path5/*cut > $path5/list.txt
bash generate_number.sh $path5/list.txt > $path5/list_num.txt

#e.g. bash frag.sh Escherichia_coli 01 100

## comp.sh (completeness simulation)

#!/bin/sh
species=$1
random_num=random_$2
frag=$3cut
comp=$4comp

path1="$PWD/pan-genome_$species"
path2="$path1/simulation/$random_num"
path3="$path2/ori_data"
path4="$path2/simulation/$frag"
path5="$path4/100comp/data"

python comp_dist.py $4 > numbers.txt
bash batch_remove.sh $path5/list_num.txt
mkdir -p $path4/$comp/data
mv $path5/*comp $path4/$comp/data
path6="$path4/$comp"
ls -d -1 $path6/data/*comp > $path6/data/comp_list.txt
./generate_number.sh  $path6/data/comp_list.txt >  $path6/data/comp_list_num.txt

#e.g. bash comp.sh Escherichia_coli 01 100 99


## cont.sh (contamination simulation)
#!/bin/sh
species=$1
random_num=random_$2
frag=$3cut
comp=$4comp
cont=$5cont

path1="$PWD/pan-genome_$species"
path2="$path1/simulation/$random_num"
path3="$path2/ori_data"
path4="$path2/simulation/$frag"
path5="$path4/100comp/data"
path6="$path4/$comp"

python cont_dist.py $5 > cnumbers.txt
bash batch_cont.sh $path6/data/comp_list_num.txt
mkdir -p $path6/cont/$cont/data
mv $path6/data/*cont $path6/cont/$cont/data

#e.g. bash cont.sh Escherichia_coli 01 100 99 2.0
