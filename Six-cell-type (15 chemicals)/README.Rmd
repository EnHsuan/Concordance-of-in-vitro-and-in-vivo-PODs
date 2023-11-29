## Six-cell-type (15 chemicals)
  - POD database
    1) Convert oral in vivo PODs to steady state concentrations
       - Input files:
         - 15 chemicals orig POD.csv
         - All BBMD dose-response data files are in repository: BBMD input
    2) Generate Bayesian model averaging benchmark dose plots and compare with regulatory PODs
       - Input files:
         - Chemical list: 15 chemicals orig POD x Css.csv
         - Continuous dataset: dose-response_cont.csv
         - Dichotomous dataset: dose-response_dich.csv
         - All BBMD dose-response data files are in repository: BBMD input
       - Output file:
         - All plots in repository: dose-response plots (Supplementary Material File S2.pdf)
  - Input script:
    1) Analyze the most sensitive cell types from iPSC-Neurons, induced pluripotent stem cell (iPSC)-hepatocytes, iPSC-endothelial cell, iPSC-cardiomyocyte, human umbilical vein endothelial cell (HUVEC), and lymphoblastoid cell lines (LCLs)
       - Input file: cellline POD distribution for 15 chemicals.csv - original file in repository: POD database
       - Script: the most sensitive cell types histogram.R
       - Output file: the most sensitive cell types for 15 chemicals.pdf (Supplementary Fig. 1)
    2)  Correlation analysis of in vitro and in vivo PODs: 
        - Input files: (Reposirory: POD database)
          - in vivo POD data:
            - 15 chemicals orig POD x Css.csv
            - original POD x DAF x Css for 15 chemicals.csv
            - BMD x Css for 15 chemicals.csv
            - HED x Css for 15 chemicals.csv
          - in vitro POD data:
            - toxcast ac50.csv
            - cellline POD distribution for 15 chemicals.csv
        - Script: in vivo in vitro POD scatter plot 15 chemicals.Rmd
        - Output file: in vivo in vitro scatter plot for 15 chemicals.pdf (Supplementary Fig. 2)
    3) Meta-analysis of log10(in vitro POD/in vivo POD): 
        - Input files: (Reposirory: POD database)
          - in vivo POD data:
            - 15 chemicals orig POD x Css.csv
            - original POD x DAF x Css for 15 chemicals.csv
            - BMD x Css for 15 chemicals.csv
            - HED x Css for 15 chemicals.csv
          - in vitro POD data:
            - toxcast ac50.csv
            - cellline POD distribution for 15 chemicals.csv
        - Script: Meta analysis by ratio.Rmd
        - Output files:
          - meta-analysis in vitro vs reg POD animal.pdf
          - meta-analysis in vitro vs reg POD human.pdf
          - meta-analysis in vitro vs BMA BMD animal.pdf
          -  meta-analysis in vitro vs BMA BMD human.pdf (Manuscript Figure 3)
          - rma log10 ToxCast to in vivo ratio.txt (Manuscript Table 3)
          - rma log10 iPSCLCL to in vivo ratio.txt (Manuscript Table 3)
