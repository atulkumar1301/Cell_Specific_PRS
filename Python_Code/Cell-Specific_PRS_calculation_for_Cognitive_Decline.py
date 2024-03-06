#This code is a pipeline for Cell-Specific PRS calculation for continuous Variable
import subprocess
import os
Cell_Type = ["Astrocytes", "Excitatory_neurons", "Inhibitory_neurons", "Microglial_cells", "Oligodendrocyte_precursor_cells", "Oligodendrocytes", "Original_PRS"]
plink2 = "/Volumes/ATUL_6TB/Tools/./plink2"
plink = "/Volumes/ATUL_6TB/Tools/plink_mac_20221210/./plink"
base_file = "/Volumes/ATUL_6TB/Data/Genetic_Data/BioFINDER_1/GRch38/BioFINDER-1_GWAS_Data_GRCh38"
GWAS_Summary = "/Volumes/ATUL_6TB/Data/GWAS_Summary_Statistics/AD_GWAS_Bellenguez_2022.txt"
pwd = "/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cognitive_Decline/MMSE_Longi/"
f_n = "MMSE_Slope.txt"

##Extracting the Sample ID
print ("Id Extraction Started")
Out_File = open ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cognitive_Decline/MMSE_Longi/Keep_Patient.txt", 'w', 1)
with open ("/Volumes/ATUL_6TB/Work/Projects/Cell_Specific_PRSs/Full_Data/Cognitive_Decline/MMSE_Longi/" + f_n, 'r') as datafile:
    IDs = datafile.readline ()
    IDs_Split = IDs.split ("\t")
    Out_File.write (str (IDs_Split [0]) + "\t" + str (IDs_Split [1]) + "\n")
    for IDs in datafile:
        IDs_Split = IDs.split ("\t")
        Out_File.write (str (IDs_Split [0]) + "\t" + str (IDs_Split [1]) + "\n")
print ("Id Extraction finished")

print ("Extracting GWAS data for Sample")
subprocess.run ([plink2, "--pfile", base_file, "--keep", "Keep_Patient.txt", "--maf", "0.05", "--allow-extra-chr", "--make-bed", "--out", "9_QC_GWAS_data"], cwd = pwd)
print ("Extraction of GWAS data for Sample Complete")

print ("Calculating the PCA of genetic Data")
subprocess.run ([plink2, "--bfile", "9_QC_GWAS_data", "--allow-extra-chr", "--pca", "--out", "PCA_FILE"], cwd = pwd)
print ("Calculation of the PCA of genetic Data Complete")

print ("Started the Clumping")
subprocess.run ([plink2, "--bfile", "9_QC_GWAS_data", "--allow-extra-chr", "--clump", GWAS_Summary, "--clump-kb", "1000", "--clump-p1", "1", "--clump-p2", "1", "--clump-r2", "0.1", "--out", "Clumped_File"], cwd = pwd)
print ("Finished Clumping")

print ("Calling R for making Pre PRS File")
subprocess.call ("/Volumes/ATUL_6TB/Tools/R_Codes/PRS.R", cwd = pwd)
print ("Generation of Pre PRS File Complete")

for cell in Cell_Type:
    if cell == "Original_PRS":
        print ("Started Generating Score file")
        path = pwd + cell + "/"
        C_Main = os.path.exists (path)
        if not C_Main:
            os.mkdir (path)
        APOE = path + "APOE"
        C_1 = os.path.exists (APOE)
        if not C_1:
            os.mkdir (APOE)
        Non_APOE = path + "Non_APOE"
        C_2 = os.path.exists (Non_APOE)
        if not C_2:
            os.mkdir (Non_APOE)
        f_m = open (path + "SNP_Extract.txt", 'w', 1)
        with open (pwd + "Pre_PRS.txt", 'r') as myFile:
            line = myFile.readline ()
            for line in myFile:
                line_list = line.split("\t")
                f_m.write (str (line_list [2]) + "\n")
        SNP_Extract = path + "SNP_Extract.txt"
        out_file = path + "10_QC_GWAS_data"
        subprocess.run ([plink2, "--bfile", "9_QC_GWAS_data", "--extract", SNP_Extract, "--allow-extra-chr", "--make-pgen", "--out", out_file], cwd = pwd)
        l = [0.05, 0.005, 0.0005, 0.00005, 0.000005, 0.0000005, 0.00000005]
        f_m_1 = open(path + "APOE_Region_SNPs.txt", 'w', 1)
        with open (pwd + "Pre_PRS.txt", 'r') as myFile_1:
            line_1 = myFile_1.readline ()
            f_m_1.write (line_1)
            for line_1 in myFile_1:
                line_list_1 = line_1.split ("\t")
                if int (line_list_1 [0]) == 19:
                    if ((int (line_list_1 [1]) > 43905790) and (int (line_list_1 [1]) < 45909394)):
                        f_m_1.write (line_1)

