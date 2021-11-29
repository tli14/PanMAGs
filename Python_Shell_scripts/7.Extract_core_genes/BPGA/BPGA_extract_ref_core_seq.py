## Extract representative core genes from BPGA results under different core gene thresholds.

# BPGA_extract_ref_core_seq.py (saved in the directory: "$PWD/Core_gene/BPGA_core_gene")
import os
import sys
import Bio
from Bio.Seq import Seq
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord

pan_seq = sys.argv[1] # "ref.txt" in BPGA outputs
ref_seq_record = sys.argv[2] # "cluster_gi_ref.txt" in BPGA outputs
pan_seq_dict = {}
gene_record_dict ={}
sequence=[]
sequence1=[]
sequence2=[]
sequence3=[]
sequence4=[]

for line in open(pan_seq).readlines():
    gene_name = line.strip().split('\t')[0]
    gene_seq = line.strip().split('\t')[1]
    pan_seq_dict[gene_name] = gene_seq

for line in open(ref_seq_record).readlines():
    gene_record = line.strip().split('\t')[0]
    gene_name = line.strip().split('\t')[1]
    gene_record_dict[gene_record] = gene_name

# core gene (CG) threshold 100
for line in open("core_" + str(100)).readlines():
    gene_record = line.strip()
    seq = pan_seq_dict[gene_record_dict[gene_record]]
    new_record = SeqRecord(Seq(seq), "%s_%s" % (gene_record, gene_record_dict[gene_record]), '', '')
    sequence.append(new_record)
SeqIO.write(sequence, "%s.fasta" % ("core_"+str(100)), "fasta")

# CG 99
for line in open("core_" + str(99)).readlines():
    gene_record = line.strip()
    seq = pan_seq_dict[gene_record_dict[gene_record]]
    new_record = SeqRecord(Seq(seq), "%s_%s" % (gene_record, gene_record_dict[gene_record]), '', '')
    sequence1.append(new_record)
SeqIO.write(sequence1, "%s.fasta" % ("core_"+str(99)), "fasta")

# CG 98
for line in open("core_" + str(98)).readlines():
    gene_record = line.strip()
    seq = pan_seq_dict[gene_record_dict[gene_record]]
    new_record = SeqRecord(Seq(seq), "%s_%s" % (gene_record, gene_record_dict[gene_record]), '', '')
    sequence2.append(new_record)
SeqIO.write(sequence2, "%s.fasta" % ("core_"+str(98)), "fasta")

# CG 95
for line in open("core_" + str(95)).readlines():
    gene_record = line.strip()
    seq = pan_seq_dict[gene_record_dict[gene_record]]
    new_record = SeqRecord(Seq(seq), "%s_%s" % (gene_record, gene_record_dict[gene_record]), '', '')
    sequence3.append(new_record)
SeqIO.write(sequence3, "%s.fasta" % ("core_"+str(95)), "fasta")

# CG 90
for line in open("core_" + str(90)).readlines():
    gene_record = line.strip()
    seq = pan_seq_dict[gene_record_dict[gene_record]]
    new_record = SeqRecord(Seq(seq), "%s_%s" % (gene_record, gene_record_dict[gene_record]), '', '')
    sequence4.append(new_record)
SeqIO.write(sequence4, "%s.fasta" % ("core_"+str(90)), "fasta")
