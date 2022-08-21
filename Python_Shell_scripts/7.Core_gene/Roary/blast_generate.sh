# blast_generate.sh (saved in the directory: "$PWD/Core_gene/Roary_core_gene")

path1=$1
path2=$2
path3=$3
cat << EOF> blastp.sh
#!/bin/sh
blastp -query $path1/core_genome_reference.CG_100 -subject $path2/core_genome_reference.CG_100 -outfmt 6 -out $path3/100core_compare -evalue 1E-5
blastp -query $path1/core_genome_reference.CG_99 -subject $path2/core_genome_reference.CG_99 -outfmt 6 -out $path3/99core_compare -evalue 1E-5
blastp -query $path1/core_genome_reference.CG_98 -subject $path2/core_genome_reference.CG_98 -outfmt 6 -out $path3/98core_compare -evalue 1E-5
blastp -query $path1/core_genome_reference.CG_95 -subject $path2/core_genome_reference.CG_95 -outfmt 6 -out $path3/95core_compare -evalue 1E-5
blastp -query $path1/core_genome_reference.CG_90 -subject $path2/core_genome_reference.CG_90 -outfmt 6 -out $path3/90core_compare -evalue 1E-5
EOF>
