library(tidyverse)
library(dplyr)
library(ggplot2)

## Load the data files that summarize the core gene comparison results (three tools were used with varying core gene threshold).
Roary_EC <- read.table(file = "R_code/Fig5.core_gene_thred/EC_diff_CG_Roary.txt",sep = '\t', header = TRUE)
BPGA_EC <- read.table(file = "R_code/Fig5.core_gene_thred/EC_diff_CG_BPGA.txt", sep = '\t', header = TRUE)
Anvio_EC <- read.table(file = "R_code/Fig5.core_gene_thred/EC_diff_CG_Anvio.txt", sep = '\t', header = TRUE)

## Reformat the data and combined to one file.
Tools <- rep("Roary", 50)
CG <- Roary_EC$CG
share <- (Roary_EC$core_shared.core_in_ori)*100
false_core <- Roary_EC$core_in_simulation_not_shared
Roary_EC_data <- data.frame(CG,Tools,share,false_core)

Tools <- rep("BPGA", 50)
CG <- BPGA_EC$CG
share <- (BPGA_EC$core_shared.core_in_ori)*100
false_core <- BPGA_EC$core_in_simulation_not_shared
BPGA_EC_data <- data.frame(CG,Tools,share,false_core)

Tools <- rep("Anvi'o", 50)
CG <- Anvio_EC$CG
share <- (Anvio_EC$core_shared.core_in_ori)*100
false_core <- Anvio_EC$core_in_simulation_not_shared
Anvio_EC_data <- data.frame(CG,Tools,share,false_core)

data <- rbind(Anvio_EC_data, Roary_EC_data, BPGA_EC_data)
data$CG <- factor(data$CG , levels=c("100", "99", "98", "95", "90"))
data$Tools <- factor(data$Tools, levels =c("Anvi'o", "Roary", "BPGA"))

## Make the plot to show the percentage of correctly identified core genes (%), which is related with the true positive rate.
plot_EC_TPR <- ggplot(data=data,aes(x=factor(CG)))+
  geom_violin(aes(y=share, fill=Tool), color="black", lwd=0.5, width = 1, position = position_dodge(0.8), trim = TRUE)+
  stat_summary(aes(x=factor(CG), group=Tool, color=Tool, y=share), fun = "mean", geom="line", size=1, position = position_dodge(0.8), alpha = 0.5)+ 
  stat_summary(aes(x=factor(CG), fill=Tool, y=share), fun = "mean", colour="black", geom="point", shape=18, size=3, position = position_dodge(0.8)) +
  scale_y_continuous(name = " The percentage of correctly\nidentified core genes (%)", limits = c(20,100), breaks=seq(0,100,20))+
  scale_x_discrete(name="Core Gene Threshold (CG)")+
  theme(legend.position="bottom",
        legend.text = element_text(colour="black", size=28, face= "bold"),
        legend.title = element_text(colour="black", size=30, face= "bold"),
        axis.text.x = element_text(color="black", size=30, face= "bold"),
        axis.text.y = element_text(color="black", size=30, face= "bold"),
        axis.title.x = element_text(size=32, face= "bold"),
        axis.title.y = element_text(size=32, face= "bold"),
        axis.title.y.right = element_text(color="black", size=30))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))
plot_EC_TPR

## Make the plot to show the number of falsely assigned core genes. 
plot_EC_FPR <- ggplot(data=data,aes(x=factor(CG)))+
  geom_violin(aes(y=false_core, fill=Tool), color="black", lwd=0.5, width = 0.5, trim = TRUE)+
  stat_summary(aes(x=factor(CG), group=Tool, color=Tool, y=false_core), fun = "mean", geom="line", size=1, position = position_dodge(0.5), alpha = 0.5)+ 
  stat_summary(aes(x=factor(CG), fill=Tool, y=false_core), fun = "mean", colour="black", geom="point", shape=18, size=3, position = position_dodge(0.5)) +
  scale_y_continuous(name="The number of falsely \nassigned core genes")+
  scale_x_discrete(name="Core Gene Threshold (CG)")+
  theme(legend.position="bottom",
        legend.text = element_text(colour="black", size=28, face= "bold"),
        legend.title = element_text(colour="black", size=30, face= "bold"),
        axis.text.x = element_text(color="black", size=30, face= "bold"),
        axis.text.y = element_text(color="black", size=30, face= "bold"),
        axis.title.x = element_text(size=32, face= "bold"),
        axis.title.y = element_text(size=32, face= "bold"),
        axis.title.y.right = element_text(color="black", size=30))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))
plot_EC_FPR
