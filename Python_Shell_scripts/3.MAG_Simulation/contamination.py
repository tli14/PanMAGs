## Contamination - add fragments from other genomes in the same species (intraspecies).

import os
import sys
import Bio
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio import SeqIO
import random
import numpy as np
import glob

# Open the genome file that need to be modified and set the random contamination percent for genome files
i = sys.argv[1] # fragmented and incomplete genome
n = sys.argv[2] # random cont number
sequence=[]
records = list(SeqIO.parse(i, "fasta"))
records_num = len(records)
cont = float(open("cnumbers.txt").readlines()[int(n)].split()[0]) # the random contamination number file
cont_percent = cont/100
genome_length = 0
genome_id=records[0].id
for x in range(records_num):
    if x <= records_num:
        record = records[x]
        seq = record.seq
        seq_length = len(seq)
        new_record = SeqRecord(seq, "%s" %record.id, '', '')
        sequence.append(new_record)
    x += 1
    genome_length += seq_length
cont_seq_len = int(cont_percent*genome_length) # the total length for contamination sequence

#randomly select the number of contamination sources, and separate the contamination length to several parts.
source_num = random.randint(1,20)
def randomList(m, n):
    arr = [0] * m
    for i in range(n):
        arr[random.randint(0, n) % m] += 1
    return [arr[i] for i in range(m)]
random_list=randomList(source_num, cont_seq_len)
cont_len_list = []
for t in random_list:
    cont_len_list.append(t)

# select fna file to add contamination
for x in range(source_num):
    fna_file = "pan-genome_Escherichia_coli/original_data/*.fna"  # the contamination source (genome in the same species)
    fna_filename = random.choice(glob.glob(fna_file))
    fna_records = list(SeqIO.parse(fna_filename, "fasta"))
    fna_rec_num=len(fna_records)
    if fna_rec_num == 1:
        fna_record=fna_records[0]
        seq_length = len(fna_record)
    else:
        max_len=0
        for record in fna_records:
            if len(record)>max_len:
                max_len = len(record)
                fna_record=record
        seq_length = len(fna_record)
    cut_start = random.randint(0, seq_length - cont_len_list[x])
    cut_end = cut_start + cont_len_list[x]
    fna_seq = fna_record.seq[cut_start:cut_end]
    new_record = SeqRecord(fna_seq, "%s#%s" % (genome_id,x), '', "cont#%s#%s" % (fna_record.id, x))
    sequence.append(new_record)
SeqIO.write(sequence, "%s.%scont" %(i, cont), "fasta")
