#This code will call Rscript with command line input
import subprocess
pwd = "/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/"
l = ["p_value_0.05.sscore", "p_value_0.005.sscore", "p_value_0.0005.sscore", "p_value_5e-05.sscore", "p_value_5e-06.sscore", "p_value_5e-07.sscore", "p_value_5e-08.sscore"]
prs = ["PRS_1", "PRS_2", "PRS_3", "PRS_4", "PRS_5", "PRS_6", "PRS_7", ]
for (g, p) in zip (l, prs):
    R_code = subprocess.call (["/Volumes/ATUL_6TB/Tools/R_Codes/Mediation.R", str(g), str(p)])
    print (g)
    print (p)
