# Cardiomyocytes (41 chemicals)

  - ## POD database
    1) Sample benchmark doses (BMDs) from Bayesian model averaging BMDs in animal doses
       - Input files:
         - All BBMD dose-response data files are in repository: BBMD data input
       - Script: BBMD.Rmd
    2) Compute Bayesian model averaging BMDs in human doses
       - Input files:
         - All BBMD dose-response data files are in repository: BBMD data input
       - Script: HED.Rmd
    3) Convert oral in vivo PODs to steady state concentrations
       - Input files:
         - traditional in vivo PODs.csv
         - BBMD for cardio 26 chemicals.csv
         - HED for cardio 26 chemicals.csv
       - Script: in vivo POD x Css.Rmd
    4) Generate Bayesian model averaging benchmark dose plots and compare with regulatory PODs
       - Input files:
         - Chemical list: 15 chemicals orig POD x Css.csv
         - Continuous dataset: dose-response_cont.csv
         - Dichotomous dataset: dose-response_dich.csv
         - All BBMD dose-response data files are in repository: BBMD input
       - Script: dose-response data for 26 chemicals.Rmd
       - Output file:
         - All plots in repository: BBMD dose-response plot (Supplementary Material File S2.pdf)
    5) Derive ToxCast PODs
       - Input files in repository: ToxCast AC50
       - Script: toxcast PODs.R
       - Output file: ToxCast AC50 5perc and med.csv
    7) Combine six-cell-type chemicals and cardiomyocyte chemicals
       - Input files:
         - #### six-cell-type chemicals (15) - Repository: 15 ATSDR chemicals PODs
           - 15 chemicals orig POD x Css.csv
           - original POD x DAF x Css for 15 chemicals.csv
           - BMD x Css for 15 chemicals.csv
           - HED x Css for 15 chemicals.csv
           - toxcast 5perc for 15 chemicals.csv
           - 15 chemicals Cardio PODs.csv
         - #### cardiomyocyte chemicals (26)
           - 26 cardio chemicals orig POD x Css.csv
           - 26 cardio chemicals original POD x DAF x Css.csv
           - 26 cardio chemicals BBMD x Css.csv
           - 26 cardio chemicals HED x Css.csv           - 
           - ToxCast AC50 5perc and med.csv
           - 26 chemicals Cardio PODs.csv         
       - Script: combine 15+26 chemicals.R
  - ## Compare regulatory in vivo PODs in animal doses and Bayesian model averaging benchmark doses
    - Input files: (Repository: POD database)
      - original POD x Css for 41 chemicals.csv
      - BBMD x Css for 41 chemicals.csv
    - Script: traditional POD vs BBMD plots.R
    - Output file: regulatory PODa vs BMA BMDa plots.pdf
  - ## Concordance analyses:
    1) Correlation analysis of in vitro and in vivo PODs
        - Input files: (Repository: POD database)
          - #### in vivo POD data:
            - original POD x Css for 41 chemicals.csv
            - original POD x DAF x Css for 41 chemicals.csv
            - BBMD x Css for 41 chemicals.csv
            - HED x Css for 41 chemicals.csv
          - #### in vitro POD data:
            - 41 chemicals toxcast POD.csv
            - 41 chemicals cardio 5 donors POD.csv
        - Script: in vivo in vitro POD scatter plot 41 chemicals (5 donors cardio).Rmd
        - Output file: in vivo in vitro scatter plot for 41 chemicals (5 donors cardio).pdf (Supplementary Fig. 6)
    2) Meta-analysis of log10(in vitro POD/in vivo POD)
        - Input files: (Repository: POD database)
          - #### in vivo POD data:
            - original POD x Css for 41 chemicals.csv
            - original POD x DAF x Css for 41 chemicals.csv
            - BBMD x Css for 41 chemicals.csv
            - HED x Css for 41 chemicals.csv
          - #### in vitro POD data:
            - 41 chemicals toxcast POD.csv
            - 41 chemicals cardio 5 donors POD.csv
        - Script: Meta analysis by ratio for cardiomyocytes (5 donors cardio).Rmd
        - Output files:
          - meta-analysis in vitro vs reg POD animal for 41 chemicals (5 donors cardio).pdf (Supplementary Fig. 7)
          - meta-analysis in vitro vs reg POD human for 41 chemicals (5 donors cardio).pdf (Supplementary Fig. 8)
          - meta-analysis in vitro vs BMA BMD animal for 41 chemicals (5 donors cardio).pdf (Supplementary Fig. 9)
          - meta-analysis in vitro vs BMA BMD human for 41 chemicals (5 donors cardio).pdf (Manuscript Figure 4)
          - rma log10 ToxCast to in vivo ratio for 41 chemicals (5 donors cardio).txt (Manuscript Table 4)
          - rma log10 Cardiomyocytes to in vivo ratio for 41 chemicals (5 donors cardio).txt (Manuscript Table 4)
