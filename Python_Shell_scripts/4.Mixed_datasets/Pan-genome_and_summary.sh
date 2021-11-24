## Perform pan-genome analysis for mixed datasets.
## software: roary


## roary_generate.sh
percent=$1
sim_group=sim_$2

cat << EOF> i90cd100.sh
#!/bin/sh
roary -f $PWD/pan-genome/MAG_percentage/EC_test/sim_data/MAG_$1/$sim_group/roary/i90cd100 -i 90 -cd 100 -s -e -n -v $PWD/pan-genome/MAG_percentage/EC_test/sim_data/MAG_$1/$sim_group/data/*gff
EOF


## roary_submit.sh
#!/bin/sh
percent=$1
sim_group=sim_$2

path1="$PWD/pan-genome/MAG_percentage/EC_test"
path2="$path1/sim_data/MAG_$percent"

mkdir -p $path2/$sim_group/roary
bash roary_generate.sh $1 $2
cp i90cd100.sh $path2/$sim_group/roary/i90cd100.sh
bash $path2/$sim_group/roary/i90cd100.sh


## When the roary pan-genome analysis is finished, the results can be summarized.
## roary_summary_results.sh
#!/bin/sh
for i in {10,40,60,85}; do
  for j in {01..10}; do
    python roary_sum.py $i $j
  done
done
