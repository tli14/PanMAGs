# DNA_to_protein.py (saved in the directory: "$PWD/Core_gene/Roary_core_gene")

import os
import sys
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord

core_seq = sys.argv[1] # pan_genome_reference.fa.core
sequence=[]

for record in SeqIO.parse(core_seq, "fasta"):
    protein_id = record.id
    protein_seq = record.seq.translate(to_stop=True)
    new_record = SeqRecord(protein_seq, "%s" % protein_id, '', '')
    sequence.append(new_record)
SeqIO.write(sequence, "%s.protein.fa" %(core_seq), "fasta")
