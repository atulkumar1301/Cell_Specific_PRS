library (ggplot2)
library (reshape2)
library(data.table)
library(ggpubr)
#Including APOE Region
df <- fread ("pTau_217_Abeta_Adjusted_APOE.txt")
melted_df <- melt (df)
ggheatmap <- ggplot (data = melted_df, aes (x = Cell_Types, y = variable, fill = value)) + 
          geom_tile (color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", midpoint = 0.41, limit = c(0.17,0.60), space = "Lab", name="Mediation Percentage")+
  xlab("Cell Types") +
  ylab("PRS Models") +
  ggtitle ("A) Including APOE region variant")
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

##Excluding APOE Region
df_1 <- fread ("pTau_217_Abeta_Adjusted_Non-APOE.txt")
melted_df_1 <- melt (df_1)
ggheatmap1 <- ggplot (data = melted_df_1, aes (x = Cell_Types, y = variable, fill = value)) + 
  geom_tile (color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", midpoint = 0.32, limit = c(0.04,0.59), space = "Lab", name="Mediation Percentage")+
  xlab("Cell Types") +
  ylab("PRS Models") +
  ggtitle ("B) Excluding APOE region variant")
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

ggarrange(ggheatmap, ggheatmap1, ncol = 2, nrow = 1)
