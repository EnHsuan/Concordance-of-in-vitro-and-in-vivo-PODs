df <- read.csv("accuracy and precision table for all analyses.csv")

library(ggplot2)
library(ggpubr)

#accuracy
accuracy.bar <- ggplot(df, aes(x=PODratio, y=Analysis, fill=PODratio.CI.cross.1, color=PODratio.CI.cross.1))+
  geom_bar(stat="identity")+
  theme_bw()+
  theme(axis.title.y = element_blank(), axis.text.y = element_text(size=10), 
        axis.title.x = element_text(size=12), axis.text.x = element_text(size=10), 
        legend.position = "top", legend.title = element_blank(), legend.key.size = unit(3, 'mm'),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  scale_x_log10(limits=c(0.01,100), 
                breaks=c(0.01,0.1,1,10,100),
                labels=c(0.01,0.1,1,10,100))+
  scale_y_discrete(limits=rev(c("Paul Friedman et al., 2020 (n=448)","Nicolas et al., 2022 (n=522)","ToxCast (n=15)",
                                "ToxCast (n=41)","Six-cell-type assays (n=15)","Cardiomyocyte assays (n=41)","ETAP (n=21)")))+
  annotation_logticks(sides="b")+
  xlab("NAM-based POD/In vivo POD ratio")+
  geom_vline(xintercept = 1, linetype="solid")+
  scale_fill_manual(values = c(`Y`="white",`N`="grey35"), labels=c("Y"="CI includes 1","N"="CI excludes 1"))+
  scale_color_manual(values = c(`Y`="black",`N`="grey35"), labels=c("Y"="CI includes 1","N"="CI excludes 1"))
print(accuracy.bar)

#precision  
precision.bar <- ggplot()+
  geom_bar(data=df, aes(x=precision.lower.bound, y=Analysis, color="invitropod", fill="invitropod"), stat="identity")+
  geom_bar(data=df, aes(x=precision.upper.bound, y=Analysis, color="invitropod", fill="invitropod"), stat="identity")+
  #geom_bar(data=df, aes(x=min.in.vivo_median.in.vivo, y=Analysis, color="invivopod", fill="invivopod"), stat="identity")+
  #geom_bar(data=df, aes(x=max.in.vivo_median.in.vivo, y=Analysis, color="invivopod", fill="invivopod"), stat="identity")+
  theme_bw()+
  theme(axis.title.y = element_blank(), axis.text.y = element_blank(), 
        axis.title.x = element_text(size=12), axis.text.x = element_text(size=10), 
        legend.position = "top", legend.title = element_blank(), legend.key.size = unit(3, 'mm'),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
  scale_x_log10(limits=c(0.0009,1010), 
                breaks=c(0.001,0.01,0.1,1,10,100,1000),
                labels=c(0.001,0.01,0.1,1,10,100,1000))+
  scale_y_discrete(limits=rev(c("Paul Friedman et al., 2020 (n=448)","Nicolas et al., 2022 (n=522)","ToxCast (n=15)",
                                "ToxCast (n=41)","Six-cell-type assays (n=15)","Cardiomyocyte assays (n=41)","ETAP (n=21)")))+
  annotation_logticks(sides="b")+
  xlab("Prediction interval width")+
  geom_vline(xintercept = 1, linetype="solid")+
  scale_fill_manual(name="legend", values=c(`invitropod`="grey35"),
                    labels=c("invitropod"="NAM-based POD/In vivo POD ratio"))+
  scale_color_manual(name="legend", values=c(`invitropod`="grey35"),
                     labels=c("invitropod"="NAM-based POD/In vivo POD ratio"))
print(precision.bar)

rho.bar <- ggplot(df, aes(x=rho, y=Analysis, color="corr", fill="corr"))+
  geom_bar(stat="identity")+
  theme_bw()+
  theme(axis.title.y = element_blank(), axis.text.y = element_blank(), 
        axis.title.x = element_text(size=12), axis.text.x = element_text(size=10), 
        legend.position = "top",  legend.title = element_blank(), legend.key.size = unit(3, 'mm'),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
  scale_x_continuous(limits = c(0,1), breaks = c(0,0.5,1), labels = c(0,0.5,1))+
  scale_y_discrete(limits=rev(c("Paul Friedman et al., 2020 (n=448)","Nicolas et al., 2022 (n=522)","ToxCast (n=15)",
                                "ToxCast (n=41)","Six-cell-type assays (n=15)","Cardiomyocyte assays (n=41)","ETAP (n=21)")))+
  xlab(bquote(rho))+
  geom_vline(xintercept = 0, linetype="solid")+
  scale_fill_manual(name="legend", values=c(`corr`="grey35"), labels=c("corr"="Rank correlation of NAM-based and in vivo POD"))+
  scale_color_manual(name="legend", values=c(`corr`="grey35"), labels=c("corr"="Rank correlation of NAM-based and in vivo POD"))
print(rho.bar)

plots <- ggarrange(accuracy.bar, precision.bar, rho.bar, ncol = 3, labels=c("A","B","C"),
                   widths = c(1.35/3,0.825/3,0.825/3))
ggsave(plots, file="accuracy precision rho bar plots for all analyses.pdf", width=18, height=6, scale=0.7)
