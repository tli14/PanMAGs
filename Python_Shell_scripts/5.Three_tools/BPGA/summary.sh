## From BPGA results, the file "3.ctrl_G2.txt" is used to calcultate the number of core genes in pan-genome.
## Count the number of core genes when using different core gene threshold.

less 3.ctrl_G2.txt | cut -f 1 | uniq -c |sort -nr| awk '$1==100'| wc -l | less
