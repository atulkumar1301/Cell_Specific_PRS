#Scatter Plot
library(data.table)
library (ggplot2)
library(ggpubr)
cbbPalette <- c("#D55E00", "#009E73", "#F0E442", "#0072B2", "#999999", "#CC79A7")
df_1 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Figure_1/Astrocytes.txt")
p1 <- ggplot (df_1, aes (x = X_Coordinate, y = NEW_BETA, label = Name)) +
  geom_point() + geom_text_repel(max.overlaps = Inf, show.legend  = F) + 
  xlab("Genomic coordinate") +
  ylab("Cell specific Variant's Beta coefficient") +
  ggtitle ("A) Astrocytes")
p1 <- p1 + theme_bw() + scale_color_manual(values=cbbPalette)
p1 <- p1 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p1 <- p1 + scale_y_continuous (breaks=seq(-20, 20, 2))
p1 <- p1 + theme (
  plot.title = element_text(family = "serif", size=16, face = "bold"),
  axis.title.x = element_text(family = "serif", size=14),
  axis.title.y = element_text(family = "serif", size=14),
  axis.text.x = element_text(family = "serif", size=12, angle = 90),
  axis.text.y = element_text(family = "serif", size=12),
  legend.title = element_text(family = "serif", size=14),
  legend.text = element_text(family = "serif", size=14),
  axis.ticks = element_blank())
p1 <- p1 + theme(legend.position = "bottom")

#######

df_2 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Figure_1/Excitatory_neurons.txt")
p2 <- ggplot (df_2, aes (x = X_Coordinate, y = NEW_BETA, label = Name)) +
  geom_point() + geom_text_repel(max.overlaps = Inf, show.legend  = F) +
  xlab("Genomic coordinate") +
  ylab("Cell specific Variant's Beta coefficient") +
  ggtitle ("B) Excitatory neurons")
p2 <- p2 + theme_bw()
p2 <- p2 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p2 <- p2 + scale_y_continuous (breaks=seq(-70, 70, 10))
p2 <- p2 + theme (
  plot.title = element_text(family = "serif", size=16, face = "bold"),
  axis.title.x = element_text(family = "serif", size=14),
  axis.title.y = element_text(family = "serif", size=14),
  axis.text.x = element_text(family = "serif", size=12, angle = 90),
  axis.text.y = element_text(family = "serif", size=12),
  legend.title = element_text(family = "serif", size=14),
  legend.text = element_text(family = "serif", size=14),
  axis.ticks = element_blank())
p2 <- p2 + theme(legend.position = "bottom")

#######

df_3 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Figure_1/Inhibitory_neurons.txt")
p3 <- ggplot (df_3, aes (x = X_Coordinate, y = NEW_BETA, label = Name)) +
  geom_point() + geom_text_repel(max.overlaps = Inf, show.legend  = F) +
  xlab("Genomic coordinate") +
  ylab("Cell specific Variant's Beta coefficient") +
  ggtitle ("C) Inhibitory neurons")
p3 <- p3 + theme_bw()
p3 <- p3 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p3 <- p3 + scale_y_continuous (breaks=seq(-40, 30, 5))
p3 <- p3 + theme (
  plot.title = element_text(family = "serif", size=16, face = "bold"),
  axis.title.x = element_text(family = "serif", size=14),
  axis.title.y = element_text(family = "serif", size=14),
  axis.text.x = element_text(family = "serif", size=12, angle = 90),
  axis.text.y = element_text(family = "serif", size=12),
  legend.title = element_text(family = "serif", size=14),
  legend.text = element_text(family = "serif", size=14),
  axis.ticks = element_blank())
p3 <- p3 + theme(legend.position = "bottom")

########

df_4 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Figure_1/Microglial_cells.txt")
p4 <- ggplot (df_4, aes (x = X_Coordinate, y = NEW_BETA, label = Name)) +
  geom_point() + geom_text_repel(max.overlaps = Inf, show.legend  = F) +
  xlab("Genomic coordinate") +
  ylab("Cell specific Variant's Beta coefficient") +
  ggtitle ("D) Microglial cells")
p4 <- p4 + theme_bw()
p4 <- p4 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p4 <- p4 + scale_y_continuous (breaks=seq(-40, 30, 5))
p4 <- p4 + theme (
  plot.title = element_text(family = "serif", size=16, face = "bold"),
  axis.title.x = element_text(family = "serif", size=14),
  axis.title.y = element_text(family = "serif", size=14),
  axis.text.x = element_text(family = "serif", size=12, angle = 90),
  axis.text.y = element_text(family = "serif", size=12),
  legend.title = element_text(family = "serif", size=14),
  legend.text = element_text(family = "serif", size=14),
  axis.ticks = element_blank())
p4 <- p4 + theme(legend.position = "bottom")

########

df_5 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Figure_1/Oligodendrocyte_precursor_cells.txt")
p5 <- ggplot (df_5, aes (x = X_Coordinate, y = NEW_BETA, label = Name)) +
  geom_point() + geom_text_repel(max.overlaps = Inf, show.legend  = F) +
  xlab("Genomic coordinate") +
  ylab("Cell specific Variant's Beta coefficient") +
  ggtitle ("E) Oligodendrocyte precursor cells")
p5 <- p5 + theme_bw()
p5 <- p5 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p5 <- p5 + scale_y_continuous (breaks=seq(-20, 30, 4))
p5 <- p5 + theme (
  plot.title = element_text(family = "serif", size=16, face = "bold"),
  axis.title.x = element_text(family = "serif", size=14),
  axis.title.y = element_text(family = "serif", size=14),
  axis.text.x = element_text(family = "serif", size=12, angle = 90),
  axis.text.y = element_text(family = "serif", size=12),
  legend.title = element_text(family = "serif", size=14),
  legend.text = element_text(family = "serif", size=14),
  axis.ticks = element_blank())
p5 <- p5 + theme(legend.position = "bottom")

########

df_6 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Figure_1/Oligodendrocytes.txt")
p6 <- ggplot (df_6, aes (x = X_Coordinate, y = NEW_BETA, label = Name)) +
  geom_point() + geom_text_repel(max.overlaps = Inf, show.legend  = F) +
  xlab("Genomic coordinate") +
  ylab("Cell specific Variant's Beta coefficient") +
  ggtitle ("F) Oligodendrocytes")
p6 <- p6 + theme_bw()
p6 <- p6 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p6 <- p6 + scale_y_continuous (breaks=seq(-50, 70, 10))
p6 <- p6 + theme (
  plot.title = element_text(family = "serif", size=16, face = "bold"),
  axis.title.x = element_text(family = "serif", size=14),
  axis.title.y = element_text(family = "serif", size=14),
  axis.text.x = element_text(family = "serif", size=12, angle = 90),
  axis.text.y = element_text(family = "serif", size=12),
  legend.title = element_text(family = "serif", size=14),
  legend.text = element_text(family = "serif", size=14),
  axis.ticks = element_blank())
p6 <- p6 + theme(legend.position = "bottom")

ggarrange(p1, p2, p3, p4, p5, p6, ncol = 3, nrow = 2)
