library(tidyverse)
library(ggplot2)

## EC mixed datasets with different MAG percentage. Original datasets and simulation datasets (an average of 100 cut and 99% completeness) are used.
## The number of core gene families are calcultaed by using Roary with "-i 90 cd 100 -s -e -n -v".

EC_mixed <- read.table(file = "R_code/Fig3.three_tools_and_mixed_datasets/EC_mixed_datasets.txt", sep = "\t" , header = FALSE)

EC_mixed_plot <- ggplot(data=EC_mixed, aes(x = V1, y = V4))+
  geom_violin(aes(fill=V1))+
  geom_boxplot(width=0.1, fill="white")+
  theme(legend.position="none",
        axis.text.x = element_text(color="black", size=28),
        axis.text.y = element_text(color="black", size=28),
        axis.title.x = element_text(size=30),
        axis.title.y = element_text(size=30),)+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  scale_y_continuous(name = "The number of core gene families")+
  scale_x_discrete(name = "Groups")+
  geom_hline(yintercept=2608, linetype="dashed", color = "black", size=2)+
  geom_hline(yintercept=658, linetype="dashed", color = "red", size=2)