### Including APOE Region Variant
        for i in l:
            f_m_2 = open(APOE + "/p_value_" + str (i) + ".txt", 'w', 1)
            with open (pwd + "Pre_PRS.txt") as myFile_2:
                line_2 = myFile_2.readline ()
                for line_2 in myFile_2:
                    line_list_2 = line_2.split ("\t")
                    if float (line_list_2 [5]) <= i:
                        f_m_2.write (line_list_2 [2] + "\t" + str(line_list_2 [3]).upper()+ "\t" + line_list_2 [4] + "\n")
        for i in l:
            f_i = APOE + "/p_value_" + str(i) + ".txt"
            f_o = APOE + "/p_value_" + str(i)
            subprocess.run ([plink2, "--pfile", "10_QC_GWAS_data", "--score", f_i, "--allow-extra-chr", "--out", f_o], cwd = path)
        R_code = subprocess.call (["/Volumes/ATUL_6TB/Tools/R_Codes/PRS_Linear.R", str(f_n)], cwd = APOE)

### Excluding APOE Region Variant
        for i in l:
            f_m_3 = open(Non_APOE + "/p_value_" + str (i) + ".txt", 'w', 1)
            with open (pwd + "Pre_PRS.txt") as myFile_3:
                line_3 = myFile_3.readline ()
                for line_3 in myFile_3:
                    line_list_3 = line_3.split ("\t")
                    if int (line_list_3 [0]) == 19:
                        if ((int (line_list_3 [1]) > 43905790) and (int (line_list_3 [1]) < 45909394)):
                            print ("PASS")
                        elif float (line_list_3 [5]) <= i:
                            f_m_3.write (line_list_3 [2] + "\t" + line_list_3 [3] + "\t" + line_list_3 [4] + "\n")
                    elif float (line_list_3 [5]) <= i:
                        f_m_3.write (line_list_3 [2] + "\t" + str(line_list_3 [3]).upper()+ "\t" + line_list_3 [4] + "\n")
        for i in l:
            f_i = Non_APOE+ "/p_value_" + str(i) + ".txt"
            f_o = Non_APOE + "/p_value_" + str(i)
            subprocess.run ([plink2, "--pfile", "10_QC_GWAS_data", "--score", f_i, "--allow-extra-chr", "--out", f_o], cwd = path)
        R_code = subprocess.call (["/Volumes/ATUL_6TB/Tools/R_Codes/PRS_Logistic_Non_APOE.R", str(f_n)], cwd = Non_APOE)
        print ("Finished Generating Score file")

    else:
        print ("Started calculating Cell Specific PRSs")
        path = pwd + cell + "/"
        C_Main = os.path.exists (path)
        if not C_Main:
            os.mkdir (path)
        Cell_Specific = open(path + cell + "_Specific_PRS.txt", 'w', 1)
        Error_1 = open (path + "Error_1.txt", 'w', 1)
        Error_2 = open (path + "Error_2.txt", 'w', 1)
        with open (pwd + "Pre_PRS.txt", 'r') as PRSFile:
            SNPs = PRSFile.readline ()
            Cell_Specific.write (SNPs.rstrip() + "\t" + "NEW BETA" + "\t" + "GENE" + "\t" + "nTPM" + "\t" + "Distance" + "\t" + "Location" + "\t" + "nTPM Scaled" + "\n")
            for SNPs in PRSFile:
                SNPs_list = SNPs.split("\t")
                print ("Starting SNP: ", SNPs_list[2])
                l = []
                b = []
                g = []
                nT = []
                distance = []
                loc = []
                Scaled_nTPN = []
                with open ("/Volumes/ATUL_6TB/Data/RNA_single_cell_type_data/MTG_10x_Allen_Brain_Atlas/" + cell + ".txt", 'r') as CellFile:
                    c = 0
                    cell_score = CellFile.readline ()
                    for cell_score in CellFile:
                        cell_list = cell_score.split("\t")
                        try:
                            if SNPs_list [0] == cell_list [6]:
                                dis_up = int (SNPs_list [1]) - int (cell_list [7])
                                dis_down = int (cell_list [8]) - int (SNPs_list [1])
                                if ((abs(dis_up) <= 1000000) or (abs(dis_down) <= 1000000)):
                                    p = int (cell_list [7])
                                    q = int (cell_list [8]) + 1
                                    r = 1000000 - int (cell_list [7])
                                    s = 1000001 + int (cell_list [8])
                                    set_within = range (p, q)
                                    set_up = range (r, p+1)
                                    set_down = range (q-1, s)
                                    if dis_up > 0 and dis_down > 0:
                                        if int(SNPs_list [1]) in set_within:
                                            try:
                                                if float ((cell_list[5])) > 0: # Cell Score Cutoff
                                                    n_b = (float (SNPs_list [4])) * (float (cell_list[5]))
                                                    b.append (n_b)
                                                    l.append (SNPs.rstrip())
                                                    g.append (cell_list[1])
                                                    nT.append (cell_list[3])
                                                    Scaled_nTPN.append (cell_list[5])
                                                    distance.append (0)
                                                    loc.append ("Within")
                                                    c = c + 1
                                            except:
                                                print ("n_b is NA")
                                    elif dis_up < 0:
                                        if int (SNPs_list [1]) in set_up:
                                            try:
                                                if float ((cell_list[5])) > 0: # Cell Score Cutoff
                                                    n_b = (float (SNPs_list [4])) * (float (cell_list[5]))
                                                    b.append (n_b)
                                                    l.append (SNPs.rstrip())
                                                    g.append (cell_list[1])
                                                    nT.append (cell_list[3])
                                                    Scaled_nTPN.append (cell_list[5])
                                                    distance.append (int (cell_list [7]) - int (SNPs_list [1]))
                                                    loc.append ("Upstream")
                                                    c = c + 1
                                            except:
                                                print ("n_b is NA")
                                    elif dis_down < 0:
                                        if int (SNPs_list [1]) in set_down:
                                            try:
                                                if float ((cell_list[5])) > 0: # Cell Score Cutoff
                                                    n_b = (float (SNPs_list [4])) * (float (cell_list[5]))
                                                    b.append (n_b)
                                                    l.append (SNPs.rstrip())
                                                    g.append (cell_list[1])
                                                    nT.append (cell_list[3])
                                                    Scaled_nTPN.append (cell_list[5])
                                                    distance.append (int (SNPs_list [1]) - int (cell_list [8]))
                                                    loc.append ("Downstream")
                                                    c = c + 1
                                            except:
                                                print ("n_b is NA")
                        except:
                            print ("Chr Value is missing")
                    try:
                        d_min = distance.index(min(distance))
                        Cell_Specific.write (str(l[d_min]) + "\t" + str (b[d_min]) + "\t" + str (g[d_min]) + "\t" + str (nT[d_min]) + "\t" + str(distance[d_min]) + "\t" + str (loc [d_min]) + "\t" + str (Scaled_nTPN [d_min]) + "\n")
                    except:
                        Error_1.write (str (SNPs_list[2]) + "\n")
        print ("Finished calculating Cell Specific PRSs")

        ### Formatting cell Specific File
        Cell_Specific_1 = open(path + cell + "_PRS.txt", 'w', 1)
        Cell_Specific_1.write ("CHR.y" + "\t" + "POS" + "\t" + "SNP" + "\t" + "Effect_Allele" + "\t" + "Beta" + "\t" + "P.y" + "\n")
        with open (path + cell + "_Specific_PRS.txt", 'r') as PRSFile_1:
            SNPs_1 = PRSFile_1.readline ()
            for SNPs_1 in PRSFile_1:
                SNPs_list_1 = SNPs_1.split("\t")
                Cell_Specific_1.write (str(SNPs_list_1 [0]) + "\t" + str(SNPs_list_1 [1]) + "\t" + str(SNPs_list_1 [2]) + "\t" + str(SNPs_list_1 [3]) + "\t" + str(SNPs_list_1 [6]) + "\t" + str(SNPs_list_1 [5]) + "\n")

        print ("Started Generating Score file")
        APOE = path + "APOE"
        C_1 = os.path.exists (APOE)
        if not C_1:
            os.mkdir (APOE)
        Non_APOE = path + "Non_APOE"
        C_2 = os.path.exists (Non_APOE)
        if not C_2:
            os.mkdir (Non_APOE)
        f_m = open (path + "SNP_Extract.txt", 'w', 1)
        with open (path + cell + "_PRS.txt", 'r') as myFile:
            line = myFile.readline ()
            for line in myFile:
                line_list = line.split("\t")
                f_m.write (str (line_list [2]) + "\n")
        SNP_Extract = path + "SNP_Extract.txt"
        out_file = path + "10_QC_GWAS_data"
        subprocess.run ([plink2, "--bfile", "9_QC_GWAS_data", "--extract", SNP_Extract, "--allow-extra-chr", "--make-pgen", "--out", out_file], cwd = pwd)
        l = [0.05, 0.005, 0.0005, 0.00005, 0.000005, 0.0000005, 0.00000005]
        f_m_1 = open(path + "APOE_Region_SNPs.txt", 'w', 1)
        with open (path + cell + "_PRS.txt", 'r') as myFile_1:
            line_1 = myFile_1.readline ()
            f_m_1.write (line_1)
            for line_1 in myFile_1:
                line_list_1 = line_1.split ("\t")
                if int (line_list_1 [0]) == 19:
                   if ((int (line_list_1 [1]) > 43905790) and (int (line_list_1 [1]) < 45909394)):
                       f_m_1.write (line_1)
