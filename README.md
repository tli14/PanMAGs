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
* The four supplementary tables for this manuscript can be found the folder [supplementary tables](https://github.com/tli14/PanMAGs/tree/main/supplementary%20tables).

## Scripts
### Python_Shell_scripts
  - **Genome_Data_Collection: collect and analyze genome data.**
    - [download_all_complete_genome_fasta.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/1.Genome_Data_Collection/download_all_complete_genome_fasta.sh): download complete bacteria genomes from assembly_summary.txt.
    - [download_genus_contaminaton_genomes.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/1.Genome_Data_Collection/download_genus_contaminaton_genomes.sh): download bacteria genomes as contamination datasets.
    - [fastANI.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/1.Genome_Data_Collection/fastANI.sh): calculate average nucleotide identity (ANI) for bacteria species.<br> 

  - **17_species: pan-genome analysis for 17 species.**
    - [prokka.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/2.17_species/prokka.sh): genome annotation by using Prokka.
    - [gen_gff.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/2.17_species/gen_gff.sh): rename .gff files from Prokka results.
    - [roary_species.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/2.17_species/roary_species.sh): pan-genome analysis by using Roary.
    - [sbatch_roary.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/2.17_species/sbatch_roary.sh): run multiple jobs for pan-genome analysis.<br> 

  - **MAG_Simulation: simulate MAGs from complete genomes.**
    - [fragmentation.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/fragmentation.py): fragmentation simulation - random cut the genome to fragments (random number of fragments).
    - [fragmentation_avrg_length.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/fragmentation_avrg_length.py): fragmentation simulation - random cut the genome to fragments (random length of fragments).
    - [incompleteness.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/incompleteness.py): incompleteness simulation - remove a percentage of sequence length from each fragment.
    - [contamination.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/contamination.py): contamination simulation - add fragments from other genomes in the same species (intraspecies).
    - [contamination_genus.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/contamination_genus.py): contamination simulation - add fragments from other genomes in the same genus (interspecies).
    - [random_distribution](https://github.com/tli14/PanMAGs/tree/main/Python_Shell_scripts/3.MAG_Simulation/random_distribution): generate random numbers following F distribution for simualtion. 
    - [generate_numbers.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/generate_numbers.sh): generate numbers for genome list to assign random fragmentation/incompleteness/contamination numbers.
    - [simulation.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/simulation.sh): automatic simulation scripts.
    - [batch_files.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/batch_files.sh): batch files for simulation.
    - [multiple_dataset.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/3.MAG_Simulation/multiple_dataset.sh): generate multiple datasets for testing the dataset variations.<br> 

  - **Mixed_datasets: generate and analyze mxied datasets contain MAGs and complete genomes.**
    - [rad_combine.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/4.Mixed_datasets/rad_combine.sh): generate mixed datasets with different percentage of MAGs.
    - [copy_ori_file.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/4.Mixed_datasets/copy_ori_file.py): generate mixed datasets by combining original and simulated MAG dataset.
    - [Pan-genome_and_summary.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/4.Mixed_datasets/Pan-genome_and_summary.sh): perform pan-genome analysis for mixed datasets.
    - [loop_rad_combine.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/4.Mixed_datasets/loop_rad_combine.sh): run rad_combine.sh for multiple times.
    - [roary_sum.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/4.Mixed_datasets/roary_sum.py): summary Roary results for multiple mixed datasets.<br> 

  - **Three_tools: perform pan-genome analysis using three different tools.**
    - **[Anvi'o](https://github.com/tli14/PanMAGs/tree/main/Python_Shell_scripts/5.Three_tools/Anvi'o):**
      - [Anvi'o.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Anvi'o/Anvi'o.sh): use Anvi'o for pan-genome analysis.
      - [genbank-parser.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Anvi'o/genbank-parser.py): generate a tab-delimited file to define external gene calls from Genbank files given by Prokka.
    - **[BPGA](https://github.com/tli14/PanMAGs/tree/main/Python_Shell_scripts/5.Three_tools/BPGA):**
      - [gen_faa.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/BPGA/gen_faa.sh): rename the .faa files.
      - [sort_faa.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/BPGA/sort_faa.sh): prepare .faa files for BPGA pan-genome analysis.
      - [summary.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/BPGA/summary.sh): BPGA pan-genome result summary.
    - **[Roary](https://github.com/tli14/PanMAGs/tree/main/Python_Shell_scripts/5.Three_tools/Roary):**
      - [gen_gff.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Roary/gen_gff.sh): rename the .gff files.
      - [prokka_generate.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Roary/prokka_generate.sh): generate prokka annotation script.
      - [bash_prokka.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Roary/bash_prokka.sh): prokka annotation.
      - [roary.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Roary/roary.sh): generate Roary pan-genome analysis script.
      - [sbatch_roary.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Roary/sbatch_roary.sh): run Roary analysis.
      - [rad_roary_sum.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/5.Three_tools/Roary/rad_roary_sum.py): summarize roary results.<br>

  - **COG_analysis: perform the clusters of orthologous Genes (COG) analysis.**
    - [prepare_files.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/6.COG_analysis/prepare_files.sh): prepare for COG functional analysis for core gene families after pan-genome analysis.
    - [rpsblast_batch.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/6.COG_analysis/rpsblast_batch.sh): use rps-blast to perform domian search and then determine COG categories.
    - [rps_select.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/6.COG_analysis/rps_select.py): select non-overlap domains for each genes.
    - [rps2COG.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/6.COG_analysis/rps2COG.py): extract COG information from rpsblast results after the selection of non-overlap domains.
    - [core_rps.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/6.COG_analysis/core_rps.sh): run rps-blast.
    - [rpsblast_to_COG.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/6.COG_analysis/rpsblast_to_COG.sh): select non-overlap domains for rps-blast results and assign the COG categories.<br>

  - **Core_gene: extract and analyze core genes.**
    - **[Anvi'o](https://github.com/tli14/PanMAGs/tree/main/Python_Shell_scripts/7.Core_gene/Anvi'o):**
      - [Anvio_extract_core.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/Anvi'o/Anvio_extract_core.sh): extract core genes from anvi'o outputs.
      - [extract_all_fasta_seq.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/Anvi'o/extract_all_fasta_seq.py): extract all gene sequences in gene clusters.
      - [Anvio_extract_ref_core_seq.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/Anvi'o/Anvio_extract_ref_core_seq.py): select the longest core sequence from each gene cluster as the core representative sequence.
      - [blast_generate.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/Anvi'o/blast_generate.sh): generate blast scripts.
      - [Anvio_core_gene_compare.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/Anvi'o/Anvio_core_gene_compare.sh): core gene comparison.
      - [Anvio_summary.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/Anvi'o/Anvio_summary.sh): summarzie core gene comparison results.
    - **[BPGA](https://github.com/tli14/PanMAGs/tree/main/Python_Shell_scripts/7.Core_gene/BPGA):**
      - [BPGA_extract_ref_core_seq.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/BPGA/BPGA_extract_ref_core_seq.py): extract representative core genes from BPGA results under different core gene thresholds.
      - [BPGA_extract_core.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/BPGA/BPGA_extract_core.sh): extract core gene representative sequences.
      - [blast_generate.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/BPGA/blast_generate.sh): generate blast scripts.
      - [BPGA_core_gene_compare.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/BPGA/BPGA_core_gene_compare.sh): core gene comparison.
      - [BPGA_summary.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/BPGA/BPGA_summary.sh): summarzie core gene comparison results.
    - **[Roary](https://github.com/tli14/PanMAGs/tree/main/Python_Shell_scripts/7.Core_gene/Roary):**
      - [gene_id_extract.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/Roary/gene_id_extract.py): extract core gene cluster ids.
      - [extract_core_gene_faa.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/Roary/extract_core_gene_faa.py): extract core gene representative sequences.
      - [DNA_to_protein.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/Roary/DNA_to_protein.py): translate DNA seuquences to proteins.
      - [Roary_extract_core_gene.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/Roary/Roary_extract_core_gene.sh): extract core gene representative sequences from pan-genome reference.
      - [blast_generate.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/Roary/blast_generate.sh): generate blast scripts.
      - [Roary_core_gene_compare.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/Roary/Roary_core_gene_compare.sh): core gene comparison.
      - [Roary_summary.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/7.Core_gene/Roary/Roary_summary.sh): summarzie core gene comparison results.<br>

  - **Phylogenetic_analysis: compare phylogenetic trees constructed based on MAGs and complete genomes.**
    - [change_tree_id.py](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/8.Phylogenetic_analysis/change_tree_id.py): change tree id with new id file.
    - [gene_pre_abs_tree.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/8.Phylogenetic_analysis/gene_pre_abs_tree.sh): change genome ids for tree comparison.
    - [fasttree_generate.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/8.Phylogenetic_analysis/fasttree_generate.sh): generate  phylogenetic trees based on core gene alignment.
    - [core_alignment_tree.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/8.Phylogenetic_analysis/core_alignment_tree.sh): build tree based on core gene alignment by using fasttree.
    - [tree_compare.sh](https://github.com/tli14/PanMAGs/blob/main/Python_Shell_scripts/8.Phylogenetic_analysis/tree_compare.sh): Compare two phylogenetic trees by using ETE3 toolkit.<br>

### R_code
* These R codes were used to generate figures and supplementary figures in the manuscript. For example, the "[Fig2.AB.frag_data.R](https://github.com/tli14/PanMAGs/blob/main/R_code/Fig2.AB.frag_data.R)" was used to generate Figure 2.A and Figure 2.B in the manuscript. The input files for generating Figure 2 can be found in "[Fig2.frag_incomp](https://github.com/tli14/PanMAGs/tree/main/R_code/Fig2.frag_incomp)". 
