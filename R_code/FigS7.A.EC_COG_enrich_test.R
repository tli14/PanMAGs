library(tidyverse)
library(dplyr) 
library(ggplot2) 
library(rlist)

## Read COG enrichment files.
core <- read.table(file = "R_code/Supplementary_fig_data/FigS7.A.EC_ori_CG100_core", sep = "\t" )
acc <- read.table(file = "R_code/Supplementary_fig_data/FigS7.A.EC_ori_CG100_acc", sep = "\t" )
uniq <- read.table(file = "R_code/Supplementary_fig_data/FigS7.A.EC_ori_CG100_uniq", sep = "\t" )

## Reformat data.
Groups <- rep("core", 10)
COG <- core$V1
pvalue <- core$V6
core_data <- data.frame(Groups,COG, pvalue)

Groups <- rep("accessory", 8)
COG <- acc$V1
pvalue <- acc$V6
acc_data <- data.frame(Groups,COG, pvalue)

Groups <- rep("unique", 6)
COG <- uniq$V1
pvalue <- uniq$V6
uniq_data <- data.frame(Groups,COG, pvalue)

EC_enrich_data <- rbind(core_data, acc_data, uniq_data)
EC_enrich_data$Groups <- factor(EC_enrich_data$Groups, levels=c("core", "accessory", "unique"))
COG_list <- c("J", "E", "X", "C", "H", "M", "N", "F", "O", "P","L","U", "W", "T", "V", "I", "Q", "K", "D", "S", "G")
COG_order <-  list.reverse(COG_list)
EC_enrich_data$COG <- factor(EC_enrich_data$COG, levels=COG_order)

## Generate plot.
enrich_plot <- ggplot(EC_enrich_data, aes(x = COG, y = -log10(pvalue), fill=Groups))+
  geom_bar(stat="identity", position = position_dodge())+
  scale_fill_brewer(palette="Accent" )+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        legend.position="bottom",
        legend.text = element_text(colour="black", size=28, face= "bold"),
        legend.title = element_text(colour="black", size=30, face= "bold"),
        axis.text.x = element_text(color="black", size=28, face= "bold"),
        axis.text.y = element_text(color="black", size=28, face= "bold"),
        axis.title.x = element_text(size=30, face= "bold"),
        axis.title.y = element_text(size=30, face= "bold"))+
  scale_x_discrete(name = "COG categories")+
  scale_y_continuous(name = "-log10(pvalues)")+
  coord_flip()
