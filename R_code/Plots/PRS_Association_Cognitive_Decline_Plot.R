#! /Library/Frameworks/R.framework/Versions/4.2/Resources/bin/Rscript
library(data.table)
library (ggplot2)
library(tidytext)
library(tidyverse)
library(ggrepel)
library(ggpubr)

cbbPalette <- c("#999999", "#F0E442", "#E69F00", "#009E73", "#CC79A7", "#0072B2", "#D55E00", "#56B4E9", "#000000")
cbbPalette1 <- c("#E69F00", "#009E73", "#CC79A7", "#0072B2", "#D55E00", "#56B4E9", "#000000")

#### APOE region
df <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Manuscript/PRS_Plots/PRS_Plot_APOE_MMSE.txt")

p1 <- ggplot (data = df, aes (x = Model, y = -log10(P), col = Cell_Type, label = Effect)) + geom_path() +
  geom_point ()+ geom_text_repel(max.overlaps = Inf, show.legend  = F)
p1 <- p1 + theme_bw() + scale_color_manual(values=cbbPalette)
p1 <- p1 + scale_x_continuous (breaks=seq(1, 7, 1), labels=c("PRS 1", "PRS 2", "PRS 3", "PRS 4", "PRS 5", "PRS 6", "PRS 7"))
p1 <- p1 + scale_y_continuous (breaks=seq(0, 10, 1))
p1 <- p1 + geom_hline (aes(yintercept=-log10(0.05), linetype = "p-value 0.05", col="#F0E442")) +
  geom_hline (aes (yintercept=-log10(1.0E-03), linetype = "Bonferroni p-value 0.05", col="#999999")) +
  scale_linetype_manual(name = "p-value cut off", values = c(2, 2), 
                        guide = guide_legend(override.aes = list(color = c("#999999", "#F0E442"))))
p1 <- p1 + xlab ("PRS Models") + labs (color = "Cell_Type") + ylab (expression (-log[10]~(P)))
p1 <- p1 +
  theme(legend.position="right",
        plot.title = element_text(family = "serif", size=14, face = "bold", hjust = 0.5),
        axis.title.x = element_text(family = "serif", size=12),
        axis.title.y = element_text(family = "serif", size=12),
        axis.text.x = element_text(family = "serif", size=12),
        axis.text.y = element_text(family = "serif", size=12),
        legend.title = element_text(family = "serif", size=12),
        legend.text = element_text(family = "serif", size=12),
        panel.background = element_blank()) + labs(title=expression("a) PRS Plot: Including APOE region variants"))

df <- df %>% 
  mutate(category = reorder_within(Cell_Type, AIC, within = Model))

p3 <- ggplot(data=df, aes(x=Model, y=AIC, fill = Cell_Type, group = category)) +
  geom_bar(stat="identity", position = position_dodge(0.9), width = 0.5) 

p3 <- p3 + theme_bw() + scale_fill_manual(values=cbbPalette1)

p3 <- p3 + coord_cartesian(ylim=c(7660,7705)) + scale_y_continuous(breaks = seq(7660,7705, by=5))

p3 <- p3 + scale_x_continuous (breaks=seq(1, 7, 1), labels=c("PRS 1", "PRS 2", "PRS 3", "PRS 4", "PRS 5", "PRS 6", "PRS 7"))

p3 <- p3 + xlab ("PRS Models") + labs (color = "Cell_Type") + ylab (expression ("AIC"))

p3 <- p3 +
  theme(legend.position="right",
        plot.title = element_text(family = "serif", size=14, face = "bold", hjust = 0.5),
        axis.title.x = element_text(family = "serif", size=12),
        axis.title.y = element_text(family = "serif", size=12),
        axis.text.x = element_text(family = "serif", size=12),
        axis.text.y = element_text(family = "serif", size=12),
        legend.title = element_text(family = "serif", size=12),
        legend.text = element_text(family = "serif", size=12),
        panel.background = element_blank()) + labs(title=expression("c) Bar Plot (AIC): Including APOE region variants"))

