## Extract cog information from rpsblast results (each cog category per line) after the selection of non-overlap domains.

import os
import sys

rpsblast_result = sys.argv[1] # rpsblast output after selection
cdd_COGid_match = sys.argv[2] # cddid_all.tbl
COGid_COGfun_match = sys.argv[3] # cog-20.def.tab
cdd_cog_dic={}
COGid_COGfun_dict = {}
cog_list=[]

# Make dictionaries
for line in open(cdd_COGid_match).readlines():
    cdd = line.split('\t')[0]
    COGid = line.split('\t')[1]
    cdd_cog_dic[cdd] = COGid
for line in open(COGid_COGfun_match).readlines():
    COGid = line.split('\t')[0]
    cog_list.append(COGid)
    COGfun =line.split('\t')[1]
    COGid_COGfun_dict[COGid] = COGfun

# COG assignment
for line in open(rpsblast_result).readlines():
    core_gene = line.split('\t')[0]
    cdd_line = line.split('\t')[1]
    cdd_id = cdd_line.split(':')[1]
    COGid = cdd_cog_dic[cdd_id]
    filename = "%s.COG" % rpsblast_result
    if COGid in cog_list:
        COGfun = COGid_COGfun_dict[COGid]
        if len(COGfun) == 1:
            lines = "{}\t{}\t{}\t{}\n".format(core_gene, cdd_id, COGid, COGfun)
            with open(filename, "a") as f:
                f.write(lines)
        else:
            for i in range(len(COGfun)):
                COGfun_new = COGfun[i]
                lines = "{}\t{}\t{}\t{}\n".format(core_gene, cdd_id, COGid, COGfun_new)
                with open(filename, "a") as f:
                    f.write(lines)
    else:
        COGfun = "NA"
        lines = "{}\t{}\t{}\t{}\n".format(core_gene,cdd_id,COGid,COGfun)
        with open(filename, "a") as f:
            f.write(lines)
