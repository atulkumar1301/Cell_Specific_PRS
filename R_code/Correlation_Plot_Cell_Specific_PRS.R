library(data.table)
library(ggpubr)
library(ggplot2)
library(ggcorrplot)

##########
PRS_1 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Correlation_Cell_Specific_PRS/PRS_1.txt")
PRS_1_1 <- as.matrix(PRS_1 [,-1])
PRS_1_Mat <- cor(PRS_1_1)
PRS_1_p <- ggcorrplot(PRS_1_Mat, outline.col = "white", lab = TRUE) + ggtitle ("A) PRS 1")
PRS_1_p <- PRS_1_p + scale_x_discrete(labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_1_p <- PRS_1_p + scale_y_discrete(labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_1_p <- PRS_1_p + theme(
    plot.title = element_text(family = "serif", size=18, face = "bold"),
    #axis.title.x = element_text(family = "serif", size=16),
    #axis.title.y = element_text(family = "serif", size=16),
    axis.text.x = element_text(family = "serif", size=12),
    axis.text.y = element_text(family = "serif", size=12),
    legend.title = element_text(family = "serif", size=12),
    legend.text = element_text(family = "serif", size=12),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank())

##########
PRS_2 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Correlation_Cell_Specific_PRS/PRS_2.txt")
PRS_2_1 <- as.matrix(PRS_2 [,-1])
PRS_2_Mat <- cor(PRS_2_1)
PRS_2_p <- ggcorrplot(PRS_2_Mat, outline.col = "white", lab = TRUE) + ggtitle ("B) PRS 2")
PRS_2_p <- PRS_2_p + scale_x_discrete(labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_2_p <- PRS_2_p + scale_y_discrete(labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))

PRS_2_p <- PRS_2_p + theme(
  plot.title = element_text(family = "serif", size=18, face = "bold"),
  #axis.title.x = element_text(family = "serif", size=16),
  #axis.title.y = element_text(family = "serif", size=16),
  axis.text.x = element_text(family = "serif", size=12),
  axis.text.y = element_text(family = "serif", size=12),
  legend.title = element_text(family = "serif", size=12),
  legend.text = element_text(family = "serif", size=12),
  panel.grid.major = element_blank(),
  panel.border = element_blank(),
  panel.background = element_blank(),
  axis.ticks = element_blank())

##########
PRS_3 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Correlation_Cell_Specific_PRS/PRS_3.txt")
PRS_3_1 <- as.matrix(PRS_3 [,-1])
PRS_3_Mat <- cor(PRS_3_1)
PRS_3_p <- ggcorrplot(PRS_3_Mat, outline.col = "white", lab = TRUE) + ggtitle ("C) PRS 3")
PRS_3_p <- PRS_3_p + scale_x_discrete(labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_3_p <- PRS_3_p + scale_y_discrete(labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_3_p <- PRS_3_p + theme(
  plot.title = element_text(family = "serif", size=18, face = "bold"),
  #axis.title.x = element_text(family = "serif", size=16),
  #axis.title.y = element_text(family = "serif", size=16),
  axis.text.x = element_text(family = "serif", size=12),
  axis.text.y = element_text(family = "serif", size=12),
  legend.title = element_text(family = "serif", size=12),
  legend.text = element_text(family = "serif", size=12),
  panel.grid.major = element_blank(),
  panel.border = element_blank(),
  panel.background = element_blank(),
  axis.ticks = element_blank())


##########
PRS_4 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Correlation_Cell_Specific_PRS/PRS_4.txt")
PRS_4_1 <- as.matrix(PRS_4 [,-1])
PRS_4_Mat <- cor(PRS_4_1)
PRS_4_p <- ggcorrplot(PRS_4_Mat, outline.col = "white", lab = TRUE) + ggtitle ("D) PRS 4")
PRS_4_p <- PRS_4_p + scale_x_discrete(labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_4_p <- PRS_4_p + scale_y_discrete(labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_4_p <- PRS_4_p + theme(
  plot.title = element_text(family = "serif", size=18, face = "bold"),
  #axis.title.x = element_text(family = "serif", size=16),
  #axis.title.y = element_text(family = "serif", size=16),
  axis.text.x = element_text(family = "serif", size=12),
  axis.text.y = element_text(family = "serif", size=12),
  legend.title = element_text(family = "serif", size=12),
  legend.text = element_text(family = "serif", size=12),
  panel.grid.major = element_blank(),
  panel.border = element_blank(),
  panel.background = element_blank(),
  axis.ticks = element_blank())


##########
PRS_5 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Correlation_Cell_Specific_PRS/PRS_5.txt")
PRS_5_1 <- as.matrix(PRS_5 [,-1])
PRS_5_Mat <- cor(PRS_5_1)
PRS_5_p <- ggcorrplot(PRS_5_Mat, outline.col = "white", lab = TRUE) + ggtitle ("E) PRS 5")
PRS_4_p <- PRS_4_p + scale_x_discrete(labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_4_p <- PRS_4_p + scale_y_discrete(labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_5_p <- PRS_5_p + theme(
  plot.title = element_text(family = "serif", size=18, face = "bold"),
  #axis.title.x = element_text(family = "serif", size=16),
  #axis.title.y = element_text(family = "serif", size=16),
  axis.text.x = element_text(family = "serif", size=12),
  axis.text.y = element_text(family = "serif", size=12),
  legend.title = element_text(family = "serif", size=12),
  legend.text = element_text(family = "serif", size=12),
  panel.grid.major = element_blank(),
  panel.border = element_blank(),
  panel.background = element_blank(),
  axis.ticks = element_blank())

##########
PRS_6 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Correlation_Cell_Specific_PRS/PRS_6.txt")
PRS_6_1 <- as.matrix(PRS_6 [,-1])
PRS_6_Mat <- cor(PRS_6_1)
PRS_6_p <- ggcorrplot(PRS_6_Mat, outline.col = "white", lab = TRUE) + ggtitle ("F) PRS 6")
PRS_6_p <- PRS_6_p + scale_x_discrete(labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_6_p <- PRS_6_p + scale_y_discrete(labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_6_p <- PRS_6_p + theme(
  plot.title = element_text(family = "serif", size=18, face = "bold"),
  #axis.title.x = element_text(family = "serif", size=16),
  #axis.title.y = element_text(family = "serif", size=16),
  axis.text.x = element_text(family = "serif", size=12),
  axis.text.y = element_text(family = "serif", size=12),
  legend.title = element_text(family = "serif", size=12),
  legend.text = element_text(family = "serif", size=12),
  panel.grid.major = element_blank(),
  panel.border = element_blank(),
  panel.background = element_blank(),
  axis.ticks = element_blank())

##########
PRS_7 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Correlation_Cell_Specific_PRS/PRS_7.txt")
PRS_7_1 <- as.matrix(PRS_7 [,-1])
PRS_7_Mat <- cor(PRS_7_1)
PRS_7_p <- ggcorrplot(PRS_7_Mat, outline.col = "white", lab = TRUE) + ggtitle ("G) PRS 7")
PRS_7_p <- PRS_7_p + scale_x_discrete(labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_7_p <- PRS_7_p + scale_y_discrete(labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_7_p <- PRS_7_p + theme(
  plot.title = element_text(family = "serif", size=18, face = "bold"),
  #axis.title.x = element_text(family = "serif", size=16),
  #axis.title.y = element_text(family = "serif", size=16),
  axis.text.x = element_text(family = "serif", size=12),
  axis.text.y = element_text(family = "serif", size=12),
  legend.title = element_text(family = "serif", size=12),
  legend.text = element_text(family = "serif", size=12),
  panel.grid.major = element_blank(),
  panel.border = element_blank(),
  panel.background = element_blank(),
  axis.ticks = element_blank())

ggarrange(PRS_1_p, PRS_2_p, PRS_3_p, PRS_4_p, ncol = 2, nrow = 2)

ggarrange(PRS_5_p, PRS_6_p, PRS_7_p, ncol = 2, nrow = 2)
