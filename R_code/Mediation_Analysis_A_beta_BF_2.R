#! /Library/Frameworks/R.framework/Versions/4.4-x86_64/Resources/bin/Rscript
library(data.table)
library(mediation)
library(dplyr)
library(RNOmni)
args <- commandArgs(trailingOnly = TRUE)
Clinical_data <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/BF_2/CSF_pTau217/Data.txt")
Full_File <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/BF_2/CSF_pTau217/PCA_FILE.eigenvec") %>% merge(Clinical_data, by = 'IID')
prss <- list ("PRS_1", "PRS_2", "PRS_3", "PRS_4", "PRS_5", "PRS_6", "PRS_7")
cells <- list ("Astrocytes", "Excitatory_neurons", "Inhibitory_neurons", "Microglial_cells", "Oligodendrocyte_precursor_cells", "Oligodendrocytes", "Original_PRS")
#cells <- list ("Astrocyte")
for (j in cells){
  data2 <- fread (file = paste0 ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/BF_2/CSF_pTau217/", j, "/APOE/", args[1])) %>% merge(Full_File, by = 'IID')
  plot (density(data2$CSF_ptau217_pgml_Lilly_2019_2024))
  data2$pTau_Normal <- RankNorm(data2$CSF_ptau217_pgml_Lilly_2019_2024)
  plot (density(data2$pTau_Normal))
  data2$PHENO<- data2$pTau_Normal
  
  m1<-mean(data2$SCORE1_AVG)
  sd1<-sd(data2$SCORE1_AVG)
  data2$NORMSCORE<-(data2$SCORE1_AVG-m1)/sd1
  Total_Effect <-lm(PHENO ~ NORMSCORE + Age + Gender + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10, data=data2)
  
  sink(paste0("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/BF_2/Ab_Mediation/APOE/", j, "/", args[2], "/Total_Effect.txt"))
  print(summary(Total_Effect))
  sink()
  
  Mediator_Effect <-lm(Abnormal_CSF_Ab42_Ab40_Ratio ~ NORMSCORE + Age + Gender + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10, data=data2)
  
  sink(paste0("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/BF_2/Ab_Mediation/APOE/", j, "/", args[2], "/Mediator_Effect.txt"))
  print(summary(Mediator_Effect))
  sink()
  
  Main_Effect <-lm(PHENO ~ NORMSCORE + Abnormal_CSF_Ab42_Ab40_Ratio + Age + Gender + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10, data=data2)
  sink(paste0("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/BF_2/Ab_Mediation/APOE/", j, "/", args[2], "/Main_Effect.txt"))
  print(summary(Main_Effect))
  sink()
  
  Mediation_Result <- mediate(Mediator_Effect, Main_Effect, treat='NORMSCORE', mediator='Abnormal_CSF_Ab42_Ab40_Ratio', boot=T)
  sink(paste0("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/BF_2/Ab_Mediation/APOE/", j, "/", args[2], "/Mediation_Result.txt"))
  print(summary(Mediation_Result))
  sink()
}
