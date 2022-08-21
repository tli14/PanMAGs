## 3. After blastp search, the results are summarized.

# Roary_summary.sh (saved in the directory: "$PWD/Core_gene/Roary_core_gene")
#!/bin/sh
species="Escherichia_coli"
group=random_$1
path1="$PWD/pan-genome_$species/simulation/$group"
path2="$path1/ori_roary/i90cd100"
path3="$path1/simulation/50cut/99comp/roary/i90cd100"
dir="$PWD/Core_gene/Roary_core_gene/$species/$group"

less $dir/100core_compare | awk -F "\t" '$3>=90' | cut -f 1 | uniq -c | wc -l >> core_shared
less $path2/core_genome_reference.CG_100 | grep ">" | wc -l >> core_in_ori
less $path3/core_genome_reference.CG_100 | grep ">" | wc -l >> core_in_simulation


## 4. All the summary files are combined to calculate the correctly identified / falsely assigned core genes.
less CG.txt | while read line; do for i in {1..10}; do echo "$line"; done; done > CG # CG.txt - one CG threshold per line. Repeat each CG threshold 10 times for summary file preparation.
paste CG core_shared core_in_simulation core_in_ori > summary_file
less summary_file | awk -F "\t" '{print$1"\t"$2"\t"$3"\t"$4"\t"$2/$4"\t"$3-$2}'> summary.txt
