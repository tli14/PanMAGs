## Pan-genome analysis of the 17 species (using all the complete genomes).
## software: PROKKA

# 1. Genome annotation by using Prokkav1.13

#!/bin/sh
species=$1
path="$PWD/pan-genome_$species/original_data/*.fna"

for f in $path
do
      prokka "$f" --outdir "${f}.prokka"
done
