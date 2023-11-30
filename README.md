# In-vitro-and-In-vivo-PODs

## Six-cell-type (15 chemicals)
  ### - See details in README in "Six-cell-type (15 chemicals)" repository
  - POD database
    1) Convert oral in vivo PODs to steady state concentrations
    2) Generate Bayesian model averaging benchmark dose plots and compare with regulatory PODs
  - Concordance analyses:
    1) Analyze the most sensitive cell types from iPSC-Neurons, induced pluripotent stem cell (iPSC)-hepatocytes, iPSC-endothelial cell, iPSC-cardiomyocyte, human umbilical vein endothelial cell (HUVEC), and lymphoblastoid cell lines (LCLs)
    2) Correlation analysis of in vitro and in vivo PODs
    3) Meta-analysis of log10(in vitro POD/in vivo POD)

## Cardiomyocytes (41 chemicals)
  ### - See details in README in "Cardiomyocytes (41 chemicals)" repository
  - POD database
    1) Sample benchmark doses (BMDs) from Bayesian model averaging BMDs in animal doses
    2) Compute Bayesian model averaging BMDs in human doses
    3) Convert oral in vivo PODs to steady state concentrations
    4) Generate Bayesian model averaging benchmark dose plots and compare with regulatory PODs
    5) Derive ToxCast PODs
    7) Combine six-cell-type chemicals and cardiomyocyte chemicals
  - Concordance analyses:
    1) Correlation analysis of in vitro and in vivo PODs
    2) Meta-analysis of log10(in vitro POD/in vivo POD)

## Compare traditional in vivo PODs and NAM-based PODs from other studies
  ### - See details in README in "Comparisons for PaulFriedman Nicolas, ETAP" repository
  - Paul Friedman et al. (2020), Nicolas et al. (2022), and U.S. EPA Transcriptomic Assessment Product (ETAP)

## Examine accuracy and precision of concordance analyses from our research and other studies/database
  - Paul Friedman et al. (2020) study, Nicolas et al. (2022) study, ToxCast database, Six-cell-type assays, hiPSC=cardiomyocyte assays, and ETAP database
  - Input file: accuracy and precision table for all analyses.csv
  - Script: accuracy and precision plot for all analyses.R
  - Output file: accuracy precision rho bar plots for all analyses.pdf (Manuscript Figure 5)
