library(data.table)
library(mosaic)
TABLE<-as.data.frame(matrix(ncol=4, nrow=7))
names(TABLE)<-c("PRS", "Cell_Type", "L95", "U95")
df <- fread ("PRS_Plot_APOE_Abeta.txt")
for (i in 1:7){
  df_1 <- df [df$Model == i]
  boot = do(10000)*diffmean(Effect ~ Cell_Type, only.2 = FALSE, data=mosaic::resample(df_1))
  CI <- confint(boot$Excitatory.Neurons.Astrocytes.PRS, level = 0.95)
  j = 1
  TABLE[j, 1] <- j
  TABLE[j, 2] <- colnames (boot [1])
  TABLE[j, 3] <- CI$`2.5%`
  TABLE[j, 4] <- CI$`97.5%`
  CI <- confint(boot$Full.PRS.Excitatory.Neurons, level = 0.95)
  j = 2
  TABLE[j, 1] <- j
  TABLE[j, 2] <- colnames (boot [2])
  TABLE[j, 3] <- CI$`2.5%`
  TABLE[j, 4] <- CI$`97.5%`
  CI <- confint(boot$Inhibitory.Neurons.Full.PRS, level = 0.95)
  j = 3
  TABLE[j, 1] <- j
  TABLE[j, 2] <- colnames (boot [3])
  TABLE[j, 3] <- CI$`2.5%`
  TABLE[j, 4] <- CI$`97.5%`
  CI <- confint(boot$Microglial.Cells.Inhibitory.Neurons, level = 0.95)
  j = 4
  TABLE[j, 1] <- j
  TABLE[j, 2] <- colnames (boot [4])
  TABLE[j, 3] <- CI$`2.5%`
  TABLE[j, 4] <- CI$`97.5%`
  CI <- confint(boot$Oligodendrocyte.Precursor.Cells.Microglial.Cells, level = 0.95)
  j = 5
  TABLE[j, 1] <- j
  TABLE[j, 2] <- colnames (boot [5])
  TABLE[j, 3] <- CI$`2.5%`
  TABLE[j, 4] <- CI$`97.5%`
  CI <- confint(boot$Oligodendrocytes.Oligodendrocyte.Precursor.Cells, level = 0.95)
  j = 6
  TABLE[j, 1] <- j
  TABLE[j, 2] <- colnames (boot [6])
  TABLE[j, 3] <- CI$`2.5%`
  TABLE[j, 4] <- CI$`97.5%`
}
