## 5. Use rps-blast to perform domian search and then determine COG categories. (blast/2.10)
# rpsblast_batch.sh
input=$1
output=$1_rpsblast_output

cat << EOF> rpsblast.sh
#!/bin/sh
rpsblast -query $input -db COG/COG_CDD/Cog -outfmt 6 -evalue 1E-5 -out $output -num_threads 32
EOF>
