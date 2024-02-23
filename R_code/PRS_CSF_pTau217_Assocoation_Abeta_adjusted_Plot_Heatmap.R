library(data.table)
library(ggplot2)
library(ggrepel)
library(ggpubr)
library (reshape2)
#### APOE region
cbbPalette <- c("#999999", "#F0E442", "#E69F00", "#009E73", "#CC79A7", "#0072B2", "#D55E00", "#56B4E9", "#000000")
df <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Manuscript/PRS_Plots/PRS_Plot_APOE_CSF_pTau217_Abeta_adjusted.txt")
p1 <- ggplot (data = df, aes (x = Model, y = -log10(P), col = Cell_Type, label = Effect)) + geom_path() +
  geom_point ()+ geom_text_repel(max.overlaps = Inf, show.legend  = F)
p1 <- p1 + theme_bw() + scale_color_manual(values=cbbPalette)
p1 <- p1 + scale_x_continuous (breaks=seq(1, 7, 1), labels=c("PRS 1", "PRS 2", "PRS 3", "PRS 4", "PRS 5", "PRS 6", "PRS 7"))
p1 <- p1 + scale_y_continuous (breaks=seq(0, 23, 1))
p1 <- p1 + geom_hline (aes(yintercept=-log10(0.05), linetype = "p-value 0.05", col="#F0E442")) +
  geom_hline (aes (yintercept=-log10(1.0E-03), linetype = "FDR p-value 0.05", col="#999999")) +
  scale_linetype_manual(name = "p-value cut off", values = c(2, 2), 
                        guide = guide_legend(override.aes = list(color = c("#999999", "#F0E442"))))
p1 <- p1 + xlab ("PRS Models") + labs (color = "Cell_Type") + ylab (expression (-log[10]~(P))) + labs(title=expression("A) Including APOE region variants"))
p1 <- p1 +
  theme(legend.position="right",
        plot.title = element_text(family = "serif", size=14, face = "bold", hjust = 0.5),
        axis.title.x = element_text(family = "serif", size=12),
        axis.title.y = element_text(family = "serif", size=12),
        axis.text.x = element_text(family = "serif", size=12),
        axis.text.y = element_text(family = "serif", size=12),
        legend.title = element_text(family = "serif", size=12),
        legend.text = element_text(family = "serif", size=12),
        panel.background = element_blank())

#### Non-APOE region
df_1 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Manuscript/PRS_Plots/PRS_Plot_Non_APOE_CSF_pTau217_Abeta_adjusted.txt")
p2 <- ggplot (data = df_1, aes (x = Model, y = -log10(P), col = Cell_Type, label = Effect)) + geom_path() +
  geom_point ()+ geom_text_repel(max.overlaps = Inf, show.legend  = F)
p2 <- p2 + theme_bw() + scale_color_manual(values=cbbPalette)
p2 <- p2 + scale_x_continuous (breaks=seq(1, 7, 1), labels=c("PRS 1", "PRS 2", "PRS 3", "PRS 4", "PRS 5", "PRS 6", "PRS 7"))
p2 <- p2 + scale_y_continuous (breaks=seq(0, 16, 1))
p2 <- p2 + geom_hline (aes(yintercept=-log10(0.05), linetype = "p-value 0.05", col="#F0E442")) +
  geom_hline (aes (yintercept=-log10(1.0E-03), linetype = "FDR p-value 0.05", col="#999999")) +
  scale_linetype_manual(name = "p-value cut off", values = c(2, 2), 
                        guide = guide_legend(override.aes = list(color = c("#999999", "#F0E442"))))
p2 <- p2 + xlab ("PRS Models") + labs (color = "Cell_Type") + ylab (expression (-log[10]~(P))) + labs(title=expression("B) Excluding APOE region variants"))
p2 <- p2 +
  theme(legend.position="right",
        plot.title = element_text(family = "serif", size=14, face = "bold", hjust = 0.5),
        axis.title.x = element_text(family = "serif", size=12),
        axis.title.y = element_text(family = "serif", size=12),
        axis.text.x = element_text(family = "serif", size=12),
        axis.text.y = element_text(family = "serif", size=12),
        legend.title = element_text(family = "serif", size=12),
        legend.text = element_text(family = "serif", size=12),
        panel.background = element_blank())

#Including APOE Region
df <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cell_Type_Heat_Map/pTau_217_Abeta_Adjusted_APOE.txt")
melted_df <- melt (df)
ggheatmap <- ggplot (data = melted_df, aes (x = Cell_Types, y = variable, fill = value)) + 
  geom_tile (color = "white") +
  scale_fill_gradient2(low = "#E69F00", high = "#009E73", midpoint = 0.41, limit = c(0.17,0.60), space = "Lab", name="Mediation Percentage")+
  xlab("Cell Types") +
  ylab("PRS Models") +
  ggtitle ("C) Including APOE region variants")
ggheatmap <- ggheatmap + 
  geom_text(aes(Cell_Types, variable, label = value), color = "black", size = 6, family = "serif") +
  theme(
    plot.title = element_text(family = "serif", size=14, face = "bold", hjust = 0.5),
    axis.title.x = element_text(family = "serif", size=12),
    axis.title.y = element_text(family = "serif", size=12),
    axis.text.x = element_text(family = "serif", size=12),
    axis.text.y = element_text(family = "serif", size=12),
    legend.title = element_text(family = "serif", size=12),
    legend.text = element_text(family = "serif", size=12),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank())

##Excluding APOE Region
df_1 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cell_Type_Heat_Map/pTau_217_Abeta_Adjusted_Non-APOE.txt")
melted_df_1 <- melt (df_1)
ggheatmap1 <- ggplot (data = melted_df_1, aes (x = Cell_Types, y = variable, fill = value)) + 
  geom_tile (color = "white") +
  scale_fill_gradient2(low = "#E69F00", high = "#009E73", midpoint = 0.32, limit = c(0.04,0.59), space = "Lab", name="Mediation Percentage")+
  xlab("Cell Types") +
  ylab("PRS Models") +
  ggtitle ("D) Excluding APOE region variants")
ggheatmap1 <- ggheatmap1 + 
  geom_text(aes(Cell_Types, variable, label = value), color = "black", size = 6, family = "serif") +
  theme(
    plot.title = element_text(family = "serif", size=14, face = "bold", hjust = 0.5),
    axis.title.x = element_text(family = "serif", size=12),
    axis.title.y = element_text(family = "serif", size=12),
    axis.text.x = element_text(family = "serif", size=12),
    axis.text.y = element_text(family = "serif", size=12),
    legend.title = element_text(family = "serif", size=12),
    legend.text = element_text(family = "serif", size=12),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank())

ggarrange(ggheatmap, ggheatmap1, ncol = 2, nrow = 1)
plot <- ggarrange (p1, p2, ggheatmap, ggheatmap1, ncol = 2, nrow = 2, common.legend = TRUE, legend = "bottom")

annotate_figure(plot, top = text_grob("Cell-Specific PRS association with CSF pTau217", color = "black", face = "bold", size = 16, family = "serif"))
