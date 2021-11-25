## 7. Select non-overlap domains for rps-blast results and assign the COG categories. (Should be run after the rpsblast step)

# rpsblast_to_COG.sh
#!/bin/sh
species=$1
random_num=random_$2
#frag=$3cut
#comp=$4comp
#cont=$5cont

path1="$PWD/pan-genome_$species/simulation/$random_num"
# for original genomes
path2="$path1/ori_roary"
# for fragmentated genomes
#path2="$path1/simulation/$frag/100comp/roary/i90cd100"
# for incomplete genomes
#path2="$path1/simulation/$frag/$comp/roary/i90cd100"
# for contaminated genomes
#path2="$path1/simulation/$frag/$comp/cont/$cont/roary/i90cd100"
dir="COG/COG_analysis"

python rps_select.py $path2/pan_genome_reference.fa.core.protein.fa_rpsblast_output
python rps2COG.py $path2/pan_genome_reference.fa.core.protein.fa_rpsblast_output.non-overlap $dir/cddid_all.tbl $dir/cog-20.def.tab
less $path2/pan_genome_reference.fa.core.protein.fa_rpsblast_output.non-overlap.COG | cut -f 4 | sort | uniq -c | sort -n -r > $path2/pan_genome_reference.fa.core.protein.fa_rpsblast_output.non-overlap.COG.count
