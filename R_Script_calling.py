#This code will call Rscript with command line input
import subprocess
#f_m = open ("/Volumes/ATUL_6TB/Work/Projects/Emma_Project/BF-1/Olink_2/WMH/LST/Result.txt", 'w', 1)
#f_m.write("Biomarker" + "\t" + "Effect" + "\t" + "OR_Gene" + "\t" + "SE" + "\t" + "P" + "\t" + "R2" + "\t" + "AUC" + "\t" + "L95" + "\t" + "U95" + "\t" + "AIC" + "\t" + "BIC" + "\n")
pwd = "/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/"
l = ["p_value_0.05.sscore", "p_value_0.005.sscore", "p_value_0.0005.sscore", "p_value_5e-05.sscore", "p_value_5e-06.sscore", "p_value_5e-07.sscore", "p_value_5e-08.sscore"]
prs = ["PRS_1", "PRS_2", "PRS_3", "PRS_4", "PRS_5", "PRS_6", "PRS_7", ]
# with open ("/Volumes/ATUL_6TB/Work/Projects/Joana_Project/PD_vs_CU/DDC_Validation_BF_1/File_Name.txt", 'r') as genefile:
#     for g_line in genefile:
#         g_line_list = g_line.split ("\t")
#         #g_line_list = g_line.rstrip ()
#         l.append (g_line_list [0].rstrip())
for (g, p) in zip (l, prs):
#for (g) in zip (l):
    #print (g)
    #f_n = g.split (".")
    R_code = subprocess.call (["/Volumes/ATUL_6TB/Tools/R_Codes/Mediation.R", str(g), str(p)])
    #R_code = subprocess.call (["/Volumes/ATUL_6TB/Tools/R_Codes/Mediation.R", str(g)])
    print (g)
    print (p)
# for g in l:
#     try:
#         with open ("/Volumes/ATUL_6TB/Work/Projects/Emma_Project/Infracts/Result_New/" + str (g), 'r') as colo_file:
#             colo_file.readline()
#             for line in colo_file:
#                 f_m.write (line)
#     except:
#         print ("File Missing", g)
#         f_m.write (str(g) + "\n")
