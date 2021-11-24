library(tidyverse)
library(dplyr)
library(ggplot2)
library(reshape2)

## Load fragmentation data, model data, and equation table.
incomp_data <- read.table(file = "R_code/Fig3.frag_incomp/incomp_CG100_core.txt",  sep = '\t', header = TRUE)
mod_data <- read.table(file = "R_code/Fig3.frag_incomp/incomp_model.txt",  sep = '\t', header = TRUE)
equation_data <- read.table(file = "R_code/Fig3.frag_incomp/incomp_equation.txt",  sep = '\t', header = TRUE)

## Summarize the frag data for E. coli and B. pertussis.
# Subset E. coli data.
EC_data <- subset(incomp_data, Species=='E. coli')
EC_mod_incomp <- subset(mod_data, Species=='E. coli')
# Make plot and add labels.
EC_incomp_plot <- ggplot(data=EC_data,aes(x=incomp, y=genes))+
  geom_point()+
  geom_line(data=EC_mod_incomp, aes(x=xvalues, y=yvalues), color="red")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        legend.position="none",
        axis.text.x = element_text(color="black", size=28),
        axis.text.y = element_text(color="black", size=28),
        axis.title.x = element_text(size=30),
        axis.title.y = element_text(size=30))+
  scale_x_continuous(name="The average incompleteness")+
  scale_y_continuous(name="The number of core gene families", limits = c(0, 4000))+
  geom_text(data=EC_data, aes(label=genes), hjust = 0.5, vjust=-2, size = 8)+
  geom_text(label="y=e^(-0.8867x+7.3267)", x=2, y=3400, size = 10, color="black")+
  geom_text(label="R^2=0.9949", x=2, y=3000, size = 8, color="blue")+
  geom_text(label="P=6.159e-06", x=3.5, y=3000, size = 8, color="red")

# Subset B. pertussis data.
BoP_data <- subset(incomp_data, Species=='B. pertussis')
BoP_mod_incomp <- subset(mod_data, Species=='B. pertussis')
# Make plot and add labels.
BoP_incomp_plot <- ggplot(data=BoP_data,aes(x=incomp, y=genes))+
  geom_point()+
  geom_line(data=BoP_mod_incomp, aes(x=xvalues, y=yvalues), color="red")+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        legend.position="none",
        axis.text.x = element_text(color="black", size=28),
        axis.text.y = element_text(color="black", size=28),
        axis.title.x = element_text(size=30),
        axis.title.y = element_text(size=30))+
  scale_x_continuous(name="The average incompleteness")+
  scale_y_continuous(name="The number of core gene families", limits = c(0, 4000))+
  geom_text(data=BoP_data, aes(label=genes), hjust = 0.5, vjust=-2, size = 8)+
  geom_text(label="y=e^(-0.91195x+7.55229)", x=2, y=3400, size = 10, color="black")+
  geom_text(label="R^2=0.9958", x=2, y=3000, size = 8, color="blue")+
  geom_text(label="P=4.313e-06", x=3.5, y=3000, size = 8, color="red")

## Plot for other 15 species.
incomp_data_no_EC_BoP <- subset(incomp_data, c(Species!='E. coli' & Species!='B. pertussis'))
mod_data_no_EC_BoP <- subset(mod_data, c(Species!='E. coli' & Species!='B. pertussis'))
equation_no_EC_BoP <- subset(equation_data, c(Species!='E. coli' & Species!='B. pertussis'))

incomp_plot_15species <- ggplot(data=incomp_data_no_EC_BoP, aes(x=incomp, y=genes, color=Species))+
  geom_point()+
  theme(legend.position="none",
        axis.text.x = element_text(color="black", size=22),
        axis.text.y = element_text(color="black", size=22),
        axis.title.x = element_text(size=24, face = "bold"),
        axis.title.y = element_text(size=24, face = "bold"))+
  scale_x_continuous(name="The average incompleteness (%)",  labels =c("0", "1", "2", "3", "4","5") )+
  scale_y_continuous(name="The number of core gene families", limits = c(0, 4000))+
  facet_wrap(facets = vars(Species))+
  theme(strip.text.x = element_text(size = 18, face = "bold.italic"))+
  geom_text(data=equation_no_EC_BoP, x=2.5, y=3000, aes(label = paste0("y=e^","(",a,"x+",b,")"), fontface="bold"), color="black", size = 6.2)+
  geom_line(data=mod_data_no_EC_BoP, aes(x=xvalues,y=yvalues,color=Species))
