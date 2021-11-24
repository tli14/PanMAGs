## Incompleteness - remove a percentage of sequence length from the end of each fragment.

import os
import sys
import Bio
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio import SeqIO

i = sys.argv[1]
n = sys.argv[2]
sequence=[]
records = list(SeqIO.parse(i, "fasta"))
comp = float(open("pan-genome/numbers.txt").readlines()[int(n)].split()[0]) # the random incompleteness number file
cut_percent = (100-comp)/100

for x in range(0, len(records)):
    record = records[x]
    seq_id = record.id
    seq_length = len(record)
    cut_site = int((1-cut_percent)*seq_length)
    new_seq = record.seq[0:cut_site]
    new_record = SeqRecord(new_seq, "%s" % seq_id, '', '')
    sequence.append(new_record)

SeqIO.write(sequence, "%s.%scomp"%(i, 100-cut_percent*100), "fasta")
