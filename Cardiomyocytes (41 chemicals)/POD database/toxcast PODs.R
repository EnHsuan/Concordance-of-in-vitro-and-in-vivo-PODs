#ToxCast POD
chemnames <- gsub("\\.csv$","", list.files(path="ToxCast AC50",pattern="\\.csv$"))
filenames <- file.path("ToxCast AC50",paste0(chemnames,".csv"))
toxcastlist <- list()
nfiles<-length(filenames)
for(i in 1:nfiles){
  fname<-filenames[i]
  toxcastlist[[i]]<-read.csv(fname)
}

ac50.med <- numeric(nfiles)
for(i in 1:nfiles){
  ac50.med[i] <- quantile(toxcastlist[[i]]$AC50,prob=0.50)
}

ac50.5perc <- numeric(nfiles)
for(i in 1:nfiles){
  ac50.5perc[i] <- quantile(toxcastlist[[i]]$AC50, prob=0.05)
}

ac50.med.df <- data.frame(ac50.med)
ac50.5perc.df <- data.frame(ac50.5perc)
chemnames_split <- strsplit(chemnames, "_")
chemnames_splitdf <- data.frame(matrix(unlist(chemnames_split), nrow=26, byrow=TRUE),stringsAsFactors=FALSE)
colnames(chemnames_splitdf) <- c("Chemical", "toxcast summary date")
toxc <- cbind(chemnames_splitdf, ac50.5perc.df, ac50.med.df)
write.csv(toxc, file="ToxCast AC50 5perc and med.csv", row.names = FALSE)
