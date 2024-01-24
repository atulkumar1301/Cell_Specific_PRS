library(data.table)
library(ggpubr)
library(ggplot2)
library(ggcorrplot)
library(corrr)
library(dplyr)
##########
PRS_Astrocytic <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Correlation_Cell_Specific_Olink/Astrocytic_PRS.txt")
PRS_Astrocytic_1 <- as.matrix(PRS_Astrocytic)
PRS_Astrocytic_Mat <- correlate (PRS_Astrocytic_1) %>% focus (PRS_1:PRS_7)
PRS_Astrocytic_Mat <- PRS_Astrocytic_Mat [,-1]
PRS_Astrocytic_p <- ggcorrplot(PRS_Astrocytic_Mat, outline.col = "white", lab = TRUE) + ggtitle ("A) Astrocytic PRSs")
PRS_Astrocytic_p <- PRS_Astrocytic_p + scale_x_continuous(breaks = round(seq(1, 6, by = 1),1), labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_Astrocytic_p <- PRS_Astrocytic_p + scale_y_discrete(labels = c ("PRS 1", "PRS 2", "PRS 3", "PRS 4", "PRS 5", "PRS 6", "PRS 7"))
PRS_Astrocytic_p <- PRS_Astrocytic_p + theme(
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
PRS_Excitatory_Neuron <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Correlation_Cell_Specific_Olink/Excitatory_Neuron_PRS.txt")
PRS_Excitatory_Neuron_1 <- as.matrix(PRS_Excitatory_Neuron)
PRS_Excitatory_Neuron_Mat <- correlate (PRS_Excitatory_Neuron_1) %>% focus (PRS_1:PRS_7)
PRS_Excitatory_Neuron_Mat <- PRS_Excitatory_Neuron_Mat [,-1]
PRS_Excitatory_Neuron_p <- ggcorrplot(PRS_Excitatory_Neuron_Mat, outline.col = "white", lab = TRUE) + ggtitle ("B) Excitatory Neuron PRSs")
PRS_Excitatory_Neuron_p <- PRS_Excitatory_Neuron_p + scale_x_continuous(breaks = round(seq(1, 6, by = 1),1), labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_Excitatory_Neuron_p <- PRS_Excitatory_Neuron_p + scale_y_discrete(labels = c ("PRS 1", "PRS 2", "PRS 3", "PRS 4", "PRS 5", "PRS 6", "PRS 7"))
PRS_Excitatory_Neuron_p <- PRS_Excitatory_Neuron_p + theme(
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
PRS_Inhibitory_Neuron <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Correlation_Cell_Specific_Olink/Inhibitory_Neuron_PRS.txt")
PRS_Inhibitory_Neuron_1 <- as.matrix(PRS_Inhibitory_Neuron)
PRS_Inhibitory_Neuron_Mat <- correlate (PRS_Inhibitory_Neuron_1) %>% focus (PRS_1:PRS_7)
PRS_Inhibitory_Neuron_Mat <- PRS_Inhibitory_Neuron_Mat [,-1]
PRS_Inhibitory_Neuron_p <- ggcorrplot(PRS_Inhibitory_Neuron_Mat, outline.col = "white", lab = TRUE) + ggtitle ("C) Inhibitory Neuron PRSs")
PRS_Inhibitory_Neuron_p <- PRS_Inhibitory_Neuron_p + scale_x_continuous(breaks = round(seq(1, 6, by = 1),1), labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_Inhibitory_Neuron_p <- PRS_Inhibitory_Neuron_p + scale_y_discrete(labels = c ("PRS 1", "PRS 2", "PRS 3", "PRS 4", "PRS 5", "PRS 6", "PRS 7"))
PRS_Inhibitory_Neuron_p <- PRS_Inhibitory_Neuron_p + theme(
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
PRS_Microglial <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Correlation_Cell_Specific_Olink/Microglial_PRS.txt")
PRS_Microglial_1 <- as.matrix(PRS_Microglial)
PRS_Microglial_Mat <- correlate (PRS_Microglial_1) %>% focus (PRS_1:PRS_7)
PRS_Microglial_Mat <- PRS_Microglial_Mat [,-1]
PRS_Microglial_p <- ggcorrplot(PRS_Microglial_Mat, outline.col = "white", lab = TRUE) + ggtitle ("D) Microglial PRSs")
PRS_Microglial_p <- PRS_Microglial_p + scale_x_continuous(breaks = round(seq(1, 6, by = 1),1), labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_Microglial_p <- PRS_Microglial_p + scale_y_discrete(labels = c ("PRS 1", "PRS 2", "PRS 3", "PRS 4", "PRS 5", "PRS 6", "PRS 7"))
PRS_Microglial_p <- PRS_Microglial_p + theme(
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
PRS_OPC <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Correlation_Cell_Specific_Olink/OPC_PRS.txt")
PRS_OPC_1 <- as.matrix(PRS_OPC)
PRS_OPC_Mat <- correlate (PRS_OPC_1) %>% focus (PRS_1:PRS_7)
PRS_OPC_Mat <- PRS_OPC_Mat [,-1]
PRS_OPC_p <- ggcorrplot(PRS_OPC_Mat, outline.col = "white", lab = TRUE) + ggtitle ("E) Oligodendrocyte Precursor Cell PRSs")
PRS_OPC_p <- PRS_OPC_p + scale_x_continuous(breaks = round(seq(1, 6, by = 1),1), labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_OPC_p <- PRS_OPC_p + scale_y_discrete(labels = c ("PRS 1", "PRS 2", "PRS 3", "PRS 4", "PRS 5", "PRS 6", "PRS 7"))
PRS_OPC_p <- PRS_OPC_p + theme(
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
PRS_Oligodendrocytes <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Correlation_Cell_Specific_Olink/Oligodendrocyte_PRS.txt")
PRS_Oligodendrocytes_1 <- as.matrix(PRS_Oligodendrocytes)
PRS_Oligodendrocytes_Mat <- correlate (PRS_Oligodendrocytes_1) %>% focus (PRS_1:PRS_7)
PRS_Oligodendrocytes_Mat <- PRS_Oligodendrocytes_Mat [,-1]
PRS_Oligodendrocytes_p <- ggcorrplot(PRS_Oligodendrocytes_Mat, outline.col = "white", lab = TRUE) + ggtitle ("F) Oligodendrocyte")
PRS_Oligodendrocytes_p <- PRS_Oligodendrocytes_p + scale_x_continuous(breaks = round(seq(1, 6, by = 1),1), labels = c ("Astrocytes", "Excitatory Neurons", "Inhibitory Neurons", "Microglia", "Oligodendrocyte Precursor Cells", "Oligodendrocytes"))
PRS_Oligodendrocytes_p <- PRS_Oligodendrocytes_p + scale_y_discrete(labels = c ("PRS 1", "PRS 2", "PRS 3", "PRS 4", "PRS 5", "PRS 6", "PRS 7"))
PRS_Oligodendrocytes_p <- PRS_Oligodendrocytes_p + theme(
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


ggarrange(PRS_Astrocytic_p, PRS_Excitatory_Neuron_p, PRS_Inhibitory_Neuron_p, PRS_Microglial_p, PRS_OPC_p, PRS_Oligodendrocytes_p, ncol = 3, nrow = 2)
