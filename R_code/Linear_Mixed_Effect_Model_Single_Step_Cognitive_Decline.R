#! /Library/Frameworks/R.framework/Versions/4.3-x86_64/Resources/bin/Rscript
library(ROCR)
library(pROC)
library(bdpv)
library(data.table)
library(dplyr)
library(caret)
library(Rcpp)
library(RNOmni)
library(lme4)
args <- commandArgs(trailingOnly = TRUE)
TABLE<-as.data.frame(matrix(ncol=3, nrow=7)) 
names(TABLE)<-c("Model", "P_Chisq_M1", "P_Chisq_M2")
Clinical_data <- fread ("~/Library/CloudStorage/OneDrive-UniversityofEasternFinland/Work/Projects/Cell_Specific_PRSs/Full_Data/Cognitive_Decline/MMSE_Longi/Data_Cognitive_Decline_MMSE.txt")
Full_File <- fread ("~/Library/CloudStorage/OneDrive-UniversityofEasternFinland/Work/Projects/Cell_Specific_PRSs/Full_Data/Cognitive_Decline/MMSE_Longi/PCA_FILE.eigenvec") %>% merge(Clinical_data, by = 'IID')
PRS_1 <- fread ("p_value_0.05.sscore") %>% merge(Full_File, by = 'IID')
PRS_2 <- fread ("p_value_0.005.sscore") %>% merge(Full_File, by = 'IID')
PRS_3 <- fread ("p_value_0.0005.sscore") %>% merge(Full_File, by = 'IID')
PRS_4 <- fread ("p_value_5e-05.sscore") %>% merge(Full_File, by = 'IID')
PRS_5 <- fread ("p_value_5e-06.sscore") %>% merge(Full_File, by = 'IID')
PRS_6 <- fread ("p_value_5e-07.sscore") %>% merge(Full_File, by = 'IID')
PRS_7 <- fread ("p_value_5e-08.sscore") %>% merge(Full_File, by = 'IID')

i = 1

data2 <- PRS_1
TABLE [i, 1] <- "PRS 1"
  
m1 <- mean (data2$SCORE1_AVG)
sd1 <- sd (data2$SCORE1_AVG)
data2$NORMSCORE <- (data2$SCORE1_AVG - m1) / sd1

model_PRS1_A <- lmer(mmse_score ~ age + gender_baseline_variable + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10 + NORMSCORE + Time + NORMSCORE:Time + (1 + Time | sid), data2, na.action = na.omit)
model_PRS1_B <-  lmer(mmse_score ~ age + gender_baseline_variable + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10 + NORMSCORE + Time + (1 + Time | sid), data2, na.action = na.omit)
PRS1 <- stats::anova(model_PRS1_A, model_PRS1_A)

TABLE[i, 2] <- PRS1$`Pr(>Chisq)`[1]
TABLE[i, 3] <- PRS1$`Pr(>Chisq)`[2]

#=========================================================================================================
  
i = 2
  
data2 <- PRS_2

TABLE [i, 1] <- "PRS 2"
  
m1 <- mean (data2$SCORE1_AVG)
sd1 <- sd (data2$SCORE1_AVG)
data2$NORMSCORE <- (data2$SCORE1_AVG - m1) / sd1


model_PRS2_A <- lmer(mmse_score ~ age + gender_baseline_variable + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10 + NORMSCORE + Time + NORMSCORE:Time + (1 + Time | sid), data2, na.action = na.omit)
model_PRS2_B <-  lmer(mmse_score ~ age + gender_baseline_variable + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10 + NORMSCORE + Time + (1 + Time | sid), data2, na.action = na.omit)
PRS2 <- anova(model_PRS2_A, model_PRS2_A)

TABLE[i, 2] <- PRS2$`Pr(>Chisq)`[1]
TABLE[i, 3] <- PRS2$`Pr(>Chisq)`[2]
  
#================================================================================================
  
i = 3
  
data2 <- PRS_3

TABLE [i, 1] <- "PRS 3"  
  
m1 <- mean (data2$SCORE1_AVG)
sd1 <- sd (data2$SCORE1_AVG)
data2$NORMSCORE <- (data2$SCORE1_AVG - m1) / sd1

model_PRS3_A <- lmer(mmse_score ~ age + gender_baseline_variable + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10 + NORMSCORE + Time + NORMSCORE:Time + (1 + Time | sid), data2, na.action = na.omit)
model_PRS3_B <-  lmer(mmse_score ~ age + gender_baseline_variable + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10 + NORMSCORE + Time + (1 + Time | sid), data2, na.action = na.omit)
PRS3 <- anova(model_PRS3_A, model_PRS3_A)

