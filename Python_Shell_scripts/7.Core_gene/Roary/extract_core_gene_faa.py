# extract_core_gene_faa.py (saved in the directory: "$PWD/Core_gene/Roary_core_gene")

import os
import sys
import Bio
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio import SeqIO
import pandas as pd

core_gene_id_file = sys.argv[1] # core.txt
pan_genome_faa = sys.argv[2] # pan_genome_reference.fa
gene_name_dict={}
sequence=[]

records = list(SeqIO.parse(pan_genome_faa, "fasta"))
records_num = len(records)
for x in range(records_num):
    record = records[x]
    seq = record.seq
    gene_name=record.description.split(" ", 1 )[1]
    gene_name_dict[gene_name]=seq
for line in open(core_gene_id_file).readlines():
    core_gene=line.strip()
    new_seq=gene_name_dict[core_gene]
    new_record = SeqRecord(new_seq, "%s" %core_gene, '', '')
    sequence.append(new_record)
SeqIO.write(sequence, "%s.core" %(pan_genome_faa), "fasta")
