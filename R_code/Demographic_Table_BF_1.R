library(data.table)
df <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217_adjusted_Abeta/Data_ptau_217.txt")
table (df$Numeric)

df_CUI <- df [df$Numeric == "0"]
mean (df_CUI$Age)
sd(df_CUI$Age)
table (df_CUI$Gender)
mean (df_CUI$Education, na.rm = TRUE)
sd (df_CUI$Education, na.rm = TRUE)
table (df_CUI$E2)
table (df_CUI$E4)
table (df_CUI$A_Beta_Status)

df_MCI <- df [df$Numeric == "1"]
mean (df_MCI$Age)
sd(df_MCI$Age)
table (df_MCI$Gender)
mean (df_MCI$Education, na.rm = TRUE)
sd (df_MCI$Education, na.rm = TRUE)
table (df_MCI$E2)
table (df_MCI$E4)
table (df_MCI$A_Beta_Status)

df_AD <- df [df$Numeric == "4"]
mean (df_AD$Age)
sd(df_AD$Age)
table (df_AD$Gender)
mean (df_AD$Education, na.rm = TRUE)
sd (df_AD$Education, na.rm = TRUE)
table (df_AD$E2)
table (df_AD$E4)
table (df_AD$A_Beta_Status)


df_Non_AD <- df [df$Numeric == "2" | df$Numeric == "3"]
mean (df_Non_AD$Age)
sd(df_Non_AD$Age)
table (df_Non_AD$Gender)
mean (df_Non_AD$Education, na.rm = TRUE)
sd (df_Non_AD$Education, na.rm = TRUE)
table (df_Non_AD$E2)
table (df_Non_AD$E4)
table (df_Non_AD$A_Beta_Status)
