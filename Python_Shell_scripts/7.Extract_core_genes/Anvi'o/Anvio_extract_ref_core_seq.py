## Select the longest core sequence from each gene cluster as the core representative sequence.
## Create core gene sets under different core gene thresholds.

# Anvio_extract_ref_core_seq.py (saved in the directory: Core_gene/Anvio_core_gene)

import os
import sys
import Bio
from Bio.Seq import Seq
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord

core_set = sys.argv[1] # 90core_set.txt
core_set_seq = sys.argv[2] # 90core_set.txt.fasta
core_cluster_list =[]
core_cluster_list1 =[]
core_cluster_list2 =[]
core_cluster_list3 =[]
core_cluster_list4 =[]
cluster_dict = {}
sequence=[]
sequence1=[]
sequence2=[]
sequence3=[]
sequence4=[]

for record in SeqIO.parse(core_set_seq, "fasta"):
    id = record.id
    annotation = record.description
    seq = record.seq.ungap("-")
    seq_len = len(seq)
    if id in cluster_dict:
        if seq_len > len(cluster_dict[id]):
            cluster_dict[id]= seq
    else:
        cluster_dict[id]= seq

# core gene (CG) threshold 90
for line in open(core_set).readlines():
    gene_cluster_id = line.strip().split('\t')[0]
    core_cluster_list.append(gene_cluster_id)

for core_gene in core_cluster_list:
    new_seq = cluster_dict[core_gene]
    new_record = SeqRecord(new_seq, "%s" % core_gene, '', '')
    sequence.append(new_record)
SeqIO.write(sequence, "%s.core_set" %(core_set_seq), "fasta")

## CG 100
for line in open(str(100)+"core_set.txt").readlines():
    gene_cluster_id = line.strip().split('\t')[0]
    core_cluster_list1.append(gene_cluster_id)

for core_gene in core_cluster_list1:
    new_seq = cluster_dict[core_gene]
    new_record = SeqRecord(new_seq, "%s" % core_gene, '', '')
    sequence1.append(new_record)
SeqIO.write(sequence1, "%s.fasta.core_set" %(str(100)+"core_set.txt"), "fasta")

## CG 99
for line in open(str(99)+"core_set.txt").readlines():
    gene_cluster_id = line.strip().split('\t')[0]
    core_cluster_list2.append(gene_cluster_id)

for core_gene in core_cluster_list2:
    new_seq = cluster_dict[core_gene]
    new_record = SeqRecord(new_seq, "%s" % core_gene, '', '')
    sequence2.append(new_record)
SeqIO.write(sequence2, "%s.fasta.core_set" %(str(99)+"core_set.txt"), "fasta")

## CG 98
for line in open(str(98)+"core_set.txt").readlines():
    gene_cluster_id = line.strip().split('\t')[0]
    core_cluster_list3.append(gene_cluster_id)

for core_gene in core_cluster_list3:
    new_seq = cluster_dict[core_gene]
    new_record = SeqRecord(new_seq, "%s" % core_gene, '', '')
    sequence3.append(new_record)
SeqIO.write(sequence3, "%s.fasta.core_set" %(str(98)+"core_set.txt"), "fasta")

## CG 95
for line in open(str(95)+"core_set.txt").readlines():
    gene_cluster_id = line.strip().split('\t')[0]
    core_cluster_list4.append(gene_cluster_id)

for core_gene in core_cluster_list4:
    new_seq = cluster_dict[core_gene]
    new_record = SeqRecord(new_seq, "%s" % core_gene, '', '')
    sequence4.append(new_record)
SeqIO.write(sequence4, "%s.fasta.core_set" %(str(95)+"core_set.txt"), "fasta")
