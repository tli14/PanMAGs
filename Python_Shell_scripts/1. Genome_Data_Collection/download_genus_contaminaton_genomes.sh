# Download species genomes in the same genus as contamiantion datasets
# Make folder for each of the four species (Burkholderia pseudomallei, Bacillus subtilis, Klebsiella pneumoniae, and Streptococcus pyogenes).

# Here, used Burkholderia pseudomallei as example.
mkdir -p pan-genome_Burkholderia_pseudomallei/Burkholderia_genus

# Create genome download list for genus-level contamination dataset
less assembly_summary.txt | cut -f 8,20 | grep "Burkholderia" | grep -v "Burkholderia pseudomallei" | cut -f 2 > -p pan-genome_Burkholderia_pseudomallei/Burkholderia_genus_list

# Download genome nucleotide sequences
#!/bin/sh
while read Burkholderia_genus_list
do
        wget ${Burkholderia_genus_list}/$( basename "Burkholderia_genus_list" )_genomic.fna.gz
done <$1

# Move and uncompress all the .gz files
mv *.gz pan-genome_Burkholderia_pseudomallei/Burkholderia_genus
gunzip -d *.gz
