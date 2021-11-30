.libPaths("/Users/litang/Desktop/RLibrary")
library(tidyverse)
library(dplyr)   # For data manipulation
library(ggplot2) 

## Load phylogenetic comparison data of E. coli.
EC_group <- read.table(file = "R_code/Fig7.phylogenetic_tree/EC_10_groups_core_algn_ete.txt", sep = "\t" )
EC_group$V1 <- factor(EC_group$V1, levels=c("50cut", "99comp", "2.0cont"))

## The nRF values for 10 E. coli datasets. The y-axis range between 0 and 1.
plot_EC <- ggplot(data=EC_group,aes(x=V1, y=V2, group=V1, fill=V1))+
  geom_violin(trim=TRUE)+
  geom_boxplot(width=0.1, fill="white")+
  theme(legend.position="none",
        axis.text.x = element_text(color="black", size=22),
        axis.text.y = element_text(color="black", size=22),
        axis.title.x = element_text(size=25),
        axis.title.y = element_text(size=25))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  scale_x_discrete(name="Groups")+
  scale_y_continuous(name="The nRF distance between trees", limits = c(0, 1))

plot_EC

## The frequency of edges (for Figure S9.C). 
plot_EC_edges <- ggplot(data=EC_group,aes(x=V1, y=V3, group=V1, fill=V1)) +
  geom_violin(trim=TRUE)+
  geom_boxplot(width=0.1, fill="white")+
  theme(legend.position="none",
        axis.text.x = element_text(color="black", size=22),
        axis.text.y = element_text(color="black", size=22),
        axis.title.x = element_text(size=25),
        axis.title.y = element_text(size=25))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  scale_x_discrete(name="Groups")+
  #scale_y_continuous(name="The normalized Robinson-Foulds (nRF) distance between trees", limits = c(0, 0.6))
  scale_y_continuous(name="The frequency of edges in target tree found in the reference", limits = c(0.7, 1))

plot_EC_edges
