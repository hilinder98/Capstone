library(readr)
psam_pusa <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/csv_pus(2018)/psam_pusa.csv")

psam_pusb <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/csv_pus(2018)/psam_pusb.csv")

acasa18 <- psam_pusa[c('SERIALNO', 'ST', 'PUMA', 'PWGTP', 'AGEP', 'CIT',
                       'COW', 'HINS4', 'INTP', 'MAR', 'MARHD', 'SEX',
                       'SCHL', 'WAGP', 'WKHP', 'WKL','WKW','WRK', 'ESR',
                       'PERNP', 'PINCP', 'RACWHT', 'FHINS4P', 'FPAP')]

acasb18 <- psam_pusb[c('SERIALNO', 'ST', 'PUMA', 'PWGTP', 'AGEP', 'CIT',
                       'COW', 'HINS4', 'INTP', 'MAR', 'MARHD', 'SEX',
                       'SCHL', 'WAGP', 'WKHP', 'WKL','WKW','WRK', 'ESR',
                       'PERNP', 'PINCP', 'RACWHT', 'FHINS4P', 'FPAP')]

acas18 <- rbind(acasa18, acasb18)


acas18$YEAR <- 2018

rm(list = c('acasa18', 'acasb18', 'psam_pusa', 'psam_pusb'))

psam_pusa17 <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/csv_pus (2017)/psam_pusa.csv")

psam_pusb17 <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/csv_pus (2017)/psam_pusb.csv")

acasa17 <- psam_pusa17[c('SERIALNO', 'ST', 'PUMA', 'PWGTP', 'AGEP', 'CIT',
                       'COW', 'HINS4', 'INTP', 'MAR', 'MARHD', 'SEX',
                       'SCHL', 'WAGP', 'WKHP', 'WKL','WKW','WRK', 'ESR',
                       'PERNP', 'PINCP', 'RACWHT', 'FHINS4P', 'FPAP')]

acasb17 <- psam_pusb17[c('SERIALNO', 'ST', 'PUMA', 'PWGTP', 'AGEP', 'CIT',
                         'COW', 'HINS4', 'INTP', 'MAR', 'MARHD', 'SEX',
                         'SCHL', 'WAGP', 'WKHP', 'WKL','WKW','WRK', 'ESR',
                         'PERNP', 'PINCP', 'RACWHT', 'FHINS4P', 'FPAP')]


acas17 <- rbind(acasa17, acasb17)

acas17$YEAR <- 2017

rm(list = c('psam_pusa17', 'psam_pusb17', 'acasa17', 'acasb17'))

acasafter <- rbind(acas17, acas18)

rm(list = c('acas17', 'acas18'))

acasafter$AFTR <- 1

write.csv(acasafter, "/Users/harrisonlinder/Desktop/capstone research/actual directed work/Capstone/acsafter.csv", row.names = FALSE)


ss15pusa <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/csv_pus (2015)/ss15pusa.csv")

ss15pusb <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/csv_pus (2015)/ss15pusb.csv")

acasa15 <- ss15pusa[c('SERIALNO', 'ST', 'PUMA', 'PWGTP', 'AGEP', 'CIT',
                         'COW', 'HINS4', 'INTP', 'MAR', 'MARHD', 'SEX',
                         'SCHL', 'WAGP', 'WKHP', 'WKL','WKW','WRK', 'ESR',
                         'PERNP', 'PINCP', 'RACWHT', 'FHINS4P', 'FPAP')]

acasb15 <- ss15pusb[c('SERIALNO', 'ST', 'PUMA', 'PWGTP', 'AGEP', 'CIT',
                         'COW', 'HINS4', 'INTP', 'MAR', 'MARHD', 'SEX',
                         'SCHL', 'WAGP', 'WKHP', 'WKL','WKW','WRK', 'ESR',
                         'PERNP', 'PINCP', 'RACWHT', 'FHINS4P', 'FPAP')]


acas15 <- rbind(acasa15, acasb15)

acas15$YEAR <- 2015

rm(list = c('ss15pusa', 'ss15pusb', 'acasa15', 'acasb15'))

ss16pusa <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/csv_pus (2016)/ss16pusa.csv")

ss16pusa <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/csv_pus (2016)/ss16pusa.csv")


ss16pusb <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/csv_pus (2016)/ss16pusb.csv")

acasa16 <- ss16pusa[c('SERIALNO', 'ST', 'PUMA', 'PWGTP', 'AGEP', 'CIT',
                      'COW', 'HINS4', 'INTP', 'MAR', 'MARHD', 'SEX',
                      'SCHL', 'WAGP', 'WKHP', 'WKL','WKW','WRK', 'ESR',
                      'PERNP', 'PINCP', 'RACWHT', 'FHINS4P', 'FPAP')]

acasb16 <- ss16pusb[c('SERIALNO', 'ST', 'PUMA', 'PWGTP', 'AGEP', 'CIT',
                      'COW', 'HINS4', 'INTP', 'MAR', 'MARHD', 'SEX',
                      'SCHL', 'WAGP', 'WKHP', 'WKL','WKW','WRK', 'ESR',
                      'PERNP', 'PINCP', 'RACWHT', 'FHINS4P', 'FPAP')]


acas16 <- rbind(acasa16, acasb16)

acas16$YEAR <- 2016

rm(list = c('ss16pusa', 'ss16pusb', 'acasa16', 'acasb16'))

acasbefore <- rbind(acas15, acas16)

rm(list = c('acas15', 'acas16'))

acasbefore$AFTR <- 0

write.csv(acasbefore, "/Users/harrisonlinder/Desktop/capstone research/actual directed work/Capstone/acsbefore.csv", row.names = FALSE)

acsall <- rbind(acasbefore, acasafter)

rm(list = c('acasbefore', 'acasafter'))

acsall$statepuma <- paste(acsall$ST, acsall$PUMA, sep = "")

pumavoteshares <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/pumavoteshares.csv")

acswithvotes <- left_join(acsall, pumavoteshares, by = 'statepuma')

write.csv(acswithvotes, "/Users/harrisonlinder/Desktop/capstone research/actual directed work/Capstone/acsvotesharetidy2015to2018.csv", row.names = FALSE)


rm(acsall)
