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


acsv18 <- left_join(acas18, useabledata, by = 'statepuma')


acas18$YEAR <- 2018

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

acasAFTR


acas18$statepuma <- paste(acas18$ST, acas18$PUMA, sep = "")

acsv18 <- left_join(acas18, useabledata, by = 'statepuma')