#### Non-APOE region
df_1 <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Manuscript/PRS_Plots/PRS_Plot_Non_APOE_MMSE.txt")

p2 <- ggplot (data = df_1, aes (x = Model, y = -log10(P), col = Cell_Type, label = Effect)) + geom_path() +
  geom_point ()+ geom_text_repel(max.overlaps = Inf, show.legend  = F)
p2 <- p2 + theme_bw() + scale_color_manual(values=cbbPalette)
p2 <- p2 + scale_x_continuous (breaks=seq(1, 7, 1), labels=c("PRS 1", "PRS 2", "PRS 3", "PRS 4", "PRS 5", "PRS 6", "PRS 7"))
p2 <- p2 + scale_y_continuous (breaks=seq(0, 8, 1))
p2 <- p2 + geom_hline (aes(yintercept=-log10(0.05), linetype = "p-value 0.05", col="#F0E442")) +
  geom_hline (aes (yintercept=-log10(1.0E-03), linetype = "Bonferroni p-value 0.05", col="#999999")) +
  scale_linetype_manual(name = "p-value cut off", values = c(2, 2), 
                        guide = guide_legend(override.aes = list(color = c("#999999", "#F0E442"))))
p2 <- p2 + xlab ("PRS Models") + labs (color = "Cell_Type") + ylab (expression (-log[10]~(P)))
p2 <- p2 +
  theme(legend.position="right",
        plot.title = element_text(family = "serif", size=14, face = "bold", hjust = 0.5),
        axis.title.x = element_text(family = "serif", size=12),
        axis.title.y = element_text(family = "serif", size=12),
        axis.text.x = element_text(family = "serif", size=12),
        axis.text.y = element_text(family = "serif", size=12),
        legend.title = element_text(family = "serif", size=12),
        legend.text = element_text(family = "serif", size=12),
        panel.background = element_blank()) + labs(title=expression("b) PRS Plot: Excluding APOE region variants"))
p2

df_1 <- df_1 %>% 
  mutate(category = reorder_within(Cell_Type, AIC, within = Model))

p4 <- ggplot(data=df_1, aes(x=Model, y=AIC, fill = Cell_Type, group = category)) +
  geom_bar(stat="identity", position = position_dodge(0.9), width = 0.5) 

p4 <- p4 + theme_bw() + scale_fill_manual(values=cbbPalette1)

p4 <- p4 + coord_cartesian(ylim=c(7635,7665)) + scale_y_continuous(breaks = seq(7635,7665, by=5))

p4 <- p4 + scale_x_continuous (breaks=seq(1, 7, 1), labels=c("PRS 1", "PRS 2", "PRS 3", "PRS 4", "PRS 5", "PRS 6", "PRS 7"))

p4 <- p4 + xlab ("PRS Models") + labs (color = "Cell_Type") + ylab (expression ("AIC"))

p4 <- p4 +
  theme(legend.position="right",
        plot.title = element_text(family = "serif", size=14, face = "bold", hjust = 0.5),
        axis.title.x = element_text(family = "serif", size=12),
        axis.title.y = element_text(family = "serif", size=12),
        axis.text.x = element_text(family = "serif", size=12),
        axis.text.y = element_text(family = "serif", size=12),
        legend.title = element_text(family = "serif", size=12),
        legend.text = element_text(family = "serif", size=12),
        panel.background = element_blank()) + labs(title=expression("d) Bar Plot (AIC): Excluding APOE region variants"))

plot <- ggarrange (p1, p2, p3, p4, ncol = 2, nrow = 2, common.legend = TRUE, legend = "bottom")

annotate_figure(plot, top = text_grob("Cell-Specific PRS association with Cognitive Decline (MMSE-Baseline): BioFINDER-1", color = "black", face = "bold", size = 16, family = "serif"))
