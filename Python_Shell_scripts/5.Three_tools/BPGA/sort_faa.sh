# sort_faa.sh
#!/bin/sh
random_num=random_$1

path1="$PWD/pan-genome_Escherichia_coli/simulation/$random_num"
path2="$path1/simulation/50cut"
path3="$path2/99comp"
path4="$path3/cont/2.0cont"
mkdir -p pan-genome/BPGA
dir="$PWD/pan-genome/BPGA"

## Move faa files for original dataset.
ls $path1/ori_data/*prokka/*faa > $path1/ori_data/faa_list
bash gen_faa.sh
mv faa.sh $path1/ori_data
cd $path1/ori_data
bash faa.sh faa_list
mkdir faa_file_$1
mv *faa ./faa_file_$1
mkdir -p $dir/EC_ori
mv faa_file_$1 $dir/EC_ori


## Move faa files for fragmentation dataset.
cd $dir
ls $path2/100comp/data/*prokka/*faa > $path2/100comp/data/faa_list
bash gen_faa.sh
mv faa.sh $path2/100comp/data
cd $path2/100comp/data
bash faa.sh faa_list
mkdir faa_file_$1
mv *faa ./faa_file_$1
mkdir -p $dir/EC_frag
mv faa_file_$1 $dir/EC_frag


## Move faa files for incompleteness dataset.
cd $dir
ls $path3/data/*prokka/*faa > $path3/data/faa_list
bash gen_faa.sh
mv faa.sh $path3/data
cd $path3/data
bash faa.sh faa_list
mkdir faa_file_$1
mv *faa ./faa_file_$1
mkdir -p $dir/EC_comp
mv faa_file_$1 $dir/EC_comp


## Move faa files for contamination dataset.
cd $dir
ls $path4/data/*prokka/*faa > $path4/data/faa_list
bash gen_faa.sh
mv faa.sh $path4/data
cd $path4/data
bash faa.sh faa_list
mkdir faa_file_$1
mv *faa ./faa_file_$1
mkdir -p $dir/EC_cont
mv faa_file_$1 $dir/EC_cont
