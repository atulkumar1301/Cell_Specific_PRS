## R code for making flow chart
library (DiagrammeR)
DiagrammeR::grViz("digraph {
# initiate graph
graph [layout = dot, rankdir = TB]

# global node settings
node [shape = rectangle, style = filled, fillcolor = Linen]

# label nodes
Study_Participants [label = 'BioFINDER-1 \n CUI = 734, MCI = 235, AD = 97, non-AD = 227']
Genotypic_Data [label = 'QCed Genotypic Data']
Biomarkers [label =  'Fluid Biomarkers']
PRS [label = 'PRS caluclation using AD-GWAS']
AD_GWAS [label = 'AD-GWAS Summary Statistics \n (Bellenguez et al., 2022)']
single_cell_Data [label = 'Single-cell RNA sequencing data \n from MTG region \n available at the Allen Brain Atlas consortium']
Cell_specific_PRS [label= 'Cell-specific PRS calculation \n using \n sncRNA data']
proteomics_data [label= 'CSF proteomics data \n (Hansson et al., 2022)']
Cell_specific_CSF_protein_score [label= 'Cell-specific CSF Protein Score \n using \n CSF proteomics data']
statistical_analysis [label= 'Statistical Analyses \n PRS-Biomarker Association analysis']

# edge definitions with the node IDs
Study_Participants  -> Genotypic_Data -> PRS -> Cell_specific_PRS -> statistical_analysis
Study_Participants  -> Biomarkers -> statistical_analysis
AD_GWAS -> PRS
single_cell_Data -> Cell_specific_PRS
single_cell_Data -> Cell_specific_CSF_protein_score
proteomics_data -> Cell_specific_CSF_protein_score -> statistical_analysis
}")
