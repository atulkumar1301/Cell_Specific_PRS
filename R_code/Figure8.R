library (ggplot2)
library (reshape2)
library(data.table)
library(ggpubr)
#PRS-1
df <- fread ("APOE_PRS_1.txt")
melted_df <- melt (df)
ggheatmap <- ggplot (data = melted_df, aes (x = Cell_Types, y = variable, fill = value)) + 
          geom_tile (color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", midpoint = 0.008, limit = c(-0.15,0.20), space = "Lab", name="Mediation Percentage")+
  xlab("Cell Types") +
  ylab("PRS Models") +
  ggtitle ("A) PRS-1")
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

##PRS-2
df_1 <- fread ("APOE_PRS_2.txt")
melted_df_1 <- melt (df_1)
ggheatmap1 <- ggplot (data = melted_df_1, aes (x = Cell_Types, y = variable, fill = value)) + 
  geom_tile (color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", midpoint = 0.13, limit = c(0.04,0.26), space = "Lab", name="Mediation Percentage")+
  xlab("Cell Types") +
  ylab("PRS Models") +
  ggtitle ("B) PRS-2")
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

#PRS-3
df_2 <- fread ("APOE_PRS_3.txt")
melted_df_2 <- melt (df_2)
ggheatmap2 <- ggplot (data = melted_df_2, aes (x = Cell_Types, y = variable, fill = value)) + 
  geom_tile (color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", midpoint = 0.13, limit = c(-0.003,0.27), space = "Lab", name="Mediation Percentage")+
  xlab("Cell Types") +
  ylab("PRS Models") +
  ggtitle ("C) PRS-3")
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

##PRS-4
df_3 <- fread ("APOE_PRS_4.txt")
melted_df_3 <- melt (df_3)
ggheatmap3 <- ggplot (data = melted_df_3, aes (x = Cell_Types, y = variable, fill = value)) + 
  geom_tile (color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", midpoint = 0.13, limit = c(0.02,0.26), space = "Lab", name="Mediation Percentage")+
  xlab("Cell Types") +
  ylab("PRS Models") +
  ggtitle ("D) PRS-4")
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


#PRS-5
df_4 <- fread ("APOE_PRS_5.txt")
melted_df_4 <- melt (df_4)
ggheatmap4 <- ggplot (data = melted_df_4, aes (x = Cell_Types, y = variable, fill = value)) + 
  geom_tile (color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", midpoint = 0.13, limit = c(0.03,0.25), space = "Lab", name="Mediation Percentage")+
  xlab("Cell Types") +
  ylab("PRS Models") +
  ggtitle ("E) PRS-5")
ggheatmap4 <- ggheatmap4 + 
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

##PRS-6
df_5 <- fread ("APOE_PRS_6.txt")
melted_df_5 <- melt (df_5)
ggheatmap5 <- ggplot (data = melted_df_5, aes (x = Cell_Types, y = variable, fill = value)) + 
  geom_tile (color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", midpoint = 0.15, limit = c(0.06,0.28), space = "Lab", name="Mediation Percentage")+
  xlab("Cell Types") +
  ylab("PRS Models") +
  ggtitle ("F) PRS-6")
ggheatmap5 <- ggheatmap5 + 
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

#PRS-7
df_6 <- fread ("APOE_PRS_7.txt")
melted_df_6 <- melt (df_6)
ggheatmap6 <- ggplot (data = melted_df_6, aes (x = Cell_Types, y = variable, fill = value)) + 
  geom_tile (color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", midpoint = 0.14, limit = c(0.05,0.30), space = "Lab", name="Mediation Percentage")+
  xlab("Cell Types") +
  ylab("PRS Models") +
  ggtitle ("G) PRS-7")
ggheatmap6 <- ggheatmap6 + 
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


ggarrange(ggheatmap4, ggheatmap5, ggheatmap6, ncol = 2, nrow = 2)
