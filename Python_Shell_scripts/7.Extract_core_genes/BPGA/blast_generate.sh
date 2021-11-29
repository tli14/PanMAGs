# blast_generate.sh (saved in the directory: "$PWD/Core_gene/BPGA_core_gene")
path1=$1
cat << EOF> blastp.sh
#!/bin/sh
blastp -query $path1/comp/core_100.fasta -subject $path1/ori/core_100.fasta -outfmt 6 -out $path1/100core_compare -evalue 1E-5
blastp -query $path1/comp/core_99.fasta -subject $path1/ori/core_99.fasta -outfmt 6 -out $path1/99core_compare -evalue 1E-5
blastp -query $path1/comp/core_98.fasta -subject $path1/ori/core_98.fasta -outfmt 6 -out $path1/98core_compare -evalue 1E-5
blastp -query $path1/comp/core_95.fasta -subject $path1/ori/core_95.fasta -outfmt 6 -out $path1/95core_compare -evalue 1E-5
blastp -query $path1/comp/core_90.fasta -subject $path1/ori/core_90.fasta -outfmt 6 -out $path1/90core_compare -evalue 1E-5
EOF>
