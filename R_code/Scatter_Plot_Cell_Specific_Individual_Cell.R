#Scatter Plot
library(data.table)
library (ggplot2)
library(ggpubr)
df_1 <- fread ("Astrocytes.txt")
p1 <- ggplot (df_1, aes (x = X_Coordinate, y = Y_Coordinate, color = Sign)) +
  geom_point(size = 2.5) +
  xlab("Genomic coordinate") +
  ylab("Square of Beta coefficient") +
  ggtitle ("A) Astrocytes")
p1 <- p1 + theme_bw()
p1 <- p1 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                            "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                            "Chr 21", "Chr 22"))
p1 <- p1 + theme (
    plot.title = element_text(family = "serif", size=18, face = "bold"),
    axis.title.x = element_text(family = "serif", size=16),
    axis.title.y = element_text(family = "serif", size=16),
    axis.text.x = element_text(family = "serif", size=14, angle = 25),
    axis.text.y = element_text(family = "serif", size=14),
    legend.title = element_text(family = "serif", size=16),
    legend.text = element_text(family = "serif", size=16),
    axis.ticks = element_blank())
p1 <- p1 + theme(legend.position = "bottom")

#######

df_2 <- fread ("Excitatory_neurons.txt")
p2 <- ggplot (df_2, aes (x = X_Coordinate, y = Y_Coordinate, color = Sign)) +
  geom_point(size = 2.5) +
  xlab("Genomic coordinate") +
  ylab("Square of Beta coefficient") +
  ggtitle ("B) Excitatory neurons")
p2 <- p2 + theme_bw()
p2 <- p2 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p2 <- p2 + theme (
  plot.title = element_text(family = "serif", size=18, face = "bold"),
  axis.title.x = element_text(family = "serif", size=16),
  axis.title.y = element_text(family = "serif", size=16),
  axis.text.x = element_text(family = "serif", size=14, angle = 25),
  axis.text.y = element_text(family = "serif", size=14),
  legend.title = element_text(family = "serif", size=16),
  legend.text = element_text(family = "serif", size=16),
  axis.ticks = element_blank())
p2 <- p2 + theme(legend.position = "bottom")

#######

df_3 <- fread ("Inhibitory_neurons.txt")
p3 <- ggplot (df_3, aes (x = X_Coordinate, y = Y_Coordinate, color = Sign)) +
  geom_point(size = 2.5) +
  xlab("Genomic coordinate") +
  ylab("Square of Beta coefficient") +
  ggtitle ("C) Inhibitory neurons")
p3 <- p3 + theme_bw()
p3 <- p3 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p3 <- p3 + theme (
  plot.title = element_text(family = "serif", size=18, face = "bold"),
  axis.title.x = element_text(family = "serif", size=16),
  axis.title.y = element_text(family = "serif", size=16),
  axis.text.x = element_text(family = "serif", size=14, angle = 25),
  axis.text.y = element_text(family = "serif", size=14),
  legend.title = element_text(family = "serif", size=16),
  legend.text = element_text(family = "serif", size=16),
  axis.ticks = element_blank())
p3 <- p3 + theme(legend.position = "bottom")

########

df_4 <- fread ("Microglial_cells.txt")
p4 <- ggplot (df_4, aes (x = X_Coordinate, y = Y_Coordinate, color = Sign)) +
  geom_point(size = 2.5) +
  xlab("Genomic coordinate") +
  ylab("Square of Beta coefficient") +
  ggtitle ("D) Microglial cells")
p4 <- p4 + theme_bw()
p4 <- p4 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p4 <- p4 + theme (
  plot.title = element_text(family = "serif", size=18, face = "bold"),
  axis.title.x = element_text(family = "serif", size=16),
  axis.title.y = element_text(family = "serif", size=16),
  axis.text.x = element_text(family = "serif", size=14, angle = 25),
  axis.text.y = element_text(family = "serif", size=14),
  legend.title = element_text(family = "serif", size=16),
  legend.text = element_text(family = "serif", size=16),
  axis.ticks = element_blank())
p4 <- p4 + theme(legend.position = "bottom")

########

df_5 <- fread ("Oligodendrocyte_precursor_cells.txt")
p5 <- ggplot (df_5, aes (x = X_Coordinate, y = Y_Coordinate, color = Sign)) +
  geom_point(size = 2.5) +
  xlab("Genomic coordinate") +
  ylab("Square of Beta coefficient") +
  ggtitle ("E) Oligodendrocyte precursor cells")
p5 <- p5 + theme_bw()
p5 <- p5 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p5 <- p5 + theme (
  plot.title = element_text(family = "serif", size=18, face = "bold"),
  axis.title.x = element_text(family = "serif", size=16),
  axis.title.y = element_text(family = "serif", size=16),
  axis.text.x = element_text(family = "serif", size=14, angle = 25),
  axis.text.y = element_text(family = "serif", size=14),
  legend.title = element_text(family = "serif", size=16),
  legend.text = element_text(family = "serif", size=16),
  axis.ticks = element_blank())
p5 <- p5 + theme(legend.position = "bottom")

########

df_6 <- fread ("Oligodendrocytes.txt")
p6 <- ggplot (df_6, aes (x = X_Coordinate, y = Y_Coordinate, color = Sign)) +
  geom_point(size = 2.5) +
  xlab("Genomic coordinate") +
  ylab("Square of Beta coefficient") +
  ggtitle ("F) Oligodendrocytes")
p6 <- p6 + theme_bw()
p6 <- p6 + scale_x_continuous (breaks=seq(1, 22, 1), labels=c("Chr 1", "Chr 2", "Chr 3", "Chr 4", "Chr 5", "Chr 6", "Chr 7", "Chr 8", "Chr 9", "Chr 10",
                                                              "Chr 11", "Chr 12", "Chr 13", "Chr 14", "Chr 15", "Chr 16", "Chr 17", "Chr 18", "Chr 19", "Chr 20",
                                                              "Chr 21", "Chr 22"))
p6 <- p6 + theme (
  plot.title = element_text(family = "serif", size=18, face = "bold"),
  axis.title.x = element_text(family = "serif", size=16),
  axis.title.y = element_text(family = "serif", size=16),
  axis.text.x = element_text(family = "serif", size=14, angle = 25),
  axis.text.y = element_text(family = "serif", size=14),
  legend.title = element_text(family = "serif", size=16),
  legend.text = element_text(family = "serif", size=16),
  axis.ticks = element_blank())
p6 <- p6 + theme(legend.position = "bottom")

ggarrange(p5, p6, ncol = 1, nrow = 2)
