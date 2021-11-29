## Extract all gene sequences in gene clusters (The genes in each cluster can be found in at least 90% of the genomes)

# extract_all_fasta_seq.py (saved in the directory: Core_gene/Anvio_core_gene)

import os
import sys
import Bio
from Bio.Seq import Seq
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord

cluster=sys.argv[1] # ECtest_gene_clusters_summary.txt
core_set = sys.argv[2] # 90core_set.txt
core_gene_list=[]
sequence=[]

for line in open(core_set).readlines():
    gene_cluster_id = line.strip().split('\t')[0]
    core_gene_list.append(gene_cluster_id)

for line in open(cluster).readlines():
    gene_cluster = line.strip().split('\t')[1]
    if gene_cluster in core_gene_list:
        genome = line.strip().split('\t')[3]
        Cog = line.strip().split('\t')[14]
        seq = line.strip().split('\t')[18]
        new_record = SeqRecord(Seq(seq), "%s" % (gene_cluster), '', '%s_%s' % (genome, Cog))
        sequence.append(new_record)
SeqIO.write(sequence, "%s.fasta" % (core_set), "fasta")
