.libPaths("/Users/litang/Desktop/RLibrary")
library(tidyverse)
library(dplyr)   # For data manipulation
library(ggplot2) # For data visualization
library(reshape2)

## Load data for four groups: original (ori), fragmentation (50cut), incompleteness (50cut+99comp), and contamination (50cut+99comp+2.0cont). 
ori <- read.table(file = "R_code/Fig3.frag_incomp/EC_ori.txt",  sep = '\t', header = FALSE)
cut <- read.table(file = "R_code/Fig3.frag_incomp/EC_frag.txt",  sep = '\t', header = FALSE)
comp <- read.table(file = "R_code/Fig3.frag_incomp/EC_incomp.txt",  sep = '\t', header = FALSE)
cont <- read.table(file = "R_code/Fig3.frag_incomp/EC_cont.txt",  sep = '\t', header = FALSE)

## Reformat the data.
group <- rep("original", 50)
gene_count <- ori$V5
ori_mod <- data.frame(group,gene_count)

group <- rep("50cut", 50)
gene_count <- cut$V4
cut_mod <- data.frame(group,gene_count)

group <- rep("50cut+99comp", 50)
gene_count <- comp$V4
comp_mod <- data.frame(group,gene_count)

group <- rep("50cut+99comp+2.0cont", 50)
gene_count <- cont$V5
cont_mod <- data.frame(group,gene_count)

data <- rbind(ori_mod, cut_mod, comp_mod, cont_mod)

data$group <- factor(data$group , levels=c("original", "50cut", "50cut+99comp", "50cut+99comp+2.0cont"))
my.labels <- c("original",
               "50cut", 
               "50cut\n +99comp",
               "50cut+99comp\n +2.0cont")

## Make violin plot.
plot_violin <- ggplot(data, aes(x = group, y = gene_count, fill=group))+
  geom_violin(trim=FALSE)+
  geom_boxplot(width=0.1, fill="white")+
  theme(legend.position="none",
        axis.text.x = element_text(color="black", size=28, face= "bold"),
        axis.text.y = element_text(color="black", size=28, face= "bold"),
        axis.title.x = element_text(size=30, face= "bold"),
        axis.title.y = element_text(size=30, face= "bold"))+
  scale_x_discrete(name = "Groups", labels= my.labels)+
  scale_y_continuous(name = "Number of core gene families")+
  stat_summary(fun= mean, geom = "point", color = "red", 
               shape=18, size=4, show.legend = FALSE) 
plot_violin

