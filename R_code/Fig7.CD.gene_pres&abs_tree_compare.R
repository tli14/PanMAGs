library(ggplot2) # For data visualization

## Load phylogenetic comparison data of E. coli.
EC_group <- read.table(file = "R_code/Fig7.phylogenetic_tree/EC_10_groups_gene_pre_abs_ete.txt", sep = "\t" )
EC_group$V1 <- factor(EC_group$V1, levels=c("50cut", "99comp", "2.0cont"))

## The nRF values for 10 E. coli datasets. The y-axis range between 0 and 1.
EC_nRFs <- ggplot(data=EC_group,aes(x=V1, y=V2, group=V1, fill=V1))+
  geom_violin(trim=TRUE)+
  geom_boxplot(width=0.1, fill="white")+
  theme(legend.position="none",
        axis.text.x = element_text(color="black", size=28, face= "bold"),
        axis.text.y = element_text(color="black", size=28, face= "bold"),
        axis.title.x = element_text(size=30, face= "bold"),
        axis.title.y = element_text(size=30, face= "bold"))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  scale_x_discrete(name="Groups")+
  scale_y_continuous(name="The nRF values", limits = c(0, 1))

EC_nRFs
