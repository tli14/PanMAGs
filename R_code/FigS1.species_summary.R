library(tidyverse)
library(dplyr) 
library(ggplot2)
library(reshape2)

## pan-genome plot for all the species
data <- read.table(file = "R_code/Supp_fig_data/FigS1.summary_species.txt",  sep = '\t', header = FALSE)
species_count <- read.table(file = "R_code/Supp_fig_data/FigS1.summary_species_count.txt",  sep = '\t', header = TRUE)

species_order <- factor(data$V1, level = c('Corynebacterium pseudotuberculosis',
                                           'Neisseria meningitidis',
                                           'Helicobacter pylori',
                                           'Streptococcus pyogenes',
                                           'Campylobacter jejuni',
                                           'Bordetella pertussis',
                                           'Mycobacterium tuberculosis',
                                           'Listeria monocytogenes',
                                           'Staphylococcus aureus',
                                           'Enterococcus faecium', 
                                           'Bacillus subtilis',
                                           'Acinetobacter baumannii',
                                           'Burkholderia pseudomallei',
                                           'Pseudomonas aeruginosa',
                                           'Klebsiella pneumoniae',
                                           'Salmonella enterica',
                                           'Escherichia coli'))

gene_order <- factor(data$V2, level = c('Cloud genes',
                                        'Shell genes',
                                        'Soft core genes',
                                        'Core genes'))

speices_total_gene <- aggregate(data$V3, by=list(species=data$V1), FUN=sum)
species_lable <- merge(speices_total_gene, species_count, by="species", all=TRUE)
colnames(species_lable)[2] <- "total"

plot <- ggplot(data, aes(x = species_order, y = V3))+
  geom_bar(stat="identity", aes(fill = gene_order), width = 0.7)+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        legend.position=c(0.65, 0.3), text = element_text(size = 24),
        legend.text = element_text(size=20),
        axis.text.x = element_text(color="black", size=22),
        axis.text.y = element_text(color="black", size=22, face = "italic"),
        axis.title.x = element_text(size=25),
        axis.title.y = element_text(size=25))+
  scale_x_discrete(name="Species")+
  scale_y_continuous(name="The number of gene families", limits = c(0, 40000))+
  scale_fill_discrete(name="pan-genome", labels=c("cloud genes(0%<=strains<15%)", "shell genes(15%<=strains<95%)", "soft core genes(95%<=strains<100%)", "core genes(100% strains)"))+
  coord_flip()+
  geom_text(data=species_lable, aes(x = species, y = total+2200, label = paste("n=",count)), color="black", size = 6.2)

plot
