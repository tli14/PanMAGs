library(tidyverse)
library(dplyr)
library(ggplot2)
library(reshape2)

## Core and cloud gene data.
cont_data <- read.table(file = "R_code/Supplementary_fig_data/FigS5.A.summary_cont_core.txt",  sep = '\t', header = TRUE)
cont_cloud_data <- read.table(file = "R_code/Supplementary_fig_data/FigS5.A.summary_cont_cloud.txt",  sep = '\t', header = TRUE)
data <- merge(cont_data,cont_cloud_data,by=c("Species","cont"))

## Generate plot.
contamination_plot <- ggplot(data, aes(x=cont)) +
  geom_line( aes(y=core_num, colour=Species)) + 
  geom_line( aes(y=cloud_num/coeff)) +
  scale_y_continuous(name = "Number of core gene families",
                     sec.axis = sec_axis(trans=~.*coeff, name="Number of cloud gene families"))+
  scale_x_continuous(name="The average contamination(%)")+
  theme(legend.position="bottom",
        legend.text = element_text(colour="black", size=24),
        legend.title = element_text(colour="black", size=26),
        axis.text.x = element_text(colour="black", size=22),
        axis.text.y = element_text(colour="black", size=22),
        axis.title.x = element_text(size=24, face = "bold"),
        axis.title.y = element_text(size=24, face = "bold"))+
  geom_point( aes(y=core_num, colour=Species))+
  geom_point( aes(y=cloud_num/coeff))+
  facet_wrap(facets = vars(Species))+
  theme(strip.text.x = element_text(size = 16, face = "bold.italic"))+
  guides(color = FALSE, linetype=guide_legend(title="Gene groups"))

contamination_plot
