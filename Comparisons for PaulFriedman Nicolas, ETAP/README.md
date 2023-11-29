# Compare traditional in vivo PODs and NAM-based PODs from Paul Friedman et al. (2020), Nicolas et al. (2022), and U.S. EPA Transcriptomic Assessment Product (ETAP)

Correlation analysis and meta-analysis

- Input files:
  - Paul Friedman et al. (2020) study: Paul Friedman et al 2020 table S2.csv
  - Nicolas et al. (2022) study: Nicolas et al. 2022 HTTK_Output.csv
  - ETAP: ETAP_Table_4-2-MinTRV.csv
- Script: Comparisons for PaulFriedman Nicolas, ETAP.Rmd
- Output files:
  - Paul Friedman et al. (2020) study:  rma log10 Paul Friedman NAM to traditional POD ratio for all chemicals.txt
  - Nicolas et al. (2022) study: rma log10 Nicolas et al 2022 OED vs NOAEL.txt
  - ETAP: rma log10 ETAP TRV vs RfD for 21 chemicals.txt
