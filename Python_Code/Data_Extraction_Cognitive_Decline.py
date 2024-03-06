f_m = open("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cognitive_Decline/MMSE_Longi/Data_Cognitive_Decline_MMSE.txt", 'w', 1)
with open ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cognitive_Decline/IID_Count.txt", 'r') as IDFile:
           iD = IDFile.readline ()
           for iD in IDFile:
               iD_list = iD.split("\t")
               with open ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cognitive_Decline/MMSE_Longi/Data_Cognitive_Decline_MMSE_1.txt", 'r') as myFile:
                  c = 0
                  line = myFile.readline ()
                  for line in myFile:
                      line_list = line.split("\t")
                      if (iD_list [1] == line_list [0]):
                          f_m.write (iD.rstrip ()+ "\t" + line)
