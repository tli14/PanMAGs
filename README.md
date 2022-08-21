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
  - **Genome_Data_Collection: collect and analyze genome data.**
    - [download_all_complete_genome_fasta.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/1.Genome_Data_Collection/download_all_complete_genome_fasta.sh): Download complete bacteria genomes from assembly_summary.txt.
    - [download_genus_contaminaton_genomes.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/1.Genome_Data_Collection/download_genus_contaminaton_genomes.sh): Download bacteria genomes as contamination datasets.
    - [fastANI.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/1.Genome_Data_Collection/fastANI.sh): Calculate average nucleotide identity (ANI) for bacteria species.<br> 

  - **17_species: pan-genome analysis for 17 species.**
    - [prokka.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/2.17_species/prokka.sh): Genome annotation by using Prokka.
    - [gen_gff.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/2.17_species/gen_gff.sh): Rename .gff files from Prokka results.
    - [roary_species.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/2.17_species/roary_species.sh): Pan-genome analysis by using Roary.
    - [sbatch_roary.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/2.17_species/sbatch_roary.sh): Run multiple jobs for pan-genome analysis.<br> 

  - **MAG_Simulation: simulate MAGs from complete genomes.**
    - [fragmentation.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/fragmentation.py): Fragmentation simulation - random cut the genome to fragments (random number of fragments).
    - [fragmentation_avrg_length.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/fragmentation_avrg_length.py): Fragmentation simulation - random cut the genome to fragments (random length of fragments).
    - [incompleteness.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/incompleteness.py): Incompleteness simulation - remove a percentage of sequence length from each fragment.
    - [contamination.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/contamination.py): Contamination simulation - add fragments from other genomes in the same species (intraspecies).
    - [contamination_genus.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/contamination_genus.py): Contamination simulation - add fragments from other genomes in the same genus (interspecies).
    - [random_distribution](https://github.com/tli14/PanMAGs/tree/main/Python_Shell_scripts/3.MAG_Simulation/random_distribution): Generate random numbers following F distribution for simualtion. 
    - [generate_numbers.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/generate_numbers.sh): Generate numbers for genome list to assign random fragmentation/incompleteness/contamination numbers.
    - [simulation.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/simulation.sh): Automatic simulation scripts.
    - [batch_files.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/batch_files.sh): Batch files for simulation.
    - [multiple_dataset.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/multiple_dataset.sh): Generate multiple datasets for testing the dataset variations.<br> 

  - **Mixed_datasets: generate mxied datasets contain MAGs and complete genomes.**
    - [rad_combine.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/4.Mixed_datasets/rad_combine.sh): Generate mixed datasets with different percentage of MAGs.
    - [copy_ori_file.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/4.Mixed_datasets/copy_ori_file.py): Generate mixed datasets by combining original and simulated MAG dataset.
    - [Pan-genome_and_summary.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/4.Mixed_datasets/Pan-genome_and_summary.sh): Perform pan-genome analysis for mixed datasets.
    - [loop_rad_combine.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/4.Mixed_datasets/loop_rad_combine.sh): Run rad_combine.sh for multiple times.
    - [roary_sum.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/4.Mixed_datasets/roary_sum.py): Summary Roary results for multiple mixed datasets.<br> 

  - **Three_tools: pan-genome analysis using three different tools.**
    - **[Anvi'o](https://github.com/tli14/PanMAGs/tree/main/Python_Shell_scripts/5.Three_tools/Anvi'o):**
      - [Anvi'o.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Anvi'o/Anvi'o.sh): Use Anvi'o for pan-genome analysis.
      - [genbank-parser.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Anvi'o/genbank-parser.py): To generate a tab-delimited file to define external gene calls from Genbank files given by Prokka.
    - **[BPGA](https://github.com/tli14/PanMAGs/tree/main/Python_Shell_scripts/5.Three_tools/BPGA):**
      - [gen_faa.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/BPGA/gen_faa.sh): Rename the .faa files.
      - [sort_faa.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/BPGA/sort_faa.sh): Prepare .faa files for BPGA pan-genome analysis.
      - [summary.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/BPGA/summary.sh): BPGA pan-genome result summary.
    - **[Roary](https://github.com/tli14/PanMAGs/tree/main/Python_Shell_scripts/5.Three_tools/Roary):**
      - [gen_gff.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Roary/gen_gff.sh): Rename the .gff files.
      - [prokka_generate.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Roary/prokka_generate.sh): Generate prokka annotation script.
      - [bash_prokka.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Roary/bash_prokka.sh): PROKKA annotation.
      - [roary.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Roary/roary.sh): Generate Roary pan-genome analysis script.
      - [sbatch_roary.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Roary/sbatch_roary.sh): Run Roary analysis.
      - [rad_roary_sum.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Roary/rad_roary_sum.py): Summarize roary results.<br>

  - **COG_analysis: The Clusters of Orthologous Genes (COG) analysis.**
    - [prepare_files.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/6.COG_analysis/prepare_files.sh): Prepare for COG functional analysis for core gene families after pan-genome analysis.
    - [rpsblast_batch.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/6.COG_analysis/rpsblast_batch.sh): Use rps-blast to perform domian search and then determine COG categories.
    - [rps_select.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/6.COG_analysis/rps_select.py): Select non-overlap domains for each genes.
    - [rps2COG.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/6.COG_analysis/rps2COG.py): Extract COG information from rpsblast results after the selection of non-overlap domains.
    - [core_rps.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/6.COG_analysis/core_rps.sh): Run rps-blast.
    - [rpsblast_to_COG.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/6.COG_analysis/rpsblast_to_COG.sh): Select non-overlap domains for rps-blast results and assign the COG categories.<br>


