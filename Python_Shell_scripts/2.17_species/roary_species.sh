# 3. Pan-genome analysis by using Roary v3.13 (sequence identity 90%; core gene threshold 100%)

## roary_species.sh

species=$1
cat << EOF> i90cd100.sh
#!/bin/sh
roary -f $PWD/pan-genome_$species/original_roary/i90cd100 -i 90 -cd 100 -s -e -n -v $PWD/pan-genome_$species/original_data/*gff
EOF
