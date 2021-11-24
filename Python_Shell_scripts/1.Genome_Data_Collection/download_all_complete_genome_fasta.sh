# Download assembly_summary.txt
wget ftp.ncbi.nih.gov:/genomes/refseq/bacteria/assembly_summary.txt

# Select species that contains at least 100 complete genomes.
less assembly_summary.txt | grep "Complete Genome" | cut -f 8 |awk -F " " '{print $1" "$2}'| sort | uniq -c |sort -nr | less

# Make folder for each species (Here, use Escherichia coli as example).
mkdir -p pan-genome_Escherichia_coli/original_data

# Create genome download list for each of the 17 species.
cat assembly_summary.txt | grep "Complete Genome" | grep "Escherichia coli" | awk -F "\t" '{print $20}' > pan-genome_Escherichia_coli/Escherichia_coli_list

# Download genome nucleotide sequences.
#!/bin/sh
while read Escherichia_coli_list
do
        wget ${Escherichia_coli_list}/$( basename "$Escherichia_coli_list" )_genomic.fna.gz
done <$1

# Move and uncompress all the .gz files.
mv *.gz pan-genome_Escherichia_coli/original_data
gunzip -d *.gz
