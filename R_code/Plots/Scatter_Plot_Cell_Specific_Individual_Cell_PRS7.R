#Scatter Plot
library(data.table)
library (ggplot2)
library(ggpubr)
library(ggrepel)
cbbPalette <- c("#D55E00", "#009E73", "#F0E442", "#0072B2", "#999999", "#CC79A7")
df <- fread ("Plot_PRS7.txt")
df_1 <- df [df$Cell_Type == "Astrocytes"]
p1 <- ggplot (df_1, aes (x = X_Coordinate, y = NEW_BETA, label = GENE)) +
  geom_point() + geom_text_repel(max.overlaps = Inf, show.legend  = F) + 
  xlab("Genomic coordinate") +
  ylab("Cell specific Variant's Beta coefficient") +
  ggtitle ("a) Astrocytes")
p1 <- p1 + theme_bw() + scale_color_manual(values=cbbPalette)
p1 <- p1 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p1 <- p1 + scale_y_continuous (breaks=seq(-4, 4, 1))
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

df_2 <- df [df$Cell_Type == "Excitatory Neurons"]
p2 <- ggplot (df_2, aes (x = X_Coordinate, y = NEW_BETA, label = GENE)) +
  geom_point() + geom_text_repel(max.overlaps = Inf, show.legend  = F) +
  xlab("Genomic coordinate") +
  ylab("Cell specific Variant's Beta coefficient") +
  ggtitle ("b) Excitatory neurons")
p2 <- p2 + theme_bw()
p2 <- p2 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p2 <- p2 + scale_y_continuous (breaks=seq(-6, 9, 1))
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

df_3 <- df [df$Cell_Type == "Inhibitory Neurons"]
p3 <- ggplot (df_3, aes (x = X_Coordinate, y = NEW_BETA, label = GENE)) +
  geom_point() + geom_text_repel(max.overlaps = Inf, show.legend  = F) +
  xlab("Genomic coordinate") +
  ylab("Cell specific Variant's Beta coefficient") +
  ggtitle ("c) Inhibitory neurons")
p3 <- p3 + theme_bw()
p3 <- p3 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p3 <- p3 + scale_y_continuous (breaks=seq(-7, 4, 1))
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

df_4 <- df [df$Cell_Type == "Microglial Cells"]
p4 <- ggplot (df_4, aes (x = X_Coordinate, y = NEW_BETA, label = GENE)) +
  geom_point() + geom_text_repel(max.overlaps = Inf, show.legend  = F) +
  xlab("Genomic coordinate") +
  ylab("Cell specific Variant's Beta coefficient") +
  ggtitle ("d) Microglial cells")
p4 <- p4 + theme_bw()
p4 <- p4 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p4 <- p4 + scale_y_continuous (breaks=seq(-8, 9, 1))
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

df_5 <- df [df$Cell_Type == "Oligodendrocyte Precursor Cells"]
p5 <- ggplot (df_5, aes (x = X_Coordinate, y = NEW_BETA, label = GENE)) +
  geom_point() + geom_text_repel(max.overlaps = Inf, show.legend  = F) +
  xlab("Genomic coordinate") +
  ylab("Cell specific Variant's Beta coefficient") +
  ggtitle ("e) Oligodendrocyte precursor cells")
p5 <- p5 + theme_bw()
p5 <- p5 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p5 <- p5 + scale_y_continuous (breaks=seq(-4, 3, 1))
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

df_6 <- df [df$Cell_Type == "Oligodendrocytes"]
p6 <- ggplot (df_6, aes (x = X_Coordinate, y = NEW_BETA, label = GENE)) +
  geom_point() + geom_text_repel(max.overlaps = Inf, show.legend  = F) +
  xlab("Genomic coordinate") +
  ylab("Cell specific Variant's Beta coefficient") +
  ggtitle ("f) Oligodendrocytes")
p6 <- p6 + theme_bw()
p6 <- p6 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p6 <- p6 + scale_y_continuous (breaks=seq(-5, 4, 1))
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

ggarrange(p1, p2, p3, p4, ncol = 2, nrow = 2)
ggarrange(p5, p6, ncol = 2, nrow = 2)
