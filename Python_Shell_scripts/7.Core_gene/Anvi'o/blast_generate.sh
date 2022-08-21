# blast_generate.sh (saved in the directory: "Core_gene/Anvio_core_gene")

path1=$1
cat << EOF> blastp.sh
#!/bin/sh
blastp -query $path1/comp/100core_set.txt.fasta.core_set -subject $path1/ori/100core_set.txt.fasta.core_set -outfmt 6 -out $path1/100core_compare -evalue 1E-5
blastp -query $path1/comp/99core_set.txt.fasta.core_set -subject $path1/ori/99core_set.txt.fasta.core_set -outfmt 6 -out $path1/99core_compare -evalue 1E-5
blastp -query $path1/comp/98core_set.txt.fasta.core_set -subject $path1/ori/98core_set.txt.fasta.core_set -outfmt 6 -out $path1/98core_compare -evalue 1E-5
blastp -query $path1/comp/95core_set.txt.fasta.core_set -subject $path1/ori/95core_set.txt.fasta.core_set -outfmt 6 -out $path1/95core_compare -evalue 1E-5
blastp -query $path1/comp/90core_set.txt.fasta.core_set -subject $path1/ori/90core_set.txt.fasta.core_set -outfmt 6 -out $path1/90core_compare -evalue 1E-5
EOF>