### Including APOE Region Variant
        for i in l:
            f_m_2 = open(APOE + "/p_value_" + str (i) + ".txt", 'w', 1)
            with open (path + cell + "_PRS.txt") as myFile_2:
                line_2 = myFile_2.readline ()
                for line_2 in myFile_2:
                    line_list_2 = line_2.split ("\t")
                    if float (line_list_2 [5]) <= i:
                        f_m_2.write (line_list_2 [2] + "\t" + str(line_list_2 [3]).upper()+ "\t" + line_list_2 [4] + "\n")
        for i in l:
            f_i = APOE + "/p_value_" + str(i) + ".txt"
            f_o = APOE + "/p_value_" + str(i)
            subprocess.run ([plink2, "--pfile", "10_QC_GWAS_data", "--score", f_i, "--allow-extra-chr", "--out", f_o], cwd = path)
        R_code = subprocess.call (["/Volumes/ATUL_6TB/Tools/R_Codes/PRS_Linear.R", str(f_n)], cwd = APOE)
### Excluding APOE Region Variant
        for i in l:
            f_m_3 = open(Non_APOE + "/p_value_" + str (i) + ".txt", 'w', 1)
            with open (path + cell + "_PRS.txt") as myFile_3:
                line_3 = myFile_3.readline ()
                for line_3 in myFile_3:
                    line_list_3 = line_3.split ("\t")
                    if int (line_list_3 [0]) == 19:
                        if ((int (line_list_3 [1]) > 43905790) and (int (line_list_3 [1]) < 45909394)):
                            print ("PASS")
                        elif float (line_list_3 [5]) <= i:
                            f_m_3.write (line_list_3 [2] + "\t" + line_list_3 [3] + "\t" + line_list_3 [4] + "\n")
                    elif float (line_list_3 [5]) <= i:
                        f_m_3.write (line_list_3 [2] + "\t" + str(line_list_3 [3]).upper()+ "\t" + line_list_3 [4] + "\n")
        for i in l:
            f_i = Non_APOE+ "/p_value_" + str(i) + ".txt"
            f_o = Non_APOE + "/p_value_" + str(i)
            subprocess.run ([plink2, "--pfile", "10_QC_GWAS_data", "--score", f_i, "--allow-extra-chr", "--out", f_o], cwd = path)
        R_code = subprocess.call (["/Volumes/ATUL_6TB/Tools/R_Codes/PRS_Linear_Non_APOE.R", str(f_n)], cwd = Non_APOE)
