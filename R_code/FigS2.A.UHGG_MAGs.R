library(tidyverse)
library(ggpubr)
library(ggplot2)

# The number of contigs in MAGs.
N_contigs <- read.csv("R_code/Supplementary_fig_data/FigS2.N_contigs.txt")

Contig_histogram <- ggplot(data = N_contigs, aes(Number),fill=Number) +
  geom_histogram(color="black", fill="lightblue", binwidth = 50, position = 'identity')+
  scale_x_continuous(name="Number of contigs in MAGs", breaks = seq(0, 4200, 100))+
  scale_y_continuous(name="Number of MAGs")+
  theme(axis.text.x = element_text(color="black", size=18, angle = 45, vjust=1.0, hjust=1.0),
        axis.text.y = element_text(color="black", size=18),
        axis.title.x = element_text(size=18),
        axis.title.y = element_text(size=18),)

Contig_histogram

# Completeness percentage in MAGs.
completeness <- read.csv("R_code/Supplementary_fig_data/FigS2.completeness.txt")

completeness_histogram <- ggplot(data = completeness, aes(Completeness),fill=Completeness) +
  geom_histogram(color="black", fill="lightblue", binwidth = 0.5, position = 'identity')+
  scale_x_continuous(name="%completeness in MAGs", breaks = seq(50, 100, 5))+
  scale_y_continuous(name="Number of MAGs")+
  theme(axis.text.x = element_text(color="black", size=18),
        axis.text.y = element_text(color="black", size=18),
        axis.title.x = element_text(size=18),
        axis.title.y = element_text(size=18),)

completeness_histogram

# Contamination percentage in MAGs.
contamination <- read.csv("R_code/Supplementary_fig_data/FigS2.contamination.txt")

contamination_histogram <- ggplot(data = contamination, aes(Contamination),fill=Contamination) +
  geom_histogram(color="black", fill="lightblue", binwidth = 0.05, position = 'identity')+
  scale_x_continuous(name="%contamination in MAGs", breaks = seq(0, 5, 0.25))+
  scale_y_continuous(name="Number of MAGs")+
  theme(axis.text.x = element_text(color="black", size=18, angle = 30, vjust=1.0, hjust=1.0),
        axis.text.y = element_text(color="black", size=18),
        axis.title.x = element_text(size=18),
        axis.title.y = element_text(size=18),)

contamination_histogram

## Combined plot.
combined_plot <- ggarrange(Contig_histogram, completeness_histogram, contamination_histogram, 
         nrow = 3, heights = c(1, 1, 1))

combined_plot

