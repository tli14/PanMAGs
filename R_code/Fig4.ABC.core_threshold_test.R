library(tidyverse)
library(plyr)
library(dplyr)
library(ggplot2)
library(reshape2)

## 1. Fragmentation data for E. coli dataset by using Roary pan-genome analysis.
EC_frag_roary_CG <- read.table(file = "R_code/Fig4.Core_gene_thred/E_coli_frag.txt",  sep = '\t', header = TRUE)

EC_frag_roary_CG_plot <- ggplot(data=frag,aes(x=Cut, y=genes,group=factor(Group)))+
  geom_line(stat="identity", aes(color=factor(Group)), size=1.5)+
  geom_point()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        legend.direction="horizontal",
        legend.position="bottom",
        legend.title = element_text(size=32, face= "bold"),
        legend.box.just = "center",
        legend.text = element_text(size=30, face= "bold"),
        axis.text.x = element_text(color="black", size=28, face= "bold"),
        axis.text.y = element_text(color="black", size=28, face= "bold"),
        axis.title.x = element_text(size=30, face= "bold"),
        axis.title.y = element_text(size=30, face= "bold"))+
  scale_x_continuous(name="The average number of fragments", limits = c(0, 400))+
  scale_y_continuous(name="Number of core gene families", limits = c(0, 4000))+
  scale_color_discrete(name = "Core Gene Threshold (%) for fragmentation")+
  guides(colour = guide_legend(title.position = "top"))

EC_frag_roary_CG_plot


## 2. Incompleteness data for E. coli dataset by using Roary pan-genome analysis.

EC_incomp_roary_CG <- read.table(file = "R_code/Fig4.Core_gene_thred/E_coli_incomp.txt",  sep = '\t', header = TRUE)

EC_incomp_roary_CG_plot <- ggplot(data=EC_incomp_roary_CG,aes(x=Incomp, y=genes,group=factor(Group)))+
  geom_line(stat="identity", aes(color=factor(Group)), size=1.5)+
  geom_point()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        legend.direction="horizontal",
        legend.position="bottom",
        legend.title = element_text(size=32, face= "bold"),
        legend.box.just = "center",
        legend.text = element_text(size=30, face= "bold"),
        axis.text.x = element_text(color="black", size=28, face= "bold"),
        axis.text.y = element_text(color="black", size=28, face= "bold"),
        axis.title.x = element_text(size=30, face= "bold"),
        axis.title.y = element_text(size=30, face= "bold"))+
  scale_x_continuous(name="The average incompleteness (%)")+
  scale_y_continuous(name="Number of core gene families", limits = c(0, 4000))+
  scale_color_discrete(name = "Core gene threshold (%) for incompleteness")+
  guides(colour = guide_legend(title.position = "top"))

EC_incomp_roary_CG_plot
