# PanMAGs
This repository provides codes and files to reproduce data and figures from the manuscript "Critical assessment of pan-genomics of metagenome-assembled genomes", by Tang Li and Yanbin Yin* (*corresponding author). Here, the Python and shell scripts cover downloading genome data, simulating metagenome-assembled genomes (MAGs) from complete genomes, analyzing pan-genome, performing Clusters of Orthologous Group (COG) functional annotations and comparing phylogenetic trees. The R codes cover reformatting data, generating plots and combining plots. <br> 

## Requirements
* [FastANI](https://github.com/ParBLiSS/FastANI): Calculate Average Nucleotide Identity (ANI).
* [Prokka](https://github.com/tseemann/prokka): Prokaryotic genome annotation.
* [Blast+](https://github.com/ncbi/blast_plus_docs): Compare sequences to database.
* [Roary](https://github.com/sanger-pathogens/Roary): Pan-genome analysis.
* [Anvi'o](https://github.com/merenlab/anvio): Pan-genome analysis.
* [BPGA](https://github.com/jbadavis/bpga): Pan-genome analysis.
* [Fasttree](http://www.microbesonline.org/fasttree/): Phylogenetic tree construction.

## Data
* The entire data generated in this study is too large to store on Github, some example data for _`Escherichia coli`_ are available [online](https://bcb.unl.edu/PanMAGs/) for testing MAG simulation, generating mixed MAG datasets, extracting and comparing core genes, and evaluating downstream analysis.
* [`Anaconda`](https://www.anaconda.com/) is used to create conda environment to run Python scripts, the required package [conda_list](https://github.com/tli14/PanMAGs/blob/main/conda_list) can be downloaded using ```conda create --name <env> --file conda_list```.
* Information about R packages needed to run R codes can be found in [R_packages](https://github.com/tli14/PanMAGs/blob/main/R_packages).

## Scripts
* **Python_Shell_scripts**
  - 1. Genome_Data_Collection:
    - [download_all_complete_genome_fasta.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/1.Genome_Data_Collection/download_all_complete_genome_fasta.sh): Download complete bacteria genomes from assembly_summary.txt.
    - [download_genus_contaminaton_genomes.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/1.Genome_Data_Collection/download_genus_contaminaton_genomes.sh): Download bacteria genomes as contamination datasets.
    - [fastANI.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/1.Genome_Data_Collection/fastANI.sh): Calculate average nucleotide identity (ANI) for bacteria species.
 - 2. 17_species:
    - [prokka.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/2.17_species/prokka.sh): Genome annotation by using Prokka.
    - [gen_gff.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/2.17_species/gen_gff.sh): Rename .gff files from Prokka results.
    - [roary_species.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/2.17_species/roary_species.sh): Pan-genome analysis by using Roary.
    - [sbatch_roary.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/2.17_species/sbatch_roary.sh): Run multiple jobs for pan-genome analysis.
- 3. MAG_Simulation:
    - [fragmentation.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/fragmentation.py): Fragmentation simulation - random cut the genome to fragments (random number of fragments).
    - [fragmentation_avrg_length.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/fragmentation_avrg_length.py): Fragmentation simulation - random cut the genome to fragments (random length of fragments).
    - [incompleteness.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/incompleteness.py): Incompleteness simulation - remove a percentage of sequence length from each fragment.
    - [contamination.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/contamination.py): Contamination simulation - add fragments from other genomes in the same species (intraspecies).
    - [contamination_genus.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/contamination_genus.py): Contamination simulation - add fragments from other genomes in the same genus (interspecies).
    - [random_distribution](https://github.com/tli14/PanMAGs/tree/main/Python_Shell_scripts/3.MAG_Simulation/random_distribution): 
Generate random numbers following F distribution for simualtion. 
