## Run analysis, write model results

## Before:
## After:

library(icesTAF)
library(stockassessment)

mkdir("model")
#load the data and configuration file
dat<-load("data/dat.Rdata") #get the data file created in the data.R script
conf <- loadConf(dat, "boot/data/model.cfg", patch=TRUE) #load the configuration file
par<-defpar(dat,conf)
#fit the model
fit<-sam.fit(dat,conf,par)
if(fit$opt$convergence!=0) stop("Model did not converge.")

#run retrospectives
retro_fit <- retro(fit, year = 5)

save(fit, file = 'model/fit.Rdata')
save(retro_fit, file = "model/retro_fit.RData")
