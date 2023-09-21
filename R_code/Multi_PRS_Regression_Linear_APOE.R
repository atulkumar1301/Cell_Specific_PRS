#! /Library/Frameworks/R.framework/Versions/4.3-x86_64/Resources/bin/Rscript
library(ROCR)
library(pROC)
library(bdpv)
library(data.table)
library(dplyr)
library(caret)
library(Rcpp)
library(RNOmni)
TABLE<-as.data.frame(matrix(ncol=30, nrow=7)) 
names(TABLE)<-c("Model", "Effect_A", "SE_A", "Number_of_Variants_A", "P_A",
                "Effect_EN", "SE_EN", "Number_of_Variants_EN", "P_EN",
                "Effect_IN", "SE_IN", "Number_of_Variants_IN", "P_IN",
                "Effect_M", "SE_M", "Number_of_Variants_M", "P_M",
                "Effect_OPC", "SE_OPC", "Number_of_Variants_OPC", "P_OPC",
                "Effect_O", "SE_O", "Number_of_Variants_O", "P_O", "R2", "L95", "U95", "AIC", "BIC")

Clinical_data <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Data_ptau_217.txt")
Full_File <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/PCA_FILE.eigenvec") %>% merge(Clinical_data, by = 'IID')

PRS_1_A <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Astrocytes/Non_APOE/p_value_0.05.sscore") 
PRS_1_EN <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Excitatory_neurons/Non_APOE/p_value_0.05.sscore") 
PRS_1_IN <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Inhibitory_neurons/Non_APOE/p_value_0.05.sscore") 
PRS_1_M <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Microglial_cells/Non_APOE/p_value_0.05.sscore") 
PRS_1_OPC <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocyte_precursor_cells/Non_APOE/p_value_0.05.sscore") 
PRS_1_O <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocytes/Non_APOE/p_value_0.05.sscore") 

PRS_2_A <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Astrocytes/Non_APOE/p_value_0.005.sscore") 
PRS_2_EN <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Excitatory_neurons/Non_APOE/p_value_0.005.sscore") 
PRS_2_IN <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Inhibitory_neurons/Non_APOE/p_value_0.005.sscore") 
PRS_2_M <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Microglial_cells/Non_APOE/p_value_0.005.sscore") 
PRS_2_OPC <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocyte_precursor_cells/Non_APOE/p_value_0.005.sscore") 
PRS_2_O <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocytes/Non_APOE/p_value_0.005.sscore") 

PRS_3_A <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Astrocytes/Non_APOE/p_value_0.0005.sscore") 
PRS_3_EN <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Excitatory_neurons/Non_APOE/p_value_0.0005.sscore") 
PRS_3_IN <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Inhibitory_neurons/Non_APOE/p_value_0.0005.sscore") 
PRS_3_M <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Microglial_cells/Non_APOE/p_value_0.0005.sscore") 
PRS_3_OPC <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocyte_precursor_cells/Non_APOE/p_value_0.0005.sscore") 
PRS_3_O <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocytes/Non_APOE/p_value_0.0005.sscore") 

PRS_4_A <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Astrocytes/Non_APOE/p_value_5e-05.sscore") 
PRS_4_EN <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Excitatory_neurons/Non_APOE/p_value_5e-05.sscore") 
PRS_4_IN <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Inhibitory_neurons/Non_APOE/p_value_5e-05.sscore") 
PRS_4_M <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Microglial_cells/Non_APOE/p_value_5e-05.sscore") 
PRS_4_OPC <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocyte_precursor_cells/Non_APOE/p_value_5e-05.sscore") 
PRS_4_O <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocytes/Non_APOE/p_value_5e-05.sscore") 

PRS_5_A <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Astrocytes/Non_APOE/p_value_5e-06.sscore") 
PRS_5_EN <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Excitatory_neurons/Non_APOE/p_value_5e-06.sscore") 
PRS_5_IN <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Inhibitory_neurons/Non_APOE/p_value_5e-06.sscore") 
PRS_5_M <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Microglial_cells/Non_APOE/p_value_5e-06.sscore") 
PRS_5_OPC <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocyte_precursor_cells/Non_APOE/p_value_5e-06.sscore") 
PRS_5_O <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocytes/Non_APOE/p_value_5e-06.sscore") 

PRS_6_A <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Astrocytes/Non_APOE/p_value_5e-07.sscore") 
PRS_6_EN <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Excitatory_neurons/Non_APOE/p_value_5e-07.sscore") 
PRS_6_IN <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Inhibitory_neurons/Non_APOE/p_value_5e-07.sscore") 
PRS_6_M <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Microglial_cells/Non_APOE/p_value_5e-07.sscore") 
PRS_6_OPC <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocyte_precursor_cells/Non_APOE/p_value_5e-07.sscore") 
PRS_6_O <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocytes/Non_APOE/p_value_5e-07.sscore") 

PRS_7_A <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Astrocytes/Non_APOE/p_value_5e-08.sscore") 
PRS_7_EN <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Excitatory_neurons/Non_APOE/p_value_5e-08.sscore") 
PRS_7_IN <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Inhibitory_neurons/Non_APOE/p_value_5e-08.sscore") 
PRS_7_M <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Microglial_cells/Non_APOE/p_value_5e-08.sscore") 
PRS_7_OPC <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocyte_precursor_cells/Non_APOE/p_value_5e-08.sscore") 
PRS_7_O <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocytes/Non_APOE/p_value_5e-08.sscore") 

