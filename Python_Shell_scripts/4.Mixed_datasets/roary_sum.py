# Summary Roary results for multiple mixed datasets.

import os
import sys

MAG_per = str("MAG_") + sys.argv[1]
sim = str("sim_")+ sys.argv[2]
path="pan-genome/MAG_percentage/EC_test/sim_data"
filename=os.path.join(path, MAG_per, sim, "roary/i90cd100/summary_statistics.txt")
sum_file = open("roary_summary.txt", "a+")
with open(filename, "r+") as infile:
  lines=infile.readlines()
  for line in lines:
    line = line.strip()
    columns = line.split("\t")
    name = columns[0]
    gene_num = columns[2]
    sum_file.write("%s\t%s\t%s\t%s\n" % (MAG_per, sim, name, gene_num))
