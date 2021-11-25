## Select non-overlap domains for each genes.

import os
import sys

rpsblast_result = sys.argv[1] # rpsblast output after selection
core_gene_list=[]
core_gene_lines_dict={}

for line in open(rpsblast_result).readlines():
    core_gene = line.split()[0]
    if core_gene not in core_gene_list:
        core_gene_list.append(core_gene)
num_core_gene = len(core_gene_list)

filename = "%s.non-overlap" % rpsblast_result
with open (rpsblast_result) as f:
    lines = f.readlines()
    for i in range(len(lines)):
        current_line = lines[i].split()
        gene = current_line[0]
        for core_num in range(num_core_gene):
            core_gene = core_gene_list[core_num]
            if gene == core_gene:
                if gene in core_gene_lines_dict:
                    core_gene_lines_dict[gene].append(i)
                else:
                    core_gene_lines_dict[gene] = [i]
    for key in list(core_gene_lines_dict):
        line_num = core_gene_lines_dict[key]
        with open(filename, "a") as file:
            if len(line_num) == 1:
                new_line = lines[int(line_num[0])]
                file.write(new_line)
            else:
                compare_list = [int(line_num[0])]
                first_line = lines[int(line_num[0])]
                file.write(first_line)
                for i in range(1, len(line_num)):
                    current_line = lines[int(line_num[i])]
                    loc1 = current_line.split()[6]
                    loc2 = current_line.split()[7]
                    if int(loc1) < int(loc2):
                        start = loc1
                        end = loc2
                        count = 0
                        for a in compare_list:
                            previous_line= lines[int(a)]
                            pre_start = previous_line.split()[6]
                            pre_end = previous_line.split()[7]
                            if int(start) < int(end) < int(pre_start) or int(pre_end) < int(start) < int(end):
                                count += 1
                        if count == len(compare_list):
                            new_line = lines[int(line_num[i])]
                            compare_list.append(int(line_num[i]))
                            file.write(new_line)
                    if int(loc1) > int(loc2):
                        start = loc2
                        end = loc1
                        count = 0
                        for a in compare_list:
                            previous_line = lines[int(a)]
                            pre_start = previous_line.split()[6]
                            pre_end = previous_line.split()[7]
                            if int(start) < int(end) < int(pre_start) or int(pre_end) < int(start) < int(end):
                                count += 1
                        if count == len(compare_list):
                            new_line = lines[int(line_num[i])]
                            compare_list.append(int(line_num[i]))
                            file.write(new_line)
