## 1. Sort file (3.ctrl_G2.txt) to get the representative core record number.
mkdir -P Core_gene/BPGA_core_gene

# BPGA_extract_core.sh (saved in the directory: "Core_gene/BPGA_core_gene")
#!/bin/sh
species="Escherichia_coli"
group=random_$1
file="ori" # ori or comp folder

mkdir -P $PWD/Core_gene/BPGA_core_gene/$species/$group/$file
dir="$PWD/Core_gene/BPGA_core_gene"
path1="$dir/$species/$group/$file"

# From BPGA outputs, the file "3.ctrl_G2.txt" is moved to the corresponding folder created above.
less $path1/3.ctrl_G2.txt | cut -f 1 | uniq -c |sort -nr | awk '$1==100' | awk '{print$2}' | sort -n > $path1/core_100
less $path1/3.ctrl_G2.txt | cut -f 1 | uniq -c |sort -nr | awk '$1>=99' | awk '{print$2}' | sort -n > $path1/core_99
less $path1/3.ctrl_G2.txt | cut -f 1 | uniq -c |sort -nr | awk '$1>=98' | awk '{print$2}' | sort -n > $path1/core_98
less $path1/3.ctrl_G2.txt | cut -f 1 | uniq -c |sort -nr | awk '$1>=95' | awk '{print$2}' | sort -n > $path1/core_95
less $path1/3.ctrl_G2.txt | cut -f 1 | uniq -c |sort -nr | awk '$1>=90' | awk '{print$2}' | sort -n > $path1/core_90
cd $path1
python $dir/BPGA_extract_ref_core_seq.py ref.txt cluster_gi_ref.txt
