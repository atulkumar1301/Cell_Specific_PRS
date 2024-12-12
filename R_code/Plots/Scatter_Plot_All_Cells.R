##Plotting all the cell types on scatter plot
library(data.table)
library (ggplot2)
library(ggpubr)
library(ggrepel)
cbbPalette <- c("#999999", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
df_1 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Manuscript/Plot_Data/Full_Data_Scatter_Plot_SD.txt")
p1 <- ggplot (df_1, aes (x = X_Coordinate, y = NEW_BETA, color = Cell_Type, label = GENE)) +
  geom_point(size = 2.5, alpha = 0.6) + geom_text_repel(max.overlaps = Inf, show.legend  = F) +
  xlab("Genomic coordinate") +
  ylab("Variant's Beta coefficient Multiplied with gene's cell specifict score")
p1 <- p1 + theme_bw() + scale_color_manual(values=cbbPalette)
p1 <- p1 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p1 <- p1 + scale_y_continuous (breaks=seq(-64, 67, 4))
p1 <- p1 + theme (
  plot.title = element_text(family = "serif", size=18, face = "bold"),
  axis.title.x = element_text(family = "serif", size=14),
  axis.title.y = element_text(family = "serif", size=14),
  axis.text.x = element_text(family = "serif", size=12, angle = 20),
  axis.text.y = element_text(family = "serif", size=12),
  legend.title = element_text(family = "serif", size=14),
  legend.text = element_text(family = "serif", size=14),
  axis.ticks = element_blank())
p1 <- p1 + theme(legend.position = "bottom")
p1
