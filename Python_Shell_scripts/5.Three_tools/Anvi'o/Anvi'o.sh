## Use Anvi'o for pan-genome analysis
## software: Prokkav1.13, anvio/7

#!/bin/sh
species=$1
random_num=random_$2

path1="$PWD/pan-genome_Escherichia_coli/simulation/$random_num"
path2="$path1/ori_data" # for original genomes
path3="$path1/simulation/50cut" # for fragmented genomes
path4="$path3/99comp" # for incomplete gneomes
path5="$path4/cont/2.0cont" # for contaminated geomes
mkdir -p $PWD/pan-genome/Anvio
dir="$PWD/pan-genome/Anvio"

# 1. Prepare genome dataset. (use one E. coli genome dataset as example)
cp $path2/*fna $PWD/pan-genome/Anvio/test_EC/*fna
cd $PWD/pan-genome/Anvio

# 2. Prepare genomes and their contig databases.
for i in $PWD/pan-genome/Anvio/test_EC/*fna; do
  anvi-script-reformat-fasta $i -o $i.cleanedheaders -l 4 --simplify-names --seq-type NT
  prokka $i.cleanedheaders --outdir $i.cleanedheaders.prokka
  mv $i.cleanedheaders.prokka/*gbk $i.cleanedheaders.prokka.gbk
  python genbank-parser.py $i.cleanedheaders.prokka.gbk --gene-calls $i.cleanedheaders.gene-calls.txt --annotation $i.cleanedheaders.gene_annot.txt
  anvi-gen-contigs-database -f $i.cleanedheaders -o $i.cleanedheaders.db --external-gene-calls $i.cleanedheaders.gene-calls.txt --ignore-internal-stop-codons # use external gene calls from Genbank files given by Prokka
  anvi-run-ncbi-cogs -c $i.cleanedheaders.db --num-threads 32 --search-with diamond --cog-data-dir ${COG_DATA_DIR} # path to the COG database
  anvi-run-hmms -c $i.cleanedheaders.db --num-threads 32
done

# 3. Generate genome storage table (column 1:genome names, column 2:path to the genome database files).
cd $PWD/pan-genome/Anvio/test_EC
ls *fna |  awk -F "." '{print$1}'  > fna.txt
ls -1 -d "$PWD/test_EC/"*.db > test_db_dir.txt
paste -d"\t" fna.txt test_db_dir.txt > EC_contig_database.txt

# 4. Create genome database.
anvi-gen-genomes-storage -e EC_contig_db.txt -o EC_test-GENOMES.db --gene-caller Prodigal

# 5. Pan-genome analysis.
anvi-pan-genome -g EC_test-GENOMES.db --project-name ECtest --output-dir Anvio/pangenome --num-threads 32 --mcl-inflation 10 --use-ncbi-blast --minbit 0.8

# 6. Display and summary ("ssh -L 8080:localhost:8080" may be needed in visualization if connect to the server)
cd $PWD/pan-genome/Anvio # Anvio folder
anvi-display-pan -g test_EC/EC_test-GENOMES.db -p pangenome/ECtest-PAN.db  # --server-only -P 8080
# Name the collection containing all core genes as "core" on the online anvio page.
anvi-summarize -g test_EC/EC_test-GENOMES.db -p pangenome/ECtest-PAN.db -o pan_sum --collection-name core
less pan_sum/misc_data_items/default.txt | awk '$2==100' | wc -l # get 100% core genes.
