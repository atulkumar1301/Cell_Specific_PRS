#Mixed Effect Regression
library(lme4)
library(data.table)
library(ggplot2)
library(RNOmni)
df <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cognitive_Decline/MMSE_Longi/Data_Cognitive_Decline_MMSE.txt")
ggplot(df) +
  aes(x = Time, y = mmse_score) +
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~sid)
lmem <- lmer (mmse_score ~ Time + (1 + Time| sid), df)
df_1 <- as.data.frame(coef (lmem)[[1]])
write.table (df_1, "/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cognitive_Decline/MMSE_Longi//MMSE_Slope.txt", sep = "\t", quote = FALSE, row.names = TRUE)
sink("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cognitive_Decline/MMSE_Longi//model_lmer_MMSE.txt")
print(summary(lmem))
sink()
