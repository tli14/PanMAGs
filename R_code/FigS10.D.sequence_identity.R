library(ggplot2) 

## Test different identity threshold

diff_data <- read.table(file = "R_code/Supplementary_fig_data/FigS10.D.E_coli_comp_diff_i_cd90.txt",  sep = '\t', header = TRUE)

SI_plot <- ggplot(data=diff_data,aes(x=Incomp, y=genes,group=factor(Group)))+
  geom_line(stat="identity", aes(color=factor(Group)), size=1)+
  geom_point()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        legend.position="bottom",
        legend.title = element_text(size=28, face = "bold"),
        legend.text = element_text(size=26, face = "bold"),
        axis.text.x = element_text(color="black", size=26, face = "bold"),
        axis.text.y = element_text(color="black", size=26, face = "bold"),
        axis.title.x = element_text(size=28, face = "bold"),
        axis.title.y = element_text(size=28, face = "bold"))+
  scale_x_continuous(name="The average incompleteness (%)")+
  scale_y_continuous(name="Number of core gene families", limits = c(0, 3500))+
  scale_color_discrete(name = "The minimum sequence identity (SI) percentage for clustering (%)")
