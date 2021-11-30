library(tidyverse)
library(dplyr)
library(ggplot2)
library(reshape2)
library(ggpubr)

# Read files.
core <- read.table(file = "R_code/Supplementary_fig_data/FigS5.B.core_4_species.txt",  sep = '\t', header = TRUE)
cloud <- read.table(file = "R_code/Supplementary_fig_data/FigS5.B.cloud_4_species.txt",  sep = '\t', header = TRUE)

# Generate figures.
plot_core <- ggplot(data=core,aes(x=cont, y=gene_count, colour=group)) +
  geom_line()+
  theme(legend.position="bottom",
        legend.text = element_text(colour="black", size=20,face= "bold"),
        legend.title = element_text(colour="black", size=24, face= "bold"),
        axis.text.x = element_text(color="black", size=20, face= "bold"),
        axis.text.y = element_text(color="black", size=22, face= "bold"),
        axis.title.x = element_text(size=24, face= "bold"),
        axis.title.y = element_text(size=24, face= "bold"))+
  scale_x_continuous(name="The average contamination(%)")+
  scale_y_continuous(name="Number of core gene families")+
  geom_point()+
  facet_wrap(facets = vars(species), nrow=1)+
  theme(strip.text.x = element_text(size = 22, face = "bold.italic"))

plot_cloud <- ggplot(data=cloud,aes(x=cont, y=gene_count, colour=group)) +
  geom_line()+
  theme(legend.position="bottom",
        legend.text = element_text(colour="black", size=20, face= "bold"),
        legend.title = element_text(colour="black", size=24, face= "bold"),
        axis.text.x = element_text(color="black", size=20, face= "bold"),
        axis.text.y = element_text(color="black", size=22, face= "bold"),
        axis.title.x = element_text(size=24, face= "bold"),
        axis.title.y = element_text(size=24, face= "bold"))+
  scale_x_continuous(name="The average contamination(%)")+
  scale_y_continuous(name="Number of cloud gene families")+
  geom_point()+
  facet_wrap(facets = vars(species),nrow=1)+
  theme(strip.text.x = element_text(size = 22, face = "bold.italic"))

# Combined plot.
combined_plot <- ggarrange(plot_core, plot_cloud,
                           ncol = 1, nrow = 2,
                           common.legend = TRUE, legend = "bottom")
