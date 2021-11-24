## Calculate average nucleotide identity (ANI) by using fastANI.
# software: fastANI/1.32

## Compare genomes by all-against-all fastANI. Prepare three files:
# 1. fastani.sh
#!/bin/sh
species=$1
fastANI --ql $PWD/fastANI/ANI_$species/"$species"_fna_list --rl $PWD/fastANI/ANI_$species/"$species"_fna_list -t 16 -o $PWD/fastANI/ANI_$species/output_$species

# 2. species_sum.txt (It contains all speices name. Here, we have a example file contain three species name)
Escherichia_coli
Salmonella_enterica
Bordetella_pertussis

# 3. sbatch_ani_jobs.sh
#!/bin/sh
while read lines
do
  mkdir -p fastANI/ANI_$lines # Make folder for ANI analysis
  ls -1 -d "$PWD/pan-genome_$lines/original_data/"*.fna > fastANI/ANI_Escherichia_coli/"$lines"_fna_list # Create full paths to species genomes as both query and reference lists.
  bash fastani.sh $lines
  sleep 20
done <$1

## Perform ANI analysis for multiple species.
bash sbatch_ani_jobs.sh species_sum.txt

## Determine genomes that have pairwise ANI < 94, and manually remove them from the dataset.
less fastANI/ANI_Escherichia_coli/output_Escherichia_coli | awk -F '\t' '$3<94'| cut -f 1 |uniq -c | sort -nr | less

## Count the average for all ani values.
less fastANI/ANI_Escherichia_coli/output_Escherichia_coli | awk '{ if ($1!=$2) print $3}' |awk '{ total += $1 } END { print total/NR }'| less
