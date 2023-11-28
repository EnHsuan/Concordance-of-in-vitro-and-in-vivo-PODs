cellline_httk <- read.csv(file.path("POD database","cellline POD distribution for 15 chemicals.csv"))
cellline_httk[is.na(cellline_httk)] <- 300
cellline <- data.frame(t(cellline_httk))
colnames(cellline) <- unlist(cellline[1, ])
cellline <- cellline[-1,]
mincell <- as.numeric(apply(cellline, 1, FUN=which.min))
mincell <- data.frame(mincell)
colnames(mincell) <- "whichmin"

mincell$cellline <- "Neurons"
mincell$cellline[mincell$whichmin==2] <- "HUVECs"
mincell$cellline[mincell$whichmin==3] <- "Hepatocytes"
mincell$cellline[mincell$whichmin==4] <- "Endothelial.cells"
mincell$cellline[mincell$whichmin==5] <- "Cardiomyocytes"
mincell$cellline[mincell$whichmin==6] <- "LCL"
table(mincell$cellline)
mincell.df <- data.frame(c("Neurons","HUVECs","Hepatocytes","Endothelial.cells",
                           "Cardiomyocytes","LCL"),
                         c(0,0,0,1,12,2))
colnames(mincell.df) <- c("Phenotypes","# of chemicals")

mincell.plot <- ggplot(mincell.df, aes(x=factor(Phenotypes,
                                                level=c("Neurons","HUVECs",
                                                        "Hepatocytes",
                                                        "Endothelial.cells",
                                                        "Cardiomyocytes",
                                                        "LCL")),
                                       y=`# of chemicals`))+
  geom_bar(stat = "identity",
           aes(fill=`# of chemicals`),show.legend =  FALSE)+
  geom_text(aes(label = `# of chemicals`), vjust = 0, size=5)+
  scale_x_discrete(labels=c("iPSC-Neu","HUVEC","iPSC-Hep","iPSC-Endo","iPSC-CM",
                            "LCL"))+
  xlab("Cell types")+
  theme_bw()+
  theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())
ggsave(mincell.plot, file="the most sensitive cell types for 15 chemicals.pdf", 
       width=8, height=6, scale=0.7)
