library(tidyverse)
library(dplyr)
library(ggplot2
library(reshape2)

## Load the pan-genome results from three pan-genome tools.
EC_data_anvio <- read.table(file = "R_code/Fig3.three_tools_and_mixed_datasets/E_coli_data_anvio.txt",  sep = '\t', header = TRUE)
EC_data_roary <- read.table(file = "R_code/Fig3.three_tools_and_mixed_datasets/E_coli_data_roary.txt",  sep = '\t', header = TRUE)
EC_data_bpga <- read.table(file = "R_code/Fig3.three_tools_and_mixed_datasets/E_coli_data_BPGA.txt",  sep = '\t', header = TRUE)

## Reformat data.
tool <- rep("Anvi'o", 40)
gene_group <- EC_data_anvio$Group
count <- EC_data_anvio$Count
EC_anvio <- data.frame(tool,gene_group,count)

tool <- rep("Roary", 40)
gene_group <- EC_data_roary$Group
count <- EC_data_roary$Count
EC_roary <- data.frame(tool,gene_group,count)

tool <- rep("BPGA", 40)
gene_group <- EC_data_bpga$Group
count <- EC_data_bpga$Count
EC_bpga <- data.frame(tool,gene_group,count)

data <- rbind(EC_anvio, EC_roary, EC_bpga)
data$gene_group <- factor(data$gene_group , levels=c("ori", "50cut", "50cut+99comp", "50cut+99comp+2.0cont"))
my.labels <- c("original",
               "50cut", 
               "50cut\n +99comp",
               "50cut+99comp\n +2.0cont")
data$tool <- factor(data$tool , levels=c("Anvi'o", "Roary", "BPGA"))

## Make plot.
plot <- ggplot(data, aes(x = gene_group, y = count, fill=tool))+
  geom_violin(position = position_dodge(0.8), alpha = 0.5)+
  geom_boxplot(width=0.1, position = position_dodge(0.8))+
  theme(legend.position="bottom",
        legend.text = element_text(colour="black", size=30),
        legend.title = element_text(colour="black", size=32),
        axis.text.x = element_text(color="black", size=28, face= "bold"),
        axis.text.y = element_text(color="black", size=28, face= "bold"),
        axis.title.x = element_text(size=30, face= "bold"),
        axis.title.y = element_text(size=30, face= "bold"))+
  scale_fill_discrete(name = "Tools")+
  scale_x_discrete(name = "Groups", labels=my.labels)+
  scale_y_continuous(name = "Number of core gene families")

plot

