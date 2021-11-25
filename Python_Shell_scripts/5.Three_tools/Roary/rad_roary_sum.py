## Summarize roary results (scripts should be saved and run separately).

## sum_ori.py
import os
import sys

species= sys.argv[1]
random_num=sys.argv[2]
filename=os.path.join("pan-genome_" + species, "simulation", "random_" + random_num, "ori_roary/i90cd100/summary_statistics.txt")
sum_file = open("./summary/sum_ori.txt", "a+")
with open(filename, "r+") as infile:
  lines=infile.readlines()
  for line in lines:
    line = line.strip()
    columns = line.split("\t")
    name = columns[0]
    gene_num = columns[2]
    sum_file.write("%s\t%s\t%s\t%s\n" % (species, random_num, name, gene_num))

# sum_frag.py
import os
import sys

species= sys.argv[1]
random_num=sys.argv[2]
filename=os.path.join("pan-genome_" + species, "simulation", "random_" + random_num, "simulation/100cut/100comp/roary/i90cd100/summary_statistics.txt")
sum_file = open("./summary/sum_frag.txt", "a+")
with open(filename, "r+") as infile:
  lines=infile.readlines()
  for line in lines:
    line = line.strip()
    columns = line.split("\t")
    name = columns[0]
    gene_num = columns[2]
    sum_file.write("%s\t%s\t%s\t%s\n" % (species, random_num, name, gene_num))

# sum_comp.py
import os
import sys

species= sys.argv[1]
random_num=sys.argv[2]
filename=os.path.join("pan-genome_" + species, "simulation", "random_" + random_num, "simulation/100cut/99comp/roary/i90cd100/summary_statistics.txt")
sum_file = open("./summary/sum_comp.txt", "a+")
with open(filename, "r+") as infile:
  lines=infile.readlines()
  for line in lines:
    line = line.strip()
    columns = line.split("\t")
    name = columns[0]
    gene_num = columns[2]
    sum_file.write("%s\t%s\t%s\t%s\n" % (species, random_num, name, gene_num))

# sum_cont.py
import os
import sys

species= sys.argv[1]
random_num=sys.argv[2]
filename=os.path.join("pan-genome_" + species, "simulation", "random_" + random_num, "simulation/100cut/99comp/cont/2.0cont/roary/i90cd100/summary_statistics.txt")
sum_file = open("./summary/sum_cont.txt", "a+")
with open(filename, "r+") as infile:
  lines=infile.readlines()
  for line in lines:
    line = line.strip()
    columns = line.split("\t")
    name = columns[0]
    gene_num = columns[2]
    sum_file.write("%s\t%s\t%s\t%s\n" % (species, random_num, name, gene_num))
