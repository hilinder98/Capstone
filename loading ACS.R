library(readr)
psam_pusa <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/csv_pus (2018)/psam_pusa.csv")

psam_pusb <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/csv_pus (2018)/psam_pusb.csv")

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






ss14pusa <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/csv_pus (2014)/ss14pusa.csv")

ss14pusb <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/csv_pus (2014)/ss14pusb.csv")


acasa14 <- ss14pusa[c('SERIALNO', 'ST', 'PUMA', 'PWGTP', 'AGEP', 'CIT',
                      'COW', 'HINS4', 'INTP', 'MAR', 'MARHD', 'SEX',
                      'SCHL', 'WAGP', 'WKHP', 'WKL','WKW','WRK', 'ESR',
                      'PERNP', 'PINCP', 'RACWHT', 'FHINS4P', 'FPAP')]

acasb14 <- ss14pusb[c('SERIALNO', 'ST', 'PUMA', 'PWGTP', 'AGEP', 'CIT',
                      'COW', 'HINS4', 'INTP', 'MAR', 'MARHD', 'SEX',
                      'SCHL', 'WAGP', 'WKHP', 'WKL','WKW','WRK', 'ESR',
                      'PERNP', 'PINCP', 'RACWHT', 'FHINS4P', 'FPAP')]


acas14 <- rbind(acasa14, acasb14)

acas14$YEAR <- 2014

rm(list = c('ss14pusa', 'ss14pusb', 'acasa14', 'acasb14'))



ss13pusa <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/csv_pus (2013)/ss13pusa.csv")

ss13pusb <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/csv_pus (2013)/ss13pusb.csv")


acasa13 <- ss13pusa[c('SERIALNO', 'ST', 'PUMA', 'PWGTP', 'AGEP', 'CIT',
                      'COW', 'HINS4', 'INTP', 'MAR', 'MARHD', 'SEX',
                      'SCHL', 'WAGP', 'WKHP', 'WKL','WKW','WRK', 'ESR',
                      'PERNP', 'PINCP', 'RACWHT', 'FHINS4P', 'FPAP')]

acasb13 <- ss13pusb[c('SERIALNO', 'ST', 'PUMA', 'PWGTP', 'AGEP', 'CIT',
                      'COW', 'HINS4', 'INTP', 'MAR', 'MARHD', 'SEX',
                      'SCHL', 'WAGP', 'WKHP', 'WKL','WKW','WRK', 'ESR',
                      'PERNP', 'PINCP', 'RACWHT', 'FHINS4P', 'FPAP')]


acas13 <- rbind(acasa13, acasb13)

acas13$YEAR <- 2013

rm(list = c('ss13pusa', 'ss13pusb', 'acasa13', 'acasb13'))

acsbefore <- rbind(acas13, acas14, acas15, acas16)

rm(list = c('acas13', 'acas14', 'acas15', 'acas16'))

acsall <- rbind(acasbefore, acasafter)

rm(list = c('acasbefore', 'acasafter'))

acsall$statepuma <- paste(acsall$ST, acsall$PUMA, sep = "")


acswithvotes <- left_join(acsall, pumavoteshares, by = 'statepuma')














acs1314 <- rbind(acas13, acas14)

rm(list = c('acas13', 'acas14'))

acs1314$statepuma <- paste(acs1314$ST, acs1314$PUMA, sep = "")

write.csv(acs1314, "/Users/harrisonlinder/Desktop/capstone research/actual directed work/Capstone/acs2013to2014.csv", row.names = FALSE)

pumavoteshares <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/pumavoteshares.csv")

acs1314withvotes <- left_join(acs1314, pumavoteshares, by = 'statepuma')

acsvotesharetidy2015to2018 <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/acsvotesharetidy2015to2018.csv")

acsvoteshartidy2013to2018 <- rbind(acs1314withvotes, acsvotesharetidy2015to2018)

write.csv(acswithvotes, "/Users/harrisonlinder/Desktop/capstone research/actual directed work/Capstone/acsvoteshartidy2013to2018.csv", row.names = FALSE)
