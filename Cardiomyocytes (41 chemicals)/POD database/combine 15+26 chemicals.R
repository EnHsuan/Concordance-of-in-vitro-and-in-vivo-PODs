#15+26 chemicals

##in vivo
#original in vivo POD
origpod <- read.csv(file.path("26 cardio chemicals orig POD x Css.csv"))
origpod_15 <- read.csv(file.path("15 ATSDR chemicals PODs","15 chemicals orig POD x Css.csv"))
origpod_41 <- rbind(origpod, origpod_15)
write.csv(origpod_41, file="original POD x Css for 41 chemicals.csv", row.names = FALSE)

#original in vivo POD + DAF
origpoddaf <- read.csv(file.path("26 cardio chemicals original POD x DAF x Css.csv"))
origpoddaf_15 <- read.csv(file.path("15 ATSDR chemicals PODs","original POD x DAF x Css for 15 chemicals.csv"))
colnames(origpoddaf_15)[2] <- "casn"
origpoddaf_41 <- rbind(origpoddaf, origpoddaf_15)
write.csv(origpoddaf_41, file="original POD x DAF x Css for 41 chemicals.csv", row.names = FALSE)

#BBMD
BBMD <- read.csv(file.path("26 cardio chemicals BBMD x Css.csv"))
BBMD$Chemical <- origpod$Chemical
BBMD$Classification <- origpod$Classification
colnames(BBMD)[4] <- "casn"
BBMD_15 <- read.csv(file.path("15 ATSDR chemicals PODs","BMD x Css for 15 chemicals.csv"))
BBMD_15$Chemical <- origpod_15$Chemical
BBMD_15$Classification <- origpod_15$Classification
colnames(BBMD_15)[4] <- "casn"
BBMD_41 <- rbind(BBMD, BBMD_15)
write.csv(BBMD_41, file="BBMD x Css for 41 chemicals.csv", row.names = FALSE)

#HED
HED <- read.csv(file.path("26 cardio chemicals HED x Css.csv"))
HED$Chemical <- origpod$Chemical
HED$Classification <- origpod$Classification
colnames(HED)[4] <- "casn"
HED_15 <- read.csv(file.path("15 ATSDR chemicals PODs","HED x Css for 15 chemicals.csv"))
HED_15$Chemical <- origpod_15$Chemical
HED_15$Classification <- origpod_15$Classification
colnames(HED_15)[4] <- "casn"
HED_41 <- rbind(HED, HED_15)
write.csv(HED_41, file="HED x Css for 41 chemicals.csv", row.names = FALSE)

##-----------------------------------------------------------------------------------------##

##in vitro
#ToxCast active
toxcast <- read.csv("ToxCast AC50 5perc and med.csv")[,c(1,3)]
toxcast_15 <- read.csv(file.path("15 ATSDR chemicals PODs","toxcast 5perc for 15 chemicals.csv"))
toxcast_41 <- rbind(toxcast, toxcast_15)
write.csv(toxcast_41, file="41 chemicals toxcast POD.csv", row.names = FALSE)

#iPSC cardiomyocytes (5 donors)
cardio <- read.csv("26 chemicals Cardio PODs.csv")
cardio_15 <- read.csv(file.path("15 ATSDR chemicals PODs","15 chemicals Cardio PODs.csv"))[,1:11] #5 donors
cardio_41 <- rbind(cardio, cardio_15)
write.csv(cardio_41, file="41 chemicals cardio 5 donors POD.csv", row.names = FALSE)
