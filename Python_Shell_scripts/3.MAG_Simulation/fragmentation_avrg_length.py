import os
import sys
import Bio
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio import SeqIO
import random
import numpy as np


fasta_file = sys.argv[1]
sequence=[]
new_sequence = []
records = list(SeqIO.parse(fasta_file, "fasta"))
records_number = len(records)
avrg_length = 10000 ## average length for fragments: 10k, 20k, 50k, 100k
std = 500 ## standard deviation
avrg_cut = "10k" ## sim group name

if records_number == 1:
    record = records[0]
    seq_id = record.id
    seq_length = len(record)
    seq_number = 1
    cut = int(seq_length/avrg_length)
    numbers = np.random.normal(avrg_length,std,cut)
    numbers = numbers.tolist()
    cut_site = []
    cut_site.append(int(numbers[0]))
    a=0
    for i in range(1,len(numbers)):
        cut_pos = int(cut_site[a]+numbers[i])
        if cut_pos < int(seq_length):
            cut_site.append(cut_pos)
            a += 1
            i += 1
    cut_end = int(seq_length)
    cut_site.append(cut_end)
    #print(cut_site)
    for x in range(len(cut_site)):
        if x == 0:
            seq = record.seq[0:cut_site[0]]
            new_record = SeqRecord(seq, "%s#%s" % (seq_id, seq_number), '',
                                   "fragment_%s, 0-%s" % (seq_number, cut_site[0]))
            sequence.append(new_record)
        else:
            seq = record.seq[cut_site[x-1]:cut_site[x]]
            new_record = SeqRecord(seq, "%s#%s" % (seq_id, seq_number), '',
                                   "fragment_%s, %s-%s" % (seq_number, cut_site[x-1], cut_site[x]))
            sequence.append(new_record)
        seq_number += 1
        x += 1
    SeqIO.write(sequence, "%s.%s_cut" %(fasta_file,avrg_cut), "fasta")
else:
    for x in range(records_number):
        if len(records[x]) >= 1.5*avrg_length:
            record = records[x]
            seq_id = record.id
            seq_length = len(record)
            seq_number = 1
            cut = int(seq_length / avrg_length)
            numbers = np.random.normal(avrg_length, std, cut)
            numbers = numbers.tolist()
            cut_site = []
            cut_site.append(int(numbers[0]))
            if len(numbers) >2:
                a=0
                for i in range(1,len(numbers)):
                    cut_pos = int(cut_site[a] + numbers[i])
                    if cut_pos < int(seq_length):
                        cut_site.append(cut_pos)
                        a += 1
                        i += 1
            elif len(numbers) ==2:
                if int(numbers[0] + numbers[1]) < seq_length:
                    cut_site.append(int(numbers[0] + numbers[1]))
            elif len(numbers) == 1:
                continue
            cut_end = int(seq_length)
            cut_site.append(cut_end)
            #print(cut_site)
            for x in range(len(cut_site)):
                if x == 0:
                    seq = record.seq[0:cut_site[0]]
                    new_record = SeqRecord(seq, "%s#%s" % (seq_id, seq_number), '',
                                           "fragment_%s, 0-%s" % (seq_number, cut_site[0]))
                    sequence.append(new_record)
                else:
                    seq = record.seq[cut_site[x-1]:cut_site[x]]
                    new_record = SeqRecord(seq, "%s#%s" % (seq_id, seq_number), '',
                                           "fragment_%s, %s-%s" % (seq_number, cut_site[x - 1], cut_site[x]))
                    sequence.append(new_record)
                seq_number += 1
                x += 1
        else:
            record = records[x]
            seq = record.seq
            new_record = SeqRecord(seq, record.id, '', '')
            sequence.append(new_record)
    SeqIO.write(sequence, "%s.%s_cut" % (fasta_file, avrg_cut), "fasta")
