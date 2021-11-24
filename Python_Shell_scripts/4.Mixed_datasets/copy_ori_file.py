# Generate mixed datasets by combining original and simulated MAG dataset

import os
import sys
import shutil

ori_list=sys.argv[1]  # The genome list for original  dataset
sim_list=sys.argv[2]  # The genome list for simulated MAG dataset
percent=sys.argv[3]  # The percentage of MAGs in the mixed dataset. (e.g., 10)
sim_group=str("sim_")+ sys.argv[4]  # The id for the newly generated mixed dataset
sim_dict=[]

path1="MAG_percentage/EC_test/EC_ori_gff"
path2="MAG_percentage/EC_test/sim_data"

for line in open(sim_list).readlines():
  sim_file=line.strip()
  sim_dict.append(sim_file)

for file in open(ori_list).readlines():
  ori_file=file.strip()
  filename=os.path.join(path1, ori_file + "." + "prokka.gff")
  if ori_file not in sim_dict:
    newfile=os.path.join(path2, "MAG" + "_" + percent, sim_group, "data")
    print(newfile)
    shutil.copy(filename, newfile)
