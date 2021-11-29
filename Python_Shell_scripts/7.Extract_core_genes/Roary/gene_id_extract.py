# gene_id_extract.py (saved in the directory: "$PWD/Core_gene/Roary_core_gene")

import os
import sys
import Bio
import pandas as pd

i = sys.argv[1] # gene_presence_absence.csv in Roary outputs

data = pd.read_csv (i, sep='["],["]', engine='python')
df = pd.DataFrame(data)
pd.set_option('display.max_rows', df.shape[0]+1)
df['"Gene'] = df['"Gene'].str.replace('"','')
new_df = df.iloc[: , [0, 3]]
new_df.to_csv("output.txt", header=None, index=False, sep="\t")
