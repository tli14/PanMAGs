# Fragmentation - cut the genome to several fragments (keep the original sequence ids to avoid problems in Roary analysis).

import os
import sys
import Bio
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio import SeqIO
import random
import numpy as np

i = sys.argv[1]
n = sys.argv[2]
sequence=[]
new_sequence = []
records = list(SeqIO.parse(i, "fasta"))
records_number = len(records)
cut = int(open("fnumbers.txt").readlines()[int(n)].split()[0])

if records_number == 1:
    record = records[0]
    seq_id = record.id
    seq_length = len(record)
    seq_number = 1
    numbers = np.random.choice(seq_length, cut, replace = False) # random select start and end site
    cut_site = sorted(numbers) # sort from small to large
    # print(cut_site[5])
    for x in range(cut):
        if x < cut-1:
            seq = record.seq[cut_site[x]:cut_site[x+1]]
            new_record = SeqRecord(seq, "%s#%s" % (seq_id, seq_number), '', "fragment_%s, %s-%s" % (seq_number, cut_site[x], cut_site[x + 1]))
            sequence.append(new_record)
        else:
            seq = record.seq[cut_site[cut-1]:seq_length] + record.seq[0:cut_site[0]]
            new_record = SeqRecord(seq, "%s#%s" % (seq_id, seq_number), '', "fragment_%s, %s-%s, 0-%s" % (seq_number, cut_site[cut-1], seq_length, cut_site[0]))
            sequence.append(new_record)
        seq_number += 1
        x += 1
    SeqIO.write(sequence, "%s.%s_cut" %(i,cut), "fasta")
else:
    dict = {}
    record_list = []
    dict[0] = len(records[0])
    record_list.append(dict[0])
    seq = records[0].seq
    for x in range(1, records_number):
        if x <= records_number:
            record = records[x]
            seq_length = len(record)
            dict[x] = dict[0] + seq_length
            record_list.append(dict[x])
        x += 1
        seq += record.seq
        dict[0] += seq_length
    numbers = np.random.choice(dict[records_number-1], cut-records_number, replace=False)  # random select start and end site
    numbers = numbers.tolist()
    cut_list = numbers + record_list
    cut_site = sorted(cut_list)
    new_seq = seq[0:cut_site[0]]
    new_record = SeqRecord(new_seq, "%s#1" %(records[0].id) , '', "fragment_1, %s-%s" % (0, cut_site[0]))
    new_sequence.append(new_record)
    seq_number = 2
    for x in range(cut):
        if x < cut-1 and cut_site[x+1] <= record_list[0]:
            new_seq = seq[cut_site[x]:cut_site[x + 1]]
            new_seq_id = records[0].id
            new_record = SeqRecord(new_seq, "%s#%s" % (new_seq_id, seq_number), '', "fragment_%s, %s-%s" % (seq_number, cut_site[x], cut_site[x + 1]))
            new_sequence.append(new_record)
        else:
            for a in range(1,records_number):
                if x < cut-1 and record_list[a-1] <= cut_site[x] <= record_list[a] and record_list[a-1] <= cut_site[x+1] <= record_list[a]:
                    new_seq = seq[cut_site[x]:cut_site[x + 1]]
                    new_seq_id = records[a].id
                    new_record = SeqRecord(new_seq, "%s#%s" % (new_seq_id, seq_number), '',"fragment_%s, %s-%s" % (seq_number, cut_site[x], cut_site[x + 1]))
                    new_sequence.append(new_record)
                else:
                    a += 1
        seq_number += 1
        x += 1
    SeqIO.write(new_sequence, "%s.%s_cut" % (i, cut), "fasta")
