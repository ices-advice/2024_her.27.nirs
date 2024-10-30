## Preprocess data, write TAF data tables

## Before:
## After:

library(icesTAF)
library(stockassessment)
mkdir("data")

cn <- read.ices("boot/data/cn.dat")
cw <- read.ices("boot/data/cw.dat")
#dw <- read.ices("boot/data/dw.dat")
#lw <- read.ices("boot/data/lw.dat")
mo <- read.ices("boot/data/mo.dat")
nm <- read.ices("boot/data/nm.dat")
pf <- read.ices("boot/data/pf.dat")
pm <- read.ices("boot/data/pm.dat")
#sw <- read.ices("boot/data/sw.dat")
lf <- read.ices("boot/data/lf.dat")
surveys <- read.ices("boot/data/survey.dat")

dat <- setup.sam.data(surveys=surveys,
                      residual.fleet=cn, 
                      prop.mature=mo, 
                      stock.mean.weight=cw, 
                      catch.mean.weight=cw, 
                      dis.mean.weight=cw, 
                      land.mean.weight=cw,
                      prop.f=pf, 
                      prop.m=pm, 
                      natural.mortality=nm, 
                      land.frac=lf)
#create the datafiles for the different years and save them...they can then be easily re-loaded
#save the stock object
save(dat,file="data/data.Rdata") #save this into "data" directory
