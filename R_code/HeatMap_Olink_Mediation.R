library (ggplot2)
library (reshape2)
library(data.table)
library(ggpubr)
#Including APOE Region Abeta
df <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cell_Type_Heat_Map/Ab_Olink_APOE_HeatMap.txt")
melted_df <- melt (df)
ggheatmap <- ggplot (data = melted_df, aes (x = Cell_Types, y = variable, fill = value)) + 
  geom_tile (color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", midpoint = 0.1, limit = c(-0.003,0.300), space = "Lab", name="Mediation Percentage")+
  xlab("Cell Types") +
  ylab("PRS Models") +
  ggtitle (expression("A) Including APOE region variant: A" *beta* " Status"))
ggheatmap <- ggheatmap + 
  geom_text(aes(Cell_Types, variable, label = value), color = "black", size = 6, family = "serif") +
  theme(
    plot.title = element_text(family = "serif", size=18, face = "bold"),
    axis.title.x = element_text(family = "serif", size=16),
    axis.title.y = element_text(family = "serif", size=16),
    axis.text.x = element_text(family = "serif", size=14, angle = 10),
    axis.text.y = element_text(family = "serif", size=14),
    legend.title = element_text(family = "serif", size=16),
    legend.text = element_text(family = "serif", size=16),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank())

##Excluding APOE Region Abeta
df_1 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cell_Type_Heat_Map/Ab_Olink_Non_APOE_HeatMap.txt")
melted_df_1 <- melt (df_1)
ggheatmap1 <- ggplot (data = melted_df_1, aes (x = Cell_Types, y = variable, fill = value)) + 
  geom_tile (color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", midpoint = 0.14, limit = c(-0.020,0.4), space = "Lab", name="Mediation Percentage")+
  xlab("Cell Types") +
  ylab("PRS Models") +
  ggtitle (expression("B) Excluding APOE region variant: A" *beta* " Status"))
ggheatmap1 <- ggheatmap1 + 
  geom_text(aes(Cell_Types, variable, label = value), color = "black", size = 6, family = "serif") +
  theme(
    plot.title = element_text(family = "serif", size=18, face = "bold"),
    axis.title.x = element_text(family = "serif", size=16),
    axis.title.y = element_text(family = "serif", size=16),
    axis.text.x = element_text(family = "serif", size=14, angle = 10),
    axis.text.y = element_text(family = "serif", size=14),
    legend.title = element_text(family = "serif", size=16),
    legend.text = element_text(family = "serif", size=16),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank())

#Including APOE Region CSF pTau217
df_2 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cell_Type_Heat_Map/pTau_217_Olink_APOE_HeatMap.txt")
melted_df_2 <- melt (df_2)
ggheatmap2 <- ggplot (data = melted_df_2, aes (x = Cell_Types, y = variable, fill = value)) + 
  geom_tile (color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", midpoint = 0.15, limit = c(-0.003,0.23), space = "Lab", name="Mediation Percentage")+
  xlab("Cell Types") +
  ylab("PRS Models") +
  ggtitle (expression("C) Including APOE region variant: CSF pTau217"))
ggheatmap2 <- ggheatmap2 + 
  geom_text(aes(Cell_Types, variable, label = value), color = "black", size = 6, family = "serif") +
  theme(
    plot.title = element_text(family = "serif", size=18, face = "bold"),
    axis.title.x = element_text(family = "serif", size=16),
    axis.title.y = element_text(family = "serif", size=16),
    axis.text.x = element_text(family = "serif", size=14, angle = 10),
    axis.text.y = element_text(family = "serif", size=14),
    legend.title = element_text(family = "serif", size=16),
    legend.text = element_text(family = "serif", size=16),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank())

##Excluding APOE Region CSF pTau217
df_3 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cell_Type_Heat_Map/pTau_217_Olink_Non_APOE_HeatMap.txt")
melted_df_3 <- melt (df_3)
ggheatmap3 <- ggplot (data = melted_df_3, aes (x = Cell_Types, y = variable, fill = value)) + 
  geom_tile (color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", midpoint = 0.17, limit = c(-0.020,0.24), space = "Lab", name="Mediation Percentage")+
  xlab("Cell Types") +
  ylab("PRS Models") +
  ggtitle (expression("D) Excluding APOE region variant: CSF pTau217"))
ggheatmap3 <- ggheatmap3 + 
  geom_text(aes(Cell_Types, variable, label = value), color = "black", size = 6, family = "serif") +
  theme(
    plot.title = element_text(family = "serif", size=18, face = "bold"),
    axis.title.x = element_text(family = "serif", size=16),
    axis.title.y = element_text(family = "serif", size=16),
    axis.text.x = element_text(family = "serif", size=14, angle = 10),
    axis.text.y = element_text(family = "serif", size=14),
    legend.title = element_text(family = "serif", size=16),
    legend.text = element_text(family = "serif", size=16),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank())

ggarrange(ggheatmap, ggheatmap1, ggheatmap2, ggheatmap3, ncol = 2, nrow = 2)
