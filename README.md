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
* Python_Shell_scripts
** 1.Genome_Data_Collection:
*** download_all_complete_genome_fasta.sh: Download complete bacteria genomes from assembly_summary.txt.
