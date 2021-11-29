library(tidyverse)
library(dplyr)
library(ggplot2)
library(reshape2)

## Load fragmentation data, model data, and equation table.
frag_data <- read.table(file = "R_code/Fig3.frag_incomp/frag_CG100_core.txt",  sep = '\t', header = TRUE)
mod_data <- read.table(file = "R_code/Fig3.frag_incomp/frag_model.txt",  sep = '\t', header = TRUE)
equation_data <- read.table(file = "/R_code/Fig3.frag_incomp/frag_equation.txt",  sep = '\t', header = TRUE)

## Summarize the frag data for E. coli and B. pertussis.

# Subset E. coli data.
EC_data <- subset(frag_data, Species=='E. coli')
EC_mod_frag <- subset(mod_data, Species=='E. coli')

# Make plot and add labels.
EC_frag_plot <- ggplot(data=EC_data,aes(x=Cut, y=genes))+
  geom_point()+
  geom_line(data=EC_mod_frag, aes(x=xvalues, y=yvalues), color="red")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        legend.position="none",
        axis.text.x = element_text(color="black", size=28, face= "bold"),
        axis.text.y = element_text(color="black", size=28, face= "bold"),
        axis.title.x = element_text(size=30, face= "bold"),
        axis.title.y = element_text(size=30, face= "bold"))+
  scale_x_continuous(name="The average number of fragments")+
  scale_y_continuous(name="The number of core gene families", limits = c(0, 5000))+
  scale_colour_discrete("Species")+
  geom_text(data=EC_data, aes(label=genes), hjust = 0.5, vjust=-2, size = 8,  fontface= "bold")+
  geom_text(label="y=e^(-0.004115x+7.862)", x=200, y=4400, size = 10, color="black")+
  geom_text(label="R^2=0.9982", x=200, y=4000, size = 8, color="blue")+
  geom_text(label="P=7.646e-07", x=300, y=4000, size = 8, color="red")

# Subset B. pertussis data.
BoP_data <- subset(frag_data, Species=='B. pertussis')
BoP_mod_frag <- subset(mod_data, Species=='B. pertussis')

BoP_frag_plot <- ggplot(data=BoP_data,aes(x=Cut, y=genes))+
  geom_point()+
  geom_line(data=BoP_mod_frag, aes(x=xvalues, y=yvalues), color="red")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        legend.position="none",
        axis.text.x = element_text(color="black", size=28, face= "bold"),
        axis.text.y = element_text(color="black", size=28, face= "bold"),
        axis.title.x = element_text(size=30, face= "bold"),
        axis.title.y = element_text(size=30, face= "bold"))+
  scale_x_continuous(name="The average number of fragments")+
  scale_y_continuous(name="The number of core gene families", limits = c(0, 5000))+
  scale_colour_discrete("Species")+
  geom_text(data=BoP_data, aes(label=genes), hjust = 0.5, vjust=-2, size = 8,  fontface= "bold")+
  geom_text(label="y=e^(-0.003664x+8.036)", x=200, y=4400, size = 10, color="black")+
  geom_text(label="R^2=0.9979", x=200, y=4000, size = 8, color="blue")+
  geom_text(label="P=1.092e-06", x=300, y=4000, size = 8, color="red")

## Plot for other 15 species (FigS3.A).
frag_data_no_EC_BoP <- subset(frag_data, c(Species!='E. coli' & Species!='B. pertussis'))
mod_data_no_EC_BoP <- subset(mod_data, c(Species!='E. coli' & Species!='B. pertussis'))
equation_no_EC_BoP <- subset(equation_data, c(Species!='E. coli' & Species!='B. pertussis'))

frag_plot_15species <- ggplot(data=frag_data_no_EC_BoP,aes(x=Cut, y=genes, color=Species)) +
  geom_point()+
  theme(legend.position="none",
        axis.text.x = element_text(color="black", size=20),
        axis.text.y = element_text(color="black", size=22),
        axis.title.x = element_text(size=24, face = "bold"),
        axis.title.y = element_text(size=24, face = "bold"))+
  scale_x_continuous(name="The average number of fragments")+
  scale_y_continuous(name="The number of core gene families", limits = c(0, 5000))+
  facet_wrap(facets = vars(Species))+
  theme(strip.text.x = element_text(size = 18, face = "bold.italic"))+
  geom_text(data=equation_no_EC_BoP, x=200, y=4400, aes(label = paste0("y=e^","(",a,"x+",b,")"), fontface="bold"), color="black", size = 6.2)+
  geom_line(data=mod_data_no_EC_BoP, aes(x=xvalues,y=yvalues,color=Species))
