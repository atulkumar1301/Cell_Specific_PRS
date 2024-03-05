f_m = open("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cognitive_Decline/IID1_Count.txt", 'w')
l = []
with open ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cognitive_Decline/Data_Cognitive_Decline_mPACC_v2.txt", 'r') as myFile:
    line = myFile.readline ()
    for line in myFile:
        line_list = line.split ("\t")
        l.append (line_list[0])
u_list = set (l)
for i in u_list:
    c = l.count (i)
    f_m.write (i + "\t" + str (c) + "\n")
