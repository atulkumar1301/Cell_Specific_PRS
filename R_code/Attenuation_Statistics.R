library(data.table)
TABLE<-as.data.frame(matrix(ncol=9, nrow=7))
names(TABLE)<-c("PRS Model", "t", "Degree_of_Freedom","P", "L95", "U95", "Mean_APOE", "Mean_Non_APOE", "SE")
df <- fread ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Manuscript/Stats/Attenuation_Statistics_Abeta.txt")
column_sequence = seq(2,14,2)
j <- 1
for (i in column_sequence) {
  diff <- t.test(df[[i]] ~ df[[i + 1]], data = df)
  r <- df [[2,i+1]]
  r_n <- r_n <- gsub ('APOE', '', r)
  TABLE[j, 1] <- r_n
  TABLE[j, 2] <- diff$statistic
  TABLE[j, 3] <- diff$parameter
  TABLE[j, 4] <- diff$p.value
  TABLE[j, 5] <- diff$conf.int [1]
  TABLE[j, 6] <- diff$conf.int [2]
  TABLE[j, 7] <- diff$estimate [1]
  TABLE[j, 8] <- diff$estimate [2]
  TABLE[j, 9] <- diff$stderr
  j <- j + 1
}
write.table (TABLE, (file = paste0 ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Manuscript/Stats/Results_Attenuation_Statistics_Abeta.txt")), sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)
