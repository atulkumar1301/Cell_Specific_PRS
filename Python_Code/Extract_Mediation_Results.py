#The code will extract the mediation results for each PRS and for each cell type
Cell_Type = ["Astrocytes", "Excitatory_neurons", "Inhibitory_neurons", "Microglial_cells", "Oligodendrocyte_precursor_cells", "Oligodendrocytes", "Original_PRS"]
for cell in Cell_Type:
    f_m = open("/Users/akumar/Library/CloudStorage/OneDrive-UniversityofEasternFinland/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217_adjusted_Abeta/Mediation/Non_APOE/" + cell + "/Mediation_Results_" + cell + "_Non_APOE.txt", 'w', 1)

    for i in range (1, 8):
        with open ("/Users/akumar/Library/CloudStorage/OneDrive-UniversityofEasternFinland/Work/Projects/Cell_Specific_PRSs/Full_Data/pTau217_adjusted_Abeta/Mediation/Non_APOE/" + cell + "/PRS_" + str(i) + "/Mediation_Result.txt", 'r') as myFile:
            f_m.write ("PRS " + str (i) + "\n")
            for line in myFile:
                f_m.write (line)
