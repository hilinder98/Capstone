## election data taken from MIT election lab
## election data by 2014 counties matched against census 2012 PUMAs geographies using missouri census data center. 
library(readr)
county_to_PUMA <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/quarantine work/county to PUMA.csv")
View(county_to_PUMA)
load("~/Desktop/capstone research/actual directed work/Capstone/quarantine work/countypres_2000-2016.RData")



votescounty <- x[which(x$FIPS != 'NA'),] ## certain small counties in the MIT data set have no FIPS code.



votescounty$FIPS <- as.numeric(votescounty$FIPS) 

str(votescounty)

for(i in 1: nrow(votescounty)){ 
    if(nchar(votescounty$FIPS[[i]]) == 4){
       votescounty$FIPS[[i]] <- paste(0,votescounty$FIPS[[i]], sep = "") 
    }  
    else{
        votescounty$FIPS[[i]] <- votescounty$FIPS[[i]]
    }
} ## FIPS in the matching data set are all 5 digits. adds a zero to the front of each FIPS code in MIT data that is only 4 digits for matching with county_to_PUMA

## create a new votes by county data frame where FIPS code is repeated only once
library(reshape2)
library(tidyr)
library(dplyr)
library(magrittr)
library(xtable)

Fips <- votescounty[c('year', 'county', 'FIPS', 'party', 'candidatevotes')] ## constrains
## dataset to only the variables we care about

Fips1 <- spread(Fips,key = party, value = candidatevotes) ## creates
## wide data for easy matching against mabel data


Fips2016 <- Fips1[which(Fips1$year == 2016),] ## FIPS only once for 2016

Fips2016 <- Fips2016[c('FIPS', 'democrat', 'republican')]

Fips2016 <- rename(Fips2016, 'democrat16' = 'democrat', 'republican16' = 'republican')


Fips2012 <- Fips1[which(Fips1$year == 2012),]

Fips2012 <- Fips2012[c('FIPS', 'democrat', 'republican')]

Fips2012 <- rename(Fips2012, 'democrat12' = 'democrat', 'republican12' = 'republican')

Fips1216 <- merge(Fips2012, Fips2016, by = 'FIPS')


mabel <- rename(county_to_PUMA,FIPS = county14 ) ## data frame from which we can merge by FIPS code with 

full <- left_join(mabel, Fips1216, by = "FIPS") ## attaches vote data to matching data, preserving all matching data

full$statepuma <- paste(full$state, full$puma12, sep = "") ## creates a unique code for each PUMA

full$afact <- as.numeric(full$afact)

full$AFACT2 <- as.numeric(full$AFACT2)


allinpuma <- aggregate(x = full$AFACT2, by = list('statepuma' = full$statepuma, 'stab' = full$stab), FUN = mean) ## for those observations
## where county borders fall completely within PUMA borders, all values of full$AFACT2 = 1 for each PUMA. Therefore
## the mean of full$AFACT2 for each PUMA must also be 1 if it perfectly comprised by its counties

str(allinpuma)

countyinpuma <- allinpuma[which(allinpuma$x == 1),] ## filters out counties that do not fall perfectly
## within a PUMA

countyinpuma <- countyinpuma[c('statepuma', 'x')]

countyinpuma <- left_join(countyinpuma, full, by = 'statepuma' )


useablecinp <- aggregate(x = list(dem12 = countyinpuma$democrat12,
                                  rep12 = countyinpuma$republican12,
                                  dem16 = countyinpuma$democrat16,
                                  rep16 = countyinpuma$republican16),
                         by = list(statepuma = countyinpuma$statepuma,
                                   stab = countyinpuma$stab,
                                   pumaname = countyinpuma$PUMAname),
                         FUN = sum) 


pumaincounty <- aggregate(x = full$afact, by = list(full$statepuma), FUN = mean) ## for PUMA's that fall completely
## within a particular county, the mean of full$afact by PUMA is 1

pumaincounty <- pumaincounty[which(pumaincounty$x ==1),]

pumaincounty <- rename(pumaincounty, 'statepuma' = 'Group.1')

pumaincounty <- left_join(pumaincounty, full, by = 'statepuma' )

useablepinc <- pumaincounty[c('statepuma', 'stab', 'PUMAname', 'democrat12', 'republican12', 'democrat16', 'republican16')]

useablepinc <- rename(useablepinc, 'pumaname' = 'PUMAname',
                      'dem12' = 'democrat12',
                      'rep12' = 'republican12',
                      'dem16' = 'democrat16',
                      'rep16' = 'republican16')

useabledata <- rbind(useablepinc, useablecinp)

useabledata <- unique(useabledata) ## those PUMA's that perfectly match counties are repeated in the data

useabledata$propR12 <- useabledata$rep12/(useabledata$rep12 + useabledata$dem12)

useabledata$propR16 <- useabledata$rep16/(useabledata$rep16 + useabledata$dem16)

useabledata$changeinR <- useabledata$rep16 - useabledata$rep12

useabledata$changeinpropR <- useabledata$propR16 - useabledata$propR12





str(useabledata)





freqtab <- table(useabledata$stab)

freqtab <- as.data.frame(freqtab)

freqtaborig <- table(allinpuma$stab) ## this shows us

freqtaborig <- as.data.frame(freqtaborig)

missing <- left_join(freqtab, freqtaborig, by = 'Var1')

missing <- rbind(missing, c('Total', 2188, 2356, 168)) ## shows how


trumpiest <- useabledata[
    which(useabledata$propR16 >= quantile(useabledata$propR16, .95, names = FALSE, na.rm = TRUE)
          & useabledata$changeinpropR >= quantile(useabledata$changeinpropR, .95, names = FALSE, na.rm = TRUE)),]


write.csv(useabledata, "/Users/harrisonlinder/Desktop/capstone research/actual directed work/Capstone/pumavoteshares.csv", row.names = FALSE)




