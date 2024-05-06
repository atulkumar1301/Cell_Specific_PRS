library(data.table)
df <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/BF_2/CSF_pTau217/Data.txt")
table (df$Diagnosis)

df_CUI <- df [df$Diagnosis == "0"]
mean (df_CUI$Age)
sd(df_CUI$Age)
table (df_CUI$Gender)
mean (df_CUI$education_level_years_baseline_variable, na.rm = TRUE)
sd (df_CUI$education_level_years_baseline_variable, na.rm = TRUE)
table (df_CUI$E2)
table (df_CUI$E4)
table (df_CUI$Abnormal_CSF_Ab42_Ab40_Ratio)

df_MCI <- df [df$Diagnosis == "2"]
mean (df_MCI$Age)
sd(df_MCI$Age)
table (df_MCI$Gender)
mean (df_MCI$education_level_years_baseline_variable, na.rm = TRUE)
sd (df_MCI$education_level_years_baseline_variable, na.rm = TRUE)
table (df_MCI$E2)
table (df_MCI$E4)
table (df_MCI$Abnormal_CSF_Ab42_Ab40_Ratio)

df_AD <- df [df$Diagnosis == "1"]
mean (df_AD$Age)
sd(df_AD$Age)
table (df_AD$Gender)
mean (df_AD$education_level_years_baseline_variable, na.rm = TRUE)
sd (df_AD$education_level_years_baseline_variable, na.rm = TRUE)
table (df_AD$E2)
table (df_AD$E4)
table (df_AD$Abnormal_CSF_Ab42_Ab40_Ratio)


df_Non_AD <- df [df$Diagnosis == "3"]
mean (df_Non_AD$Age)
sd(df_Non_AD$Age)
table (df_Non_AD$Gender)
mean (df_Non_AD$education_level_years_baseline_variable, na.rm = TRUE)
sd (df_Non_AD$education_level_years_baseline_variable, na.rm = TRUE)
table (df_Non_AD$E2)
table (df_Non_AD$E4)
table (df_Non_AD$Abnormal_CSF_Ab42_Ab40_Ratio)