df <- Clinical_data [, -1:-21]
for (p in colnames (df)) {
  i = 1
  TABLE [i, 1] <- "PRS 1"
  Full_File$Normal <- RankNorm(Full_File[[p]])
  Full_File$PHENO <- Full_File$Normal
  
  
  ###Astrocytes
  m1 <- mean (PRS_1_A$SCORE1_AVG)
  sd1 <- sd (PRS_1_A$SCORE1_AVG)
  PRS_1_A$NORMSCORE <- (PRS_1_A$SCORE1_AVG - m1) / sd1
  
  ###Excitatory Neurons
  m1 <- mean (PRS_1_EN$SCORE1_AVG)
  sd1 <- sd (PRS_1_EN$SCORE1_AVG)
  PRS_1_EN$NORMSCORE <- (PRS_1_EN$SCORE1_AVG - m1) / sd1
  
  ###Inhibitory Neurons
  m1 <- mean (PRS_1_IN$SCORE1_AVG)
  sd1 <- sd (PRS_1_IN$SCORE1_AVG)
  PRS_1_IN$NORMSCORE <- (PRS_1_IN$SCORE1_AVG - m1) / sd1
  
  ###Microglial
  m1 <- mean (PRS_1_M$SCORE1_AVG)
  sd1 <- sd (PRS_1_M$SCORE1_AVG)
  PRS_1_M$NORMSCORE <- (PRS_1_M$SCORE1_AVG - m1) / sd1
  
  ###OPC
  m1 <- mean (PRS_1_OPC$SCORE1_AVG)
  sd1 <- sd (PRS_1_OPC$SCORE1_AVG)
  PRS_1_OPC$NORMSCORE <- (PRS_1_OPC$SCORE1_AVG - m1) / sd1
  
  ###Oligodendrocyte
  m1 <- mean (PRS_1_O$SCORE1_AVG)
  sd1 <- sd (PRS_1_O$SCORE1_AVG)
  PRS_1_O$NORMSCORE <- (PRS_1_O$SCORE1_AVG - m1) / sd1
  
  modeldata20 <- glm (Full_File$PHENO ~ 1, family = gaussian)
  model_PRS1 <- glm (Full_File$PHENO ~ PRS_1_A$NORMSCORE + PRS_1_EN$NORMSCORE + PRS_1_IN$NORMSCORE + PRS_1_M$NORMSCORE + PRS_1_OPC$NORMSCORE + PRS_1_O$NORMSCORE +
                       Full_File$Age + Full_File$Gender + Full_File$PC1 + Full_File$PC2 + Full_File$PC3 + Full_File$PC4 + Full_File$PC5 + Full_File$PC6 + Full_File$PC7 + Full_File$PC8 + Full_File$PC9 + Full_File$PC10, family = gaussian)
  
  
  l0 <- deviance (modeldata20)
  df0 <- df.residual (modeldata20) #degree of freedom
  l1 <- deviance (model_PRS1)
  df1 <- df.residual (model_PRS1)
  
  ###Astrocytes
  TABLE[i, 2] <- summary (model_PRS1)$coefficients[2, "Estimate"]
  TABLE[i, 3] <- summary(model_PRS1)$coefficients[2, "Std. Error"]
  TABLE[i, 4] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Astrocytes/Non_APOE/p_value_0.05.txt"))
  TABLE[i, 5] <- summary (model_PRS1)$coefficients [2, "Pr(>|t|)"]
  
  ###Excitatory Neurons
  TABLE[i, 6] <- summary (model_PRS1)$coefficients[3, "Estimate"]
  TABLE[i, 7] <- summary(model_PRS1)$coefficients[3, "Std. Error"]
  TABLE[i, 8] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Excitatory_neurons/Non_APOE/p_value_0.05.txt"))
  TABLE[i, 9] <- summary (model_PRS1)$coefficients [3, "Pr(>|t|)"]
  
  ###Inhibitory Neurons
  TABLE[i, 10] <- summary (model_PRS1)$coefficients[4, "Estimate"]
  TABLE[i, 11] <- summary(model_PRS1)$coefficients[4, "Std. Error"]
  TABLE[i, 12] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Inhibitory_neurons/Non_APOE/p_value_0.05.txt"))
  TABLE[i, 13] <- summary (model_PRS1)$coefficients [4, "Pr(>|t|)"]
  
  ###Microglial
  TABLE[i, 14] <- summary (model_PRS1)$coefficients[5, "Estimate"]
  TABLE[i, 15] <- summary(model_PRS1)$coefficients[5, "Std. Error"]
  TABLE[i, 16] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Microglial_cells/Non_APOE/p_value_0.05.txt"))
  TABLE[i, 17] <- summary (model_PRS1)$coefficients [5, "Pr(>|t|)"]
  
  ###OPC
  TABLE[i, 18] <- summary (model_PRS1)$coefficients[6, "Estimate"]
  TABLE[i, 19] <- summary(model_PRS1)$coefficients[6, "Std. Error"]
  TABLE[i, 20] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocyte_precursor_cells/Non_APOE/p_value_0.05.txt"))
  TABLE[i, 21] <- summary (model_PRS1)$coefficients [6, "Pr(>|t|)"]
  
  ###Oligodendrocyte
  TABLE[i, 22] <- summary (model_PRS1)$coefficients[7, "Estimate"]
  TABLE[i, 23] <- summary(model_PRS1)$coefficients[7, "Std. Error"]
  TABLE[i, 24] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocytes/Non_APOE/p_value_0.05.txt"))
  TABLE[i, 25] <- summary (model_PRS1)$coefficients [7, "Pr(>|t|)"]
  
  TABLE[i, 26] <- (1 - exp ((l1 - l0)/nrow(Full_File)))/(1 - exp (-l0/nrow (Full_File)))        #Nagelkerke
  TABLE[i, 27] <- confint (model_PRS1) [2, 1] 
  TABLE[i, 28] <- confint (model_PRS1) [2, 2]
  TABLE[i, 29] <- AIC (model_PRS1)
  TABLE[i, 30] <- BIC (model_PRS1)
  
  #=========================================================================================================
  
  i = 2
  TABLE [i, 1] <- "PRS 2"
  
  ###Astrocytes
  m1 <- mean (PRS_2_A$SCORE1_AVG)
  sd1 <- sd (PRS_2_A$SCORE1_AVG)
  PRS_2_A$NORMSCORE <- (PRS_2_A$SCORE1_AVG - m1) / sd1
  
  ###Excitatory Neurons
  m1 <- mean (PRS_2_EN$SCORE1_AVG)
  sd1 <- sd (PRS_2_EN$SCORE1_AVG)
  PRS_2_EN$NORMSCORE <- (PRS_2_EN$SCORE1_AVG - m1) / sd1
  
  ###Inhibitory Neurons
  m1 <- mean (PRS_2_IN$SCORE1_AVG)
  sd1 <- sd (PRS_2_IN$SCORE1_AVG)
  PRS_2_IN$NORMSCORE <- (PRS_2_IN$SCORE1_AVG - m1) / sd1
  
  ###Microglial
  m1 <- mean (PRS_2_M$SCORE1_AVG)
  sd1 <- sd (PRS_2_M$SCORE1_AVG)
  PRS_2_M$NORMSCORE <- (PRS_2_M$SCORE1_AVG - m1) / sd1
  
  ###OPC
  m1 <- mean (PRS_2_OPC$SCORE1_AVG)
  sd1 <- sd (PRS_2_OPC$SCORE1_AVG)
  PRS_2_OPC$NORMSCORE <- (PRS_2_OPC$SCORE1_AVG - m1) / sd1
  
  ###Oligodendrocyte
  m1 <- mean (PRS_2_O$SCORE1_AVG)
  sd1 <- sd (PRS_2_O$SCORE1_AVG)
  PRS_2_O$NORMSCORE <- (PRS_2_O$SCORE1_AVG - m1) / sd1
  
  modeldata20 <- glm (Full_File$PHENO ~ 1, family = gaussian)
  model_PRS2 <- glm (Full_File$PHENO ~ PRS_2_A$NORMSCORE + PRS_2_EN$NORMSCORE + PRS_2_IN$NORMSCORE + PRS_2_M$NORMSCORE + PRS_2_OPC$NORMSCORE + PRS_2_O$NORMSCORE +
                       Full_File$Age + Full_File$Gender + Full_File$PC1 + Full_File$PC2 + Full_File$PC3 + Full_File$PC4 + Full_File$PC5 + Full_File$PC6 + Full_File$PC7 + Full_File$PC8 + Full_File$PC9 + Full_File$PC10, family = gaussian)
  
  
  l0 <- deviance (modeldata20)
  df0 <- df.residual (modeldata20) #degree of freedom
  l1 <- deviance (model_PRS2)
  df1 <- df.residual (model_PRS2)
  
  ###Astrocytes
  TABLE[i, 2] <- summary (model_PRS2)$coefficients[2, "Estimate"]
  TABLE[i, 3] <- summary(model_PRS2)$coefficients[2, "Std. Error"]
  TABLE[i, 4] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Astrocytes/Non_APOE/p_value_0.005.txt"))
  TABLE[i, 5] <- summary (model_PRS2)$coefficients [2, "Pr(>|t|)"]
  
  ###Excitatory Neurons
  TABLE[i, 6] <- summary (model_PRS2)$coefficients[3, "Estimate"]
  TABLE[i, 7] <- summary(model_PRS2)$coefficients[3, "Std. Error"]
  TABLE[i, 8] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Excitatory_neurons/Non_APOE/p_value_0.005.txt"))
  TABLE[i, 9] <- summary (model_PRS2)$coefficients [3, "Pr(>|t|)"]
  
  ###Inhibitory Neurons
  TABLE[i, 10] <- summary (model_PRS2)$coefficients[4, "Estimate"]
  TABLE[i, 11] <- summary(model_PRS2)$coefficients[4, "Std. Error"]
  TABLE[i, 12] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Inhibitory_neurons/Non_APOE/p_value_0.005.txt"))
  TABLE[i, 13] <- summary (model_PRS2)$coefficients [4, "Pr(>|t|)"]
  
  ###Microglial
  TABLE[i, 14] <- summary (model_PRS2)$coefficients[5, "Estimate"]
  TABLE[i, 15] <- summary(model_PRS2)$coefficients[5, "Std. Error"]
  TABLE[i, 16] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Microglial_cells/Non_APOE/p_value_0.005.txt"))
  TABLE[i, 17] <- summary (model_PRS2)$coefficients [5, "Pr(>|t|)"]
  
  ###OPC
  TABLE[i, 18] <- summary (model_PRS2)$coefficients[6, "Estimate"]
  TABLE[i, 19] <- summary(model_PRS2)$coefficients[6, "Std. Error"]
  TABLE[i, 20] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocyte_precursor_cells/Non_APOE/p_value_0.005.txt"))
  TABLE[i, 21] <- summary (model_PRS2)$coefficients [6, "Pr(>|t|)"]
  
  ###Oligodendrocyte
  TABLE[i, 22] <- summary (model_PRS2)$coefficients[7, "Estimate"]
  TABLE[i, 23] <- summary(model_PRS2)$coefficients[7, "Std. Error"]
  TABLE[i, 24] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocytes/Non_APOE/p_value_0.005.txt"))
  TABLE[i, 25] <- summary (model_PRS2)$coefficients [7, "Pr(>|t|)"]
  
  TABLE[i, 26] <- (1 - exp ((l1 - l0)/nrow(Full_File)))/(1 - exp (-l0/nrow (Full_File)))        #Nagelkerke
  TABLE[i, 27] <- confint (model_PRS2) [2, 1] 
  TABLE[i, 28] <- confint (model_PRS2) [2, 2]
  TABLE[i, 29] <- AIC (model_PRS2)
  TABLE[i, 30] <- BIC (model_PRS2)
  
  #================================================================================================
  
  i = 3
  TABLE [i, 1] <- "PRS 3"
  
  ###Astrocytes
  m1 <- mean (PRS_3_A$SCORE1_AVG)
  sd1 <- sd (PRS_3_A$SCORE1_AVG)
  PRS_3_A$NORMSCORE <- (PRS_3_A$SCORE1_AVG - m1) / sd1
  
  ###Excitatory Neurons
  m1 <- mean (PRS_3_EN$SCORE1_AVG)
  sd1 <- sd (PRS_3_EN$SCORE1_AVG)
  PRS_3_EN$NORMSCORE <- (PRS_3_EN$SCORE1_AVG - m1) / sd1
  
  ###Inhibitory Neurons
  m1 <- mean (PRS_3_IN$SCORE1_AVG)
  sd1 <- sd (PRS_3_IN$SCORE1_AVG)
  PRS_3_IN$NORMSCORE <- (PRS_3_IN$SCORE1_AVG - m1) / sd1
  
  ###Microglial
  m1 <- mean (PRS_3_M$SCORE1_AVG)
  sd1 <- sd (PRS_3_M$SCORE1_AVG)
  PRS_3_M$NORMSCORE <- (PRS_3_M$SCORE1_AVG - m1) / sd1
  
  ###OPC
  m1 <- mean (PRS_3_OPC$SCORE1_AVG)
  sd1 <- sd (PRS_3_OPC$SCORE1_AVG)
  PRS_3_OPC$NORMSCORE <- (PRS_3_OPC$SCORE1_AVG - m1) / sd1
  
  ###Oligodendrocyte
  m1 <- mean (PRS_3_O$SCORE1_AVG)
  sd1 <- sd (PRS_3_O$SCORE1_AVG)
  PRS_3_O$NORMSCORE <- (PRS_3_O$SCORE1_AVG - m1) / sd1
  
  modeldata20 <- glm (Full_File$PHENO ~ 1, family = gaussian)
  model_PRS3 <- glm (Full_File$PHENO ~ PRS_3_A$NORMSCORE + PRS_3_EN$NORMSCORE + PRS_3_IN$NORMSCORE + PRS_3_M$NORMSCORE + PRS_3_OPC$NORMSCORE + PRS_3_O$NORMSCORE +
                       Full_File$Age + Full_File$Gender + Full_File$PC1 + Full_File$PC2 + Full_File$PC3 + Full_File$PC4 + Full_File$PC5 + Full_File$PC6 + Full_File$PC7 + Full_File$PC8 + Full_File$PC9 + Full_File$PC10, family = gaussian)
  
  
  l0 <- deviance (modeldata20)
  df0 <- df.residual (modeldata20) #degree of freedom
  l1 <- deviance (model_PRS3)
  df1 <- df.residual (model_PRS3)
  
  ###Astrocytes
  TABLE[i, 2] <- summary (model_PRS3)$coefficients[2, "Estimate"]
  TABLE[i, 3] <- summary(model_PRS3)$coefficients[2, "Std. Error"]
  TABLE[i, 4] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Astrocytes/Non_APOE/p_value_0.0005.txt"))
  TABLE[i, 5] <- summary (model_PRS3)$coefficients [2, "Pr(>|t|)"]
  
  ###Excitatory Neurons
  TABLE[i, 6] <- summary (model_PRS3)$coefficients[3, "Estimate"]
  TABLE[i, 7] <- summary(model_PRS3)$coefficients[3, "Std. Error"]
  TABLE[i, 8] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Excitatory_neurons/Non_APOE/p_value_0.0005.txt"))
  TABLE[i, 9] <- summary (model_PRS3)$coefficients [3, "Pr(>|t|)"]
  
  ###Inhibitory Neurons
  TABLE[i, 10] <- summary (model_PRS3)$coefficients[4, "Estimate"]
  TABLE[i, 11] <- summary(model_PRS3)$coefficients[4, "Std. Error"]
  TABLE[i, 12] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Inhibitory_neurons/Non_APOE/p_value_0.0005.txt"))
  TABLE[i, 13] <- summary (model_PRS3)$coefficients [4, "Pr(>|t|)"]
  
  ###Microglial
  TABLE[i, 14] <- summary (model_PRS3)$coefficients[5, "Estimate"]
  TABLE[i, 15] <- summary(model_PRS3)$coefficients[5, "Std. Error"]
  TABLE[i, 16] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Microglial_cells/Non_APOE/p_value_0.0005.txt"))
  TABLE[i, 17] <- summary (model_PRS3)$coefficients [5, "Pr(>|t|)"]
  
  ###OPC
  TABLE[i, 18] <- summary (model_PRS3)$coefficients[6, "Estimate"]
  TABLE[i, 19] <- summary(model_PRS3)$coefficients[6, "Std. Error"]
  TABLE[i, 20] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocyte_precursor_cells/Non_APOE/p_value_0.0005.txt"))
  TABLE[i, 21] <- summary (model_PRS3)$coefficients [6, "Pr(>|t|)"]
  
  ###Oligodendrocyte
  TABLE[i, 22] <- summary (model_PRS3)$coefficients[7, "Estimate"]
  TABLE[i, 23] <- summary(model_PRS3)$coefficients[7, "Std. Error"]
  TABLE[i, 24] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocytes/Non_APOE/p_value_0.0005.txt"))
  TABLE[i, 25] <- summary (model_PRS3)$coefficients [7, "Pr(>|t|)"]
  
  TABLE[i, 26] <- (1 - exp ((l1 - l0)/nrow(Full_File)))/(1 - exp (-l0/nrow (Full_File)))        #Nagelkerke
  TABLE[i, 27] <- confint (model_PRS3) [2, 1] 
  TABLE[i, 28] <- confint (model_PRS3) [2, 2]
  TABLE[i, 29] <- AIC (model_PRS3)
  TABLE[i, 30] <- BIC (model_PRS3)
  
  #=============================================================================================
  
  i = 4
  TABLE [i, 1] <- "PRS 4"
  
  ###Astrocytes
  m1 <- mean (PRS_4_A$SCORE1_AVG)
  sd1 <- sd (PRS_4_A$SCORE1_AVG)
  PRS_4_A$NORMSCORE <- (PRS_4_A$SCORE1_AVG - m1) / sd1
  
  ###Excitatory Neurons
  m1 <- mean (PRS_4_EN$SCORE1_AVG)
  sd1 <- sd (PRS_4_EN$SCORE1_AVG)
  PRS_4_EN$NORMSCORE <- (PRS_4_EN$SCORE1_AVG - m1) / sd1
  
  ###Inhibitory Neurons
  m1 <- mean (PRS_4_IN$SCORE1_AVG)
  sd1 <- sd (PRS_4_IN$SCORE1_AVG)
  PRS_4_IN$NORMSCORE <- (PRS_4_IN$SCORE1_AVG - m1) / sd1
  
  ###Microglial
  m1 <- mean (PRS_4_M$SCORE1_AVG)
  sd1 <- sd (PRS_4_M$SCORE1_AVG)
  PRS_4_M$NORMSCORE <- (PRS_4_M$SCORE1_AVG - m1) / sd1
  
  ###OPC
  m1 <- mean (PRS_4_OPC$SCORE1_AVG)
  sd1 <- sd (PRS_4_OPC$SCORE1_AVG)
  PRS_4_OPC$NORMSCORE <- (PRS_4_OPC$SCORE1_AVG - m1) / sd1
  
  ###Oligodendrocyte
  m1 <- mean (PRS_4_O$SCORE1_AVG)
  sd1 <- sd (PRS_4_O$SCORE1_AVG)
  PRS_4_O$NORMSCORE <- (PRS_4_O$SCORE1_AVG - m1) / sd1
  
  modeldata20 <- glm (Full_File$PHENO ~ 1, family = gaussian)
  model_PRS4 <- glm (Full_File$PHENO ~ PRS_4_A$NORMSCORE + PRS_4_EN$NORMSCORE + PRS_4_IN$NORMSCORE + PRS_4_M$NORMSCORE + PRS_4_OPC$NORMSCORE + PRS_4_O$NORMSCORE +
                       Full_File$Age + Full_File$Gender + Full_File$PC1 + Full_File$PC2 + Full_File$PC3 + Full_File$PC4 + Full_File$PC5 + Full_File$PC6 + Full_File$PC7 + Full_File$PC8 + Full_File$PC9 + Full_File$PC10, family = gaussian)
  
  
  l0 <- deviance (modeldata20)
  df0 <- df.residual (modeldata20) #degree of freedom
  l1 <- deviance (model_PRS4)
  df1 <- df.residual (model_PRS4)
  
  ###Astrocytes
  TABLE[i, 2] <- summary (model_PRS4)$coefficients[2, "Estimate"]
  TABLE[i, 3] <- summary(model_PRS4)$coefficients[2, "Std. Error"]
  TABLE[i, 4] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Astrocytes/Non_APOE/p_value_5e-05.txt"))
  TABLE[i, 5] <- summary (model_PRS4)$coefficients [2, "Pr(>|t|)"]
  
  ###Excitatory Neurons
  TABLE[i, 6] <- summary (model_PRS4)$coefficients[3, "Estimate"]
  TABLE[i, 7] <- summary(model_PRS4)$coefficients[3, "Std. Error"]
  TABLE[i, 8] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Excitatory_neurons/Non_APOE/p_value_5e-05.txt"))
  TABLE[i, 9] <- summary (model_PRS4)$coefficients [3, "Pr(>|t|)"]
  
  ###Inhibitory Neurons
  TABLE[i, 10] <- summary (model_PRS4)$coefficients[4, "Estimate"]
  TABLE[i, 11] <- summary(model_PRS4)$coefficients[4, "Std. Error"]
  TABLE[i, 12] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Inhibitory_neurons/Non_APOE/p_value_5e-05.txt"))
  TABLE[i, 13] <- summary (model_PRS4)$coefficients [4, "Pr(>|t|)"]
  
  ###Microglial
  TABLE[i, 14] <- summary (model_PRS4)$coefficients[5, "Estimate"]
  TABLE[i, 15] <- summary(model_PRS4)$coefficients[5, "Std. Error"]
  TABLE[i, 16] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Microglial_cells/Non_APOE/p_value_5e-05.txt"))
  TABLE[i, 17] <- summary (model_PRS4)$coefficients [5, "Pr(>|t|)"]
  
  ###OPC
  TABLE[i, 18] <- summary (model_PRS4)$coefficients[6, "Estimate"]
  TABLE[i, 19] <- summary(model_PRS4)$coefficients[6, "Std. Error"]
  TABLE[i, 20] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocyte_precursor_cells/Non_APOE/p_value_5e-05.txt"))
  TABLE[i, 21] <- summary (model_PRS4)$coefficients [6, "Pr(>|t|)"]
  
  ###Oligodendrocyte
  TABLE[i, 22] <- summary (model_PRS4)$coefficients[7, "Estimate"]
  TABLE[i, 23] <- summary(model_PRS4)$coefficients[7, "Std. Error"]
  TABLE[i, 24] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocytes/Non_APOE/p_value_5e-05.txt"))
  TABLE[i, 25] <- summary (model_PRS4)$coefficients [7, "Pr(>|t|)"]
  
  TABLE[i, 26] <- (1 - exp ((l1 - l0)/nrow(Full_File)))/(1 - exp (-l0/nrow (Full_File)))        #Nagelkerke
  TABLE[i, 27] <- confint (model_PRS4) [2, 1] 
  TABLE[i, 28] <- confint (model_PRS4) [2, 2]
  TABLE[i, 29] <- AIC (model_PRS4)
  TABLE[i, 30] <- BIC (model_PRS4)
  
  #====================================================================================================
  
  i = 5
  TABLE [i, 1] <- "PRS 5"
  
  ###Astrocytes
  m1 <- mean (PRS_5_A$SCORE1_AVG)
  sd1 <- sd (PRS_5_A$SCORE1_AVG)
  PRS_5_A$NORMSCORE <- (PRS_5_A$SCORE1_AVG - m1) / sd1
  
  ###Excitatory Neurons
  m1 <- mean (PRS_5_EN$SCORE1_AVG)
  sd1 <- sd (PRS_5_EN$SCORE1_AVG)
  PRS_5_EN$NORMSCORE <- (PRS_5_EN$SCORE1_AVG - m1) / sd1
  
  ###Inhibitory Neurons
  m1 <- mean (PRS_5_IN$SCORE1_AVG)
  sd1 <- sd (PRS_5_IN$SCORE1_AVG)
  PRS_5_IN$NORMSCORE <- (PRS_5_IN$SCORE1_AVG - m1) / sd1
  
  ###Microglial
  m1 <- mean (PRS_5_M$SCORE1_AVG)
  sd1 <- sd (PRS_5_M$SCORE1_AVG)
  PRS_5_M$NORMSCORE <- (PRS_5_M$SCORE1_AVG - m1) / sd1
  
  ###OPC
  m1 <- mean (PRS_5_OPC$SCORE1_AVG)
  sd1 <- sd (PRS_5_OPC$SCORE1_AVG)
  PRS_5_OPC$NORMSCORE <- (PRS_5_OPC$SCORE1_AVG - m1) / sd1
  
  ###Oligodendrocyte
  m1 <- mean (PRS_5_O$SCORE1_AVG)
  sd1 <- sd (PRS_5_O$SCORE1_AVG)
  PRS_5_O$NORMSCORE <- (PRS_5_O$SCORE1_AVG - m1) / sd1
  
  modeldata20 <- glm (Full_File$PHENO ~ 1, family = gaussian)
  model_PRS5 <- glm (Full_File$PHENO ~ PRS_5_A$NORMSCORE + PRS_5_EN$NORMSCORE + PRS_5_IN$NORMSCORE + PRS_5_M$NORMSCORE + PRS_5_OPC$NORMSCORE + PRS_5_O$NORMSCORE +
                       Full_File$Age + Full_File$Gender + Full_File$PC1 + Full_File$PC2 + Full_File$PC3 + Full_File$PC4 + Full_File$PC5 + Full_File$PC6 + Full_File$PC7 + Full_File$PC8 + Full_File$PC9 + Full_File$PC10, family = gaussian)
  
  
  l0 <- deviance (modeldata20)
  df0 <- df.residual (modeldata20) #degree of freedom
  l1 <- deviance (model_PRS5)
  df1 <- df.residual (model_PRS5)
  
  ###Astrocytes
  TABLE[i, 2] <- summary (model_PRS5)$coefficients[2, "Estimate"]
  TABLE[i, 3] <- summary(model_PRS5)$coefficients[2, "Std. Error"]
  TABLE[i, 4] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Astrocytes/Non_APOE/p_value_5e-06.txt"))
  TABLE[i, 5] <- summary (model_PRS5)$coefficients [2, "Pr(>|t|)"]
  
  ###Excitatory Neurons
  TABLE[i, 6] <- summary (model_PRS5)$coefficients[3, "Estimate"]
  TABLE[i, 7] <- summary(model_PRS5)$coefficients[3, "Std. Error"]
  TABLE[i, 8] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Excitatory_neurons/Non_APOE/p_value_5e-06.txt"))
  TABLE[i, 9] <- summary (model_PRS5)$coefficients [3, "Pr(>|t|)"]
  
  ###Inhibitory Neurons
  TABLE[i, 10] <- summary (model_PRS5)$coefficients[4, "Estimate"]
  TABLE[i, 11] <- summary(model_PRS5)$coefficients[4, "Std. Error"]
  TABLE[i, 12] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Inhibitory_neurons/Non_APOE/p_value_5e-06.txt"))
  TABLE[i, 13] <- summary (model_PRS5)$coefficients [4, "Pr(>|t|)"]
  
  ###Microglial
  TABLE[i, 14] <- summary (model_PRS5)$coefficients[5, "Estimate"]
  TABLE[i, 15] <- summary(model_PRS5)$coefficients[5, "Std. Error"]
  TABLE[i, 16] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Microglial_cells/Non_APOE/p_value_5e-06.txt"))
  TABLE[i, 17] <- summary (model_PRS5)$coefficients [5, "Pr(>|t|)"]
  
  ###OPC
  TABLE[i, 18] <- summary (model_PRS5)$coefficients[6, "Estimate"]
  TABLE[i, 19] <- summary(model_PRS5)$coefficients[6, "Std. Error"]
  TABLE[i, 20] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocyte_precursor_cells/Non_APOE/p_value_5e-06.txt"))
  TABLE[i, 21] <- summary (model_PRS5)$coefficients [6, "Pr(>|t|)"]
  
  ###Oligodendrocyte
  TABLE[i, 22] <- summary (model_PRS5)$coefficients[7, "Estimate"]
  TABLE[i, 23] <- summary(model_PRS5)$coefficients[7, "Std. Error"]
  TABLE[i, 24] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocytes/Non_APOE/p_value_5e-06.txt"))
  TABLE[i, 25] <- summary (model_PRS5)$coefficients [7, "Pr(>|t|)"]
  
  TABLE[i, 26] <- (1 - exp ((l1 - l0)/nrow(Full_File)))/(1 - exp (-l0/nrow (Full_File)))        #Nagelkerke
  TABLE[i, 27] <- confint (model_PRS5) [2, 1] 
  TABLE[i, 28] <- confint (model_PRS5) [2, 2]
  TABLE[i, 29] <- AIC (model_PRS5)
  TABLE[i, 30] <- BIC (model_PRS5)
  
  #===================================================================================================
  
  i = 6
  TABLE [i, 1] <- "PRS 6"
  
  ###Astrocytes
  m1 <- mean (PRS_6_A$SCORE1_AVG)
  sd1 <- sd (PRS_6_A$SCORE1_AVG)
  PRS_6_A$NORMSCORE <- (PRS_6_A$SCORE1_AVG - m1) / sd1
  
  ###Excitatory Neurons
  m1 <- mean (PRS_6_EN$SCORE1_AVG)
  sd1 <- sd (PRS_6_EN$SCORE1_AVG)
  PRS_6_EN$NORMSCORE <- (PRS_6_EN$SCORE1_AVG - m1) / sd1
  
  ###Inhibitory Neurons
  m1 <- mean (PRS_6_IN$SCORE1_AVG)
  sd1 <- sd (PRS_6_IN$SCORE1_AVG)
  PRS_6_IN$NORMSCORE <- (PRS_6_IN$SCORE1_AVG - m1) / sd1
  
  ###Microglial
  m1 <- mean (PRS_6_M$SCORE1_AVG)
  sd1 <- sd (PRS_6_M$SCORE1_AVG)
  PRS_6_M$NORMSCORE <- (PRS_6_M$SCORE1_AVG - m1) / sd1
  
  ###OPC
  m1 <- mean (PRS_6_OPC$SCORE1_AVG)
  sd1 <- sd (PRS_6_OPC$SCORE1_AVG)
  PRS_6_OPC$NORMSCORE <- (PRS_6_OPC$SCORE1_AVG - m1) / sd1
  
  ###Oligodendrocyte
  m1 <- mean (PRS_6_O$SCORE1_AVG)
  sd1 <- sd (PRS_6_O$SCORE1_AVG)
  PRS_6_O$NORMSCORE <- (PRS_6_O$SCORE1_AVG - m1) / sd1
  
  modeldata20 <- glm (Full_File$PHENO ~ 1, family = gaussian)
  model_PRS6 <- glm (Full_File$PHENO ~ PRS_6_A$NORMSCORE + PRS_6_EN$NORMSCORE + PRS_6_IN$NORMSCORE + PRS_6_M$NORMSCORE + PRS_6_OPC$NORMSCORE + PRS_6_O$NORMSCORE +
                       Full_File$Age + Full_File$Gender + Full_File$PC1 + Full_File$PC2 + Full_File$PC3 + Full_File$PC4 + Full_File$PC5 + Full_File$PC6 + Full_File$PC7 + Full_File$PC8 + Full_File$PC9 + Full_File$PC10, family = gaussian)
  
  
  l0 <- deviance (modeldata20)
  df0 <- df.residual (modeldata20) #degree of freedom
  l1 <- deviance (model_PRS6)
  df1 <- df.residual (model_PRS6)
  
  ###Astrocytes
  TABLE[i, 2] <- summary (model_PRS6)$coefficients[2, "Estimate"]
  TABLE[i, 3] <- summary(model_PRS6)$coefficients[2, "Std. Error"]
  TABLE[i, 4] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Astrocytes/Non_APOE/p_value_5e-07.txt"))
  TABLE[i, 5] <- summary (model_PRS6)$coefficients [2, "Pr(>|t|)"]
  
  ###Excitatory Neurons
  TABLE[i, 6] <- summary (model_PRS6)$coefficients[3, "Estimate"]
  TABLE[i, 7] <- summary(model_PRS6)$coefficients[3, "Std. Error"]
  TABLE[i, 8] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Excitatory_neurons/Non_APOE/p_value_5e-07.txt"))
  TABLE[i, 9] <- summary (model_PRS6)$coefficients [3, "Pr(>|t|)"]
  
  ###Inhibitory Neurons
  TABLE[i, 10] <- summary (model_PRS6)$coefficients[4, "Estimate"]
  TABLE[i, 11] <- summary(model_PRS6)$coefficients[4, "Std. Error"]
  TABLE[i, 12] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Inhibitory_neurons/Non_APOE/p_value_5e-07.txt"))
  TABLE[i, 13] <- summary (model_PRS6)$coefficients [4, "Pr(>|t|)"]
  
  ###Microglial
  TABLE[i, 14] <- summary (model_PRS6)$coefficients[5, "Estimate"]
  TABLE[i, 15] <- summary(model_PRS6)$coefficients[5, "Std. Error"]
  TABLE[i, 16] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Microglial_cells/Non_APOE/p_value_5e-07.txt"))
  TABLE[i, 17] <- summary (model_PRS6)$coefficients [5, "Pr(>|t|)"]
  
  ###OPC
  TABLE[i, 18] <- summary (model_PRS6)$coefficients[6, "Estimate"]
  TABLE[i, 19] <- summary(model_PRS6)$coefficients[6, "Std. Error"]
  TABLE[i, 20] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocyte_precursor_cells/Non_APOE/p_value_5e-07.txt"))
  TABLE[i, 21] <- summary (model_PRS6)$coefficients [6, "Pr(>|t|)"]
  
  ###Oligodendrocyte
  TABLE[i, 22] <- summary (model_PRS6)$coefficients[7, "Estimate"]
  TABLE[i, 23] <- summary(model_PRS6)$coefficients[7, "Std. Error"]
  TABLE[i, 24] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocytes/Non_APOE/p_value_5e-07.txt"))
  TABLE[i, 25] <- summary (model_PRS6)$coefficients [7, "Pr(>|t|)"]
  
  TABLE[i, 26] <- (1 - exp ((l1 - l0)/nrow(Full_File)))/(1 - exp (-l0/nrow (Full_File)))        #Nagelkerke
  TABLE[i, 27] <- confint (model_PRS6) [2, 1] 
  TABLE[i, 28] <- confint (model_PRS6) [2, 2]
  TABLE[i, 29] <- AIC (model_PRS6)
  TABLE[i, 30] <- BIC (model_PRS6)
  
  #=========================================================================================================
  
  i = 7
  TABLE [i, 1] <- "PRS 7"
  
  ###Astrocytes
  m1 <- mean (PRS_7_A$SCORE1_AVG)
  sd1 <- sd (PRS_7_A$SCORE1_AVG)
  PRS_7_A$NORMSCORE <- (PRS_7_A$SCORE1_AVG - m1) / sd1
  
  ###Excitatory Neurons
  m1 <- mean (PRS_7_EN$SCORE1_AVG)
  sd1 <- sd (PRS_7_EN$SCORE1_AVG)
  PRS_7_EN$NORMSCORE <- (PRS_7_EN$SCORE1_AVG - m1) / sd1
  
  ###Inhibitory Neurons
  m1 <- mean (PRS_7_IN$SCORE1_AVG)
  sd1 <- sd (PRS_7_IN$SCORE1_AVG)
  PRS_7_IN$NORMSCORE <- (PRS_7_IN$SCORE1_AVG - m1) / sd1
  
  ###Microglial
  m1 <- mean (PRS_7_M$SCORE1_AVG)
  sd1 <- sd (PRS_7_M$SCORE1_AVG)
  PRS_7_M$NORMSCORE <- (PRS_7_M$SCORE1_AVG - m1) / sd1
  
  ###OPC
  m1 <- mean (PRS_7_OPC$SCORE1_AVG)
  sd1 <- sd (PRS_7_OPC$SCORE1_AVG)
  PRS_7_OPC$NORMSCORE <- (PRS_7_OPC$SCORE1_AVG - m1) / sd1
  
  ###Oligodendrocyte
  m1 <- mean (PRS_7_O$SCORE1_AVG)
  sd1 <- sd (PRS_7_O$SCORE1_AVG)
  PRS_7_O$NORMSCORE <- (PRS_7_O$SCORE1_AVG - m1) / sd1
  
  modeldata20 <- glm (Full_File$PHENO ~ 1, family = gaussian)
  model_PRS7 <- glm (Full_File$PHENO ~ PRS_7_A$NORMSCORE + PRS_7_EN$NORMSCORE + PRS_7_IN$NORMSCORE + PRS_7_M$NORMSCORE + PRS_7_OPC$NORMSCORE + PRS_7_O$NORMSCORE +
                       Full_File$Age + Full_File$Gender + Full_File$PC1 + Full_File$PC2 + Full_File$PC3 + Full_File$PC4 + Full_File$PC5 + Full_File$PC6 + Full_File$PC7 + Full_File$PC8 + Full_File$PC9 + Full_File$PC10, family = gaussian)
  
  
  l0 <- deviance (modeldata20)
  df0 <- df.residual (modeldata20) #degree of freedom
  l1 <- deviance (model_PRS7)
  df1 <- df.residual (model_PRS7)
  
  ###Astrocytes
  TABLE[i, 2] <- summary (model_PRS7)$coefficients[2, "Estimate"]
  TABLE[i, 3] <- summary(model_PRS7)$coefficients[2, "Std. Error"]
  TABLE[i, 4] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Astrocytes/Non_APOE/p_value_5e-08.txt"))
  TABLE[i, 5] <- summary (model_PRS7)$coefficients [2, "Pr(>|t|)"]
  
  ###Excitatory Neurons
  TABLE[i, 6] <- summary (model_PRS7)$coefficients[3, "Estimate"]
  TABLE[i, 7] <- summary(model_PRS7)$coefficients[3, "Std. Error"]
  TABLE[i, 8] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Excitatory_neurons/Non_APOE/p_value_5e-08.txt"))
  TABLE[i, 9] <- summary (model_PRS7)$coefficients [3, "Pr(>|t|)"]
  
  ###Inhibitory Neurons
  TABLE[i, 10] <- summary (model_PRS7)$coefficients[4, "Estimate"]
  TABLE[i, 11] <- summary(model_PRS7)$coefficients[4, "Std. Error"]
  TABLE[i, 12] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Inhibitory_neurons/Non_APOE/p_value_5e-08.txt"))
  TABLE[i, 13] <- summary (model_PRS7)$coefficients [4, "Pr(>|t|)"]
  
  ###Microglial
  TABLE[i, 14] <- summary (model_PRS7)$coefficients[5, "Estimate"]
  TABLE[i, 15] <- summary(model_PRS7)$coefficients[5, "Std. Error"]
  TABLE[i, 16] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Microglial_cells/Non_APOE/p_value_5e-08.txt"))
  TABLE[i, 17] <- summary (model_PRS7)$coefficients [5, "Pr(>|t|)"]
  
  ###OPC
  TABLE[i, 18] <- summary (model_PRS7)$coefficients[6, "Estimate"]
  TABLE[i, 19] <- summary(model_PRS7)$coefficients[6, "Std. Error"]
  TABLE[i, 20] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocyte_precursor_cells/Non_APOE/p_value_5e-08.txt"))
  TABLE[i, 21] <- summary (model_PRS7)$coefficients [6, "Pr(>|t|)"]
  
  ###Oligodendrocyte
  TABLE[i, 22] <- summary (model_PRS7)$coefficients[7, "Estimate"]
  TABLE[i, 23] <- summary(model_PRS7)$coefficients[7, "Std. Error"]
  TABLE[i, 24] <- nrow (fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217/Oligodendrocytes/Non_APOE/p_value_5e-08.txt"))
  TABLE[i, 25] <- summary (model_PRS7)$coefficients [7, "Pr(>|t|)"]
  
  TABLE[i, 26] <- (1 - exp ((l1 - l0)/nrow(Full_File)))/(1 - exp (-l0/nrow (Full_File)))        #Nagelkerke
  TABLE[i, 27] <- confint (model_PRS7) [2, 1] 
  TABLE[i, 28] <- confint (model_PRS7) [2, 2]
  TABLE[i, 29] <- AIC (model_PRS7)
  TABLE[i, 30] <- BIC (model_PRS7)
  
  #=======================================================================================================
  
  #TABLE$Bonferroni <- p.adjust(TABLE$P, method = "bonferroni", n = length(TABLE$P))
  #TABLE$FDR <- p.adjust(TABLE$P, method = "fdr", n = length(TABLE$P))
  write.table (TABLE, file = paste0 ("PRS_Result_",p,".txt"), sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)
}
