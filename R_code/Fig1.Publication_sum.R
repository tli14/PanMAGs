library(tidyverse)
library(ggplot2)
library(dplyr)
library(ggpubr)

## Figure S1.A. Year of publication.
table <- read.table(file = "R_code/FigS1.Publication_sum/years.txt", sep = ',', header = TRUE)

year_plot <-  ggplot(data=table, aes(x=Year))+
  geom_bar(width = 0.7, fill="#56B4E9", colour="black")+
  theme(axis.text.x = element_text(color="black", size=30, face= "bold"),
        axis.text.y = element_text(color="black", size=30, face= "bold"),
        axis.title.x = element_text(size=32, face= "bold"),
        axis.title.y = element_text(size=32, face= "bold"),)+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  scale_y_continuous(name = "Number of publications")

year_plot


## Figure S1.B. Metagenome sources.
source <- read.table(file="R_code/FigS1.Publication_sum/metagenome_source.txt", sep = '\t', header = TRUE)

source_plot <- ggplot(source, aes(x="", y=Number, fill=reorder(Source,-Number)))+
  geom_bar(width = 1, stat = "identity",colour="black")+
  coord_polar("y",start=0, direction = -1)+
  geom_text(aes(label = paste0(round(Number/sum(Number)*100), "%")), position = position_stack(vjust = 0.5), size=7, fontface= "bold")+
  labs(x = NULL, y = NULL, fill = "Metagenome Sources")+
  theme_classic() + 
  theme(legend.text = element_text(color="black", size=30, face= "bold"),
        legend.title = element_text(color="black", size=32, face= "bold"),
        axis.text.y = element_text(color="black", size=30, face= "bold"),
        axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank())+
  scale_fill_brewer(palette="Set3")

source_plot

## Figure S1.C. Tool usage in different years. 
table_tools <- read.table(file = "R_code/FigS1.Publication_sum/years_tool.txt", header = TRUE)

table_tools$Tools_mod <- factor(table_tools$Tools_mod , levels=c("Anvi'o", "Roary", "BPGA", "GET_HOMOLOGUES", "OrthoMCL", "ITEP", "others"))

year_tool_plot <-  ggplot(data=table_tools, aes(x = Year))+
  geom_bar(aes(fill=Tools_mod), width = 0.8, colour="black")+
  theme(legend.position = c(0.23, 0.7),
        legend.text = element_text(color="black", size=26, face= "bold"),
        legend.title = element_text(color="black", size=30, face= "bold"),
        axis.text.x = element_text(color="black", size=30, face= "bold"),
        axis.text.y = element_text(color="black", size=32, face= "bold"),
        axis.title.x = element_text(size=30, face= "bold"),
        axis.title.y = element_text(size=32, face= "bold"))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  scale_y_continuous(name = "Number of tool usages")+
  labs(fill = "Tools")+
  scale_fill_brewer(palette="Set3")

year_tool_plot


## Figure S1.D. CG thresholds in different studies.
table_CG <- read.table(file = "R_code/FigS1.Publication_sum/CG.txt", header = TRUE)

table_CG$CG <- factor(table_CG$CG , levels=c("100", "90", "99", "95", "85", "66"))

CG_plot <- ggplot(table_CG, aes(x="", y=Number, fill=CG))+
  geom_bar(width = 1, stat = "identity",colour="black")+
  coord_polar("y", start=0, direction = -1)+
  geom_text(aes(label = paste0(round(Number/sum(Number)*100), "%")), position = position_stack(vjust = 0.5), size=8,  fontface= "bold")+
  labs(x = NULL, y = NULL, fill = "Core Gene (CG) \nThreshold")+
  theme_classic() + 
  theme(legend.text = element_text(colour="black", size=30, face= "bold"),
        legend.title = element_text(colour="black", size=32, face= "bold"),
        axis.text.y = element_text(color="black", size=30, face= "bold"),
        axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank())+
  scale_fill_brewer(palette="Set3")


## Figure S1.E. MAG percentage
table_mag <- read.table(file = "R_code/FigS1.Publication_sum/MAG_percentage.txt", header = TRUE)

mag_percentage_histogram <- ggplot(data = table_mag, aes(x = MAG),fill=MAG) +
  geom_histogram(color="black", fill="lightpink", binwidth = 10, position = 'identity')+
  scale_x_continuous(name="% MAGs in the dataset")+
  scale_y_continuous(name="Number of pan-genome \n analyses")+
  theme(axis.text.x = element_text(color="black", size=30,face= "bold"),
        axis.text.y = element_text(color="black", size=30, face= "bold"),
        axis.title.x = element_text(size=32, face= "bold"),
        axis.title.y = element_text(size=32, face= "bold"),)+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))
mag_percentage_histogram


##  Figure S1.F. Genome dataset size.
total_genomes_histogram <- ggplot(data = table_mag, aes(x = genomes),fill=MAG) +
  geom_histogram(color="black", fill="lightgreen", position = 'identity')+
  scale_x_continuous(name = "#Total Genomes (log10)", trans = 'log10')+
  scale_y_continuous(name="Number of pan-genome \n analyses")+
  theme(axis.text.x = element_text(color="black", size=30, face= "bold"),
        axis.text.y = element_text(color="black", size=30, face= "bold"),
        axis.title.x = element_text(size=32, face= "bold"),
        axis.title.y = element_text(size=32, face= "bold"),)+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))
total_genomes_histogram


## Figure S1. The combined plot.
FigureS1 <- ggarrange(year_plot,source_plot, year_tool_plot, CG_plot, mag_percentage_histogram, total_genomes_histogram,
                     nrow = 3, ncol =2, labels = c("A", "B", "C", "D", "E", "F"),
                     font.label = list(size = 50))

ggsave(FigureS1, filename = "R_code/FigS1.Publication_sum/combine_plot.pdf",width = 24, height = 24, units = "in")

