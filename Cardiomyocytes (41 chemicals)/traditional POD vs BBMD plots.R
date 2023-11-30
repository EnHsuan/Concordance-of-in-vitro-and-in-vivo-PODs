library(readr)
library(dplyr)
library(ggplot2)
library(ggpubr)

origpod <- read.csv(file.path("POD database","original POD x Css for 41 chemicals.csv"))
bbmd <- read.csv(file.path("POD database","BBMD x Css for 41 chemicals.csv"))

bind <- full_join(origpod, bbmd, by="Chemical")
wt <- 1/(log10(bind$X95.)-log10(bind$X5.))^2
r2 <- round(summary(lm(log10(X50.) ~ log10(value), data=bind, weights=wt))$r.squared, digits=3)

sca <- ggplot()+
  geom_point(data=bind, aes(x=value, y=X50.,shape=POD), size=4)+
  geom_point(data=bind_15, aes(x=value, y=X50.,shape=POD, color="#CC6677"), size=4)+
  geom_errorbar(data=bind, aes(x=value, ymin=X5., ymax=X95.))+
  geom_errorbar(data=bind_15, aes(x=value, ymin=X5., ymax=X95., color="#CC6677"))+
  scale_shape_manual(values = c("LOAEL"=15, "NOAEL"=17, "BMDL"=19, "LED05"=18))+
  geom_abline(intercept = 0, slope = 1)+
  scale_x_log10(limits=c(5e-6, 5e+3),
                breaks = scales::trans_breaks("log10", function(x) 10^x),
                labels = scales::trans_format("log10", scales::math_format(10^.x)))+
  scale_y_log10(limits=c(5e-6, 5e+3),
                breaks = scales::trans_breaks("log10", function(x) 10^x),
                labels = scales::trans_format("log10", scales::math_format(10^.x)))+
  xlab(bquote(Reg~POD[a]))+ylab(bquote(BMA~BMD[a]))+
  theme_bw()+
  annotation_logticks(sides="lb")+
  annotate("text", label=paste0("R^2 ==", r2, "~\n p < 0.01"), parse = TRUE, 
           x=5e-4, y=1e+3)+
  theme(legend.position="top", panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
  guides(color = "none")
print(sca)

bind$ratio <- log10(bind$value/bind$X50.)
hist <- ggplot()+
  geom_histogram(data=bind, aes(x=ratio))+
  geom_histogram(data=bind_15, aes(x=ratio, color="#CC6677", fill="#CC6677"))+
  theme_bw()+
  geom_vline(xintercept=0, color="black", linetype="dashed")+
  xlab(bquote(log[10](Reg~POD[a]/BMA~BMD[a])))+
  theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
  guides(fill = "none", color="none")
print(hist)

plot <- ggarrange(sca, hist, nrow=2, ncol=1, align="v", heights=c(1.1,1))

combine.plot <- ggarrange(plot_15, plot, labels = c("A","B"), nrow=1, ncol=2)
ggsave(plot, file="regulatory PODa vs BMA BMDa plots.pdf", width=5, height=9)