TABLE[i, 2] <- PRS3$`Pr(>Chisq)`[1]
TABLE[i, 3] <- PRS3$`Pr(>Chisq)`[2]

#=============================================================================================
  
i = 4

TABLE [i, 1] <- "PRS 4"

data2 <- PRS_4
  
m1 <- mean (data2$SCORE1_AVG)
sd1 <- sd (data2$SCORE1_AVG)
data2$NORMSCORE <- (data2$SCORE1_AVG - m1) / sd1

model_PRS4_A <- lmer(mmse_score ~ age + gender_baseline_variable + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10 + NORMSCORE + Time + NORMSCORE:Time + (1 + Time | sid), data2, na.action = na.omit)
model_PRS4_B <-  lmer(mmse_score ~ age + gender_baseline_variable + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10 + NORMSCORE + Time + (1 + Time | sid), data2, na.action = na.omit)
PRS4 <- anova(model_PRS4_A, model_PRS4_A)

TABLE[i, 2] <- PRS4$`Pr(>Chisq)`[1]
TABLE[i, 3] <- PRS4$`Pr(>Chisq)`[2]

#====================================================================================================
  
i = 5
  
data2 <- PRS_5

TABLE [i, 1] <- "PRS 5"

m1 <- mean (data2$SCORE1_AVG)
sd1 <- sd (data2$SCORE1_AVG)
data2$NORMSCORE <- (data2$SCORE1_AVG - m1) / sd1
  
model_PRS5_A <- lmer(mmse_score ~ age + gender_baseline_variable + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10 + NORMSCORE + Time + NORMSCORE:Time + (1 + Time | sid), data2, na.action = na.omit)
model_PRS5_B <-  lmer(mmse_score ~ age + gender_baseline_variable + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10 + NORMSCORE + Time + (1 + Time | sid), data2, na.action = na.omit)
PRS5 <- anova(model_PRS5_A, model_PRS5_A)

TABLE[i, 2] <- PRS5$`Pr(>Chisq)`[1]
TABLE[i, 3] <- PRS5$`Pr(>Chisq)`[2]

#===================================================================================================
  
i = 6

TABLE [i, 1] <- "PRS 6"

data2 <- PRS_6

m1 <- mean (data2$SCORE1_AVG)
sd1 <- sd (data2$SCORE1_AVG)
data2$NORMSCORE <- (data2$SCORE1_AVG - m1) / sd1
  
model_PRS6_A <- lmer(mmse_score ~ age + gender_baseline_variable + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10 + NORMSCORE + Time + NORMSCORE:Time + (1 + Time | sid), data2, na.action = na.omit)
model_PRS6_B <-  lmer(mmse_score ~ age + gender_baseline_variable + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10 + NORMSCORE + Time + (1 + Time | sid), data2, na.action = na.omit)
PRS6 <- anova(model_PRS6_A, model_PRS6_A)

TABLE[i, 2] <- PRS6$`Pr(>Chisq)`[1]
TABLE[i, 3] <- PRS6$`Pr(>Chisq)`[2]

#=====================================================================================================

i = 7
  
data2 <- PRS_7

TABLE [i, 1] <- "PRS 7"

m1 <- mean (data2$SCORE1_AVG)
sd1 <- sd (data2$SCORE1_AVG)
data2$NORMSCORE <- (data2$SCORE1_AVG - m1) / sd1
  
model_PRS7_A <- lmer(mmse_score ~ age + gender_baseline_variable + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10 + NORMSCORE + Time + NORMSCORE:Time + (1 + Time | sid), data2, na.action = na.omit)
model_PRS7_B <-  lmer(mmse_score ~ age + gender_baseline_variable + PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8 + PC9 + PC10 + NORMSCORE + Time + (1 + Time | sid), data2, na.action = na.omit)
PRS7 <- anova(model_PRS7_A, model_PRS7_A)

TABLE[i, 2] <- PRS7$`Pr(>Chisq)`[1]
TABLE[i, 3] <- PRS7$`Pr(>Chisq)`[2]
  
#=======================================================================================================

#TABLE$Bonferroni <- p.adjust(TABLE$P, method = "bonferroni", n = length(TABLE$P))
#TABLE$FDR <- p.adjust(TABLE$P, method = "fdr", n = length(TABLE$P))
#write.table (TABLE, file = paste0 ("PRS_Result_MMSE_APOE_1.txt"), sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)
write.table (TABLE, file = paste0 ("PRS_Result_MMSE_Non_APOE_1.txt"), sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)
