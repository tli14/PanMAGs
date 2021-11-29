## Change tree id with new id file.

# change_tree_id.py (save in the directory: "$PWD/phylogenetic_tree")
import os
import sys
from string import strip
from ete3 import Tree

new_id_for_tree = sys.argv[1] # tab delimited file contains old ids and new ids
old_tree = sys.argv[2] # "accessory_binary_genes.fa.newick" file in Roary outputs

oldid2new = dict([map(strip, line.split("\t")) for line in open(new_id_for_tree)])
t = Tree(old_tree)
for leaf in t.iter_leaves():
      leaf.name = oldid2new[leaf.name]
filename = "%s.nw" % old_tree
t.write(outfile=filename)
