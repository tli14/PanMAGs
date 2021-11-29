library(tidyverse)
library(tidyr)
require(reshape2)
library(ggpubr)


# plot1 #EC
data1 <- read.table("R_code/Supplementary_fig_data/FigS2.EC_count.txt",sep="\t")
colnames(data1) <- c('contig', 'completeness', 'contamination')

melt.data1 <- melt(data1)

plot1 <- ggplot(data = melt.data1, aes(x = value)) + 
  stat_density() + 
  facet_wrap(~variable, scales = "free")+
  theme(axis.text.x = element_text(color="black", size=14),
        axis.text.y = element_text(color="black", size=16),
        axis.title.x = element_text(size=22),
        axis.title.y = element_text(size=22),
        strip.text.x = element_text(size=17.5))
plot1 

# plot2 #EF
data2 <- read.table("R_code/Supplementary_fig_data/FigS2.EF_count.txt",sep="\t")
colnames(data2) <- c('contig', 'completeness', 'contamination')

melt.data2 <- melt(data2)

plot2 <- ggplot(data = melt.data2, aes(x = value)) + 
  stat_density() + 
  facet_wrap(~variable, scales = "free")+
  theme(axis.text.x = element_text(color="black", size=14),
        axis.text.y = element_text(color="black", size=16),
        axis.title.x = element_text(size=22),
        axis.title.y = element_text(size=22),
        strip.text.x = element_text(size=17.5))
plot2

# plot3 #KP
data3 <- read.table("R_code/Supplementary_fig_data/FigS2.KP_count.txt",sep="\t")
colnames(data3) <- c('contig', 'completeness', 'contamination')

melt.data3 <- melt(data3)

plot3 <- ggplot(data = melt.data3, aes(x = value)) + 
  stat_density() + 
  facet_wrap(~variable, scales = "free")+
  theme(axis.text.x = element_text(color="black", size=14),
        axis.text.y = element_text(color="black", size=16),
        axis.title.x = element_text(size=22),
        axis.title.y = element_text(size=22),
        strip.text.x = element_text(size=17.5))
plot3

# plot4 #PA
data4 <- read.table("R_code/Supplementary_fig_data/FigS2.PA_count.txt",sep="\t")
colnames(data4) <- c('contig', 'completeness', 'contamination')

melt.data4 <- melt(data4)

plot4 <- ggplot(data = melt.data4, aes(x = value)) + 
  stat_density() + 
  facet_wrap(~variable, scales = "free")+
  theme(axis.text.x = element_text(color="black", size=14),
        axis.text.y = element_text(color="black", size=16),
        axis.title.x = element_text(size=22),
        axis.title.y = element_text(size=22),
        strip.text.x = element_text(size=17.5))
plot4

# plot5 #SA
data5 <- read.table("R_code/Supplementary_fig_data/FigS2.SA_count.txt",sep="\t")
colnames(data5) <- c('contig', 'completeness', 'contamination')

melt.data5 <- melt(data5)

plot5 <- ggplot(data = melt.data5, aes(x = value)) + 
  stat_density() + 
  facet_wrap(~variable, scales = "free")+
  theme(axis.text.x = element_text(color="black", size=14),
        axis.text.y = element_text(color="black", size=16),
        axis.title.x = element_text(size=22),
        axis.title.y = element_text(size=22),
        strip.text.x = element_text(size=17.5))
plot5


## Combined plot.
combined_plot <- ggarrange(plot1, plot2, plot3, plot4, plot5,
                           labels = c("EC", "EF", "KP", "PA", "SA"),
                           ncol = 1, nrow = 5)
combined_plot
