#! /Library/Frameworks/R.framework/Versions/4.3-x86_64/Resources/bin/Rscript
library(data.table)
library(mediation)
library(dplyr)
library(RNOmni)
args <- commandArgs(trailingOnly = TRUE)
Clinical_data <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217_PRS_Olink/PRS_Gene_Cell_Specificity/PRS/Data_ptau_217.txt")
Full_File <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/PCA_FILE.eigenvec") %>% merge(Clinical_data, by = 'IID')
prss <- list ("PRS_1", "PRS_2", "PRS_3", "PRS_4", "PRS_5", "PRS_6", "PRS_7")
#cells <- list ("Astrocyte", "Excitatory_neuron", "Inhibitory_neuron", "Microglia", "Oligodendrocyte", "OPC", "Original")
cells <- list ("Astrocyte")
for (j in cells){
  data2 <- fread (file = paste0 ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/", j, "/Non_APOE/", args[1])) %>% merge(Full_File, by = 'IID')
  plot (density(data2$CSF_ptau217))
  data2$pTau_Normal <- RankNorm(data2$CSF_ptau217)
  plot (density(data2$pTau_Normal))
  data2$PHENO<- data2$pTau_Normal
  
  m1<-mean(data2$SCORE1_AVG)
  sd1<-sd(data2$SCORE1_AVG)
  data2$NORMSCORE<-(data2$SCORE1_AVG-m1)/sd1
  Total_Effect <-lm(PHENO ~ NORMSCORE + Age + Gender + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10, data=data2)
  
  sink(paste0("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Olink_Mediation/Non_APOE/", j, "/", args[2], "/Total_Effect.txt"))
  print(summary(Total_Effect))
  sink()
  
  Mediator_Effect <-lm(Total_Astrocyte ~ NORMSCORE + Age + Gender + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10, data=data2)
  
  sink(paste0("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Olink_Mediation/Non_APOE/", j, "/", args[2], "/Mediator_Effect.txt"))
  print(summary(Mediator_Effect))
  sink()
  
  Main_Effect <-lm(PHENO ~ NORMSCORE + Total_Astrocyte + Age + Gender + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10, data=data2)
  sink(paste0("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Olink_Mediation/Non_APOE/", j, "/", args[2], "/Main_Effect.txt"))
  print(summary(Main_Effect))
  sink()
  
  Mediation_Result <- mediate(Mediator_Effect, Main_Effect, treat='NORMSCORE', mediator='Total_Astrocyte', boot=T)
  sink(paste0("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Olink_Mediation/Non_APOE/", j, "/", args[2], "/Mediation_Result.txt"))
  print(summary(Mediation_Result))
  sink()
}
