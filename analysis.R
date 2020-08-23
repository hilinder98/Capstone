library(readr)
library(plm)
library(lmtest)
install.packages('lfe')
library(lfe)
library(stargazer)
library(ggplot2)

 

acswithvotes <- read_csv("~/Desktop/capstone research/actual directed work/Capstone/acsvoteshartidy2013to2018.csv")


acswithvotes$PWGTP <- as.numeric(acswithvotes$PWGTP)

acswithvotes$WAGP <- as.numeric(acswithvotes$WAGP)

acswithvotes$WKHP <- as.numeric(acswithvotes$WKHP)

acswithvotes$AGEP <- as.numeric(acswithvotes$AGEP)

acswithvotes$SCHL <- as.factor(acswithvotes$SCHL)

acswithvotes$statepuma <- as.factor(acswithvotes$statepuma)

acswithvotes$WRK <- as.factor(acswithvotes$WRK)

acswithvotes$ESR <- as.factor(acswithvotes$ESR)

acswithvotes$ST <- as.factor(acswithvotes$ST)

acswithvotes$HINS4 <- acswithvotes$HINS4 - 2

acswithvotes$HINS4 <- acswithvotes$HINS4* -1

acswithvotes$Trumpiest <- as.numeric(acswithvotes$propR16 >= quantile(acswithvotes$propR16, .90, names = FALSE, na.rm = TRUE)
                                     & acswithvotes$changeinpropR >= quantile(acswithvotes$changeinpropR, .90, names = FALSE, na.rm = TRUE))

acswithvotes$ESR <- as.numeric(acswithvotes$ESR)

acswithvotes$EMPLOYED <- ifelse(acswithvotes$ESR==1, 1,
               ifelse(acswithvotes$ESR==2, 1,
                      ifelse(acswithvotes$ESR==3, 0,
                      ifelse(acswithvotes$ESR==4, 1,
                             ifelse(acswithvotes$ESR==5, 1,
                                    NA  ))))) ## creates data for employment tests


acswithvotes$ESR <- as.factor(acswithvotes$ESR)

acswithvotes$YEAR <- as.factor(acswithvotes$YEAR)


difindif_WKHPonpropR <- lm(data = acswithvotes, WKHP ~ propR16 + AFTR + propR16*AFTR, weights = PWGTP)

difindif_WAGPonpropR <- lm(data = acswithvotes, WAGP ~ propR16 + AFTR + propR16*AFTR, weights = PWGTP)




difindif_WAGPonTrumpiest <- lm(data = acswithvotes, WAGP ~ Trumpiest + AFTR + Trumpiest*AFTR, weights = PWGTP)

difindif_WAGPonTrumpiestx <- lm(data = acswithvotes, WAGP ~ Trumpiest + AFTR + Trumpiest*AFTR,
                                weights = PWGTP, subset = acswithvotes$AGEP > 18 & acswithvotes$SCHL < 21)

difindif_WAGPonTrumpiestx1 <- lm(data = acswithvotes, WAGP ~ Trumpiest + AFTR + Trumpiest*AFTR,
                                weights = PWGTP, subset = acswithvotes$AGEP > 18 & acswithvotes$SCHL < 21)

difindif_WKHPonTrumpiestx <- lm(data = acswithvotes, WKHP ~ Trumpiest + AFTR + Trumpiest*AFTR,
                                weights = PWGTP, subset = acswithvotes$AGEP > 18 & acswithvotes$SCHL < 21)

difindif_WKHPonTrumpiestx1 <- lm(data = acswithvotes, WKHP ~ Trumpiest + AFTR + Trumpiest*AFTR,
                                subset = acswithvotes$AGEP > 18 & acswithvotes$SCHL < 21)

summary(difindif_WRKonpropR16)

difindif_HINS4onTrumpiest <- lm(data = acswithvotes, HINS4 ~ Trumpiest + AFTR + Trumpiest*AFTR, weights = PWGTP)

difindif_HINS4onTrumpiestx1 <- lm(data = acswithvotes, HINS4 ~ Trumpiest + AFTR + Trumpiest*AFTR)

acswithvotes$WRK <- acswithvotes$WRK - 2

acswithvotes$WRK <- acswithvotes$WRK* -1

difindif_WRKonTrumpiest <- lm(data = acswithvotes, WRK ~ Trumpiest + AFTR + Trumpiest*AFTR, weights = PWGTP)

difindif_WRKonpropR16 <- lm(data = acswithvotes, WRK ~ propR16 + AFTR + propR16*AFTR, weights = PWGTP)

difindif_WRKonpropR16 <- lm(data = acswithvotes, WRK ~ propR16 + AFTR + propR16*AFTR, weights = PWGTP)

summary(difindif_WRKonpropR16)

felmWAGPonpropR16 <- felm(data = acswithvotes,
                        formula = WAGP ~ propR16*AFTR | statepuma |0| statepuma,
                        cmethod = 'reghdfe',
                        weights = acswithvotes$PWGTP)

summary(felmWAGPonpropR16)



felmWAGPonpropR16nocse <- felm(data = acswithvotes,
                          formula = WAGP ~ propR16*AFTR | statepuma,
                          cmethod = 'reghdfe',
                          weights = acswithvotes$PWGTP)

summary(felmWAGPonpropR16nocse)


felmTrumpiestonpropR16x <- felm(data = acswithvotes,
                           formula = WAGP ~ Trumpiest*AFTR | stab |0| stab,
                           cmethod = 'reghdfe',
                           weights = acswithvotes$PWGTP)

summary(felmTrumpiestonpropR16x)

felmWAGPonpropR16stripped <- felm(data = acswithvotes,
                          formula = WAGP ~ propR16*AFTR ,
                   
                          weights = acswithvotes$PWGTP)

summary(felmWAGPonpropR16stripped)

poop1 <- felm(data = acswithvotes,
             formula = WAGP ~ propR16*AFTR | stab |0| stab,
             cmethod = 'reghdfe',
             weights = acswithvotes$PWGTP)

poop2 <- felm(data = acswithvotes,
              formula = HINS4 ~ propR16*AFTR |AGEP|0| statepuma,
              cmethod = 'reghdfe',
              weights = acswithvotes$PWGTP)
summary(poop2)

WAGPonTrumpiestdummyageschool <- felm(data = acswithvotes,
                        formula = WAGP ~ Trumpiest*AFTR |AGEP + SCHL |0| statepuma,
                        cmethod = 'reghdfe',
                        weights = acswithvotes$PWGTP)
summary(WAGPonTrumpiestdummyageschool)

acswithvotes$percentR16 <- acswithvotes$propR16*100


WAGPonpercentR16dummyageschool <- felm(data = acswithvotes,
                                      formula = WAGP ~ percentR16*AFTR |AGEP + SCHL |0| statepuma,
                                      cmethod = 'reghdfe',
                                      weights = acswithvotes$PWGTP)
summary(WAGPonpercentR16dummyageschool)

PINCPonpercentR16dummyageschool <- felm(data = acswithvotes,
                                       formula = PINCP ~ percentR16*AFTR |AGEP + SCHL |0| statepuma,
                                       cmethod = 'reghdfe',
                                       weights = acswithvotes$PWGTP)
summary(PINCPonpercentR16dummyageschool)

PINCPonTrumpiestdummyageschool <- felm(data = acswithvotes,
                                        formula = PINCP ~ Trumpiest*AFTR |AGEP + SCHL |0| statepuma,
                                        cmethod = 'reghdfe',
                                        weights = acswithvotes$PWGTP)
summary(PINCPonTrumpiestdummyageschool)

PINCPonTrumpiestdummyageschoolesr <- felm(data = acswithvotes,
                                       formula = PINCP ~ Trumpiest*AFTR |AGEP + SCHL + ESR |0| statepuma,
                                       cmethod = 'reghdfe',
                                       weights = acswithvotes$PWGTP)
summary(PINCPonTrumpiestdummyageschoolesr)

rm(WAGPonpropR16dummyageschool)

WKHPonTrumpiestdummyageschool <- felm(data = acswithvotes,
                                      formula = WKHP ~ Trumpiest*AFTR |AGEP + SCHL |0| statepuma,
                                      cmethod = 'reghdfe',
                                      weights = acswithvotes$PWGTP)
summary(WKHPonTrumpiestdummyageschool)

EMPLOYEDonTrumpiest <- felm(data = acswithvotes,
                                      formula = EMPLOYED ~ Trumpiest*AFTR |0 |0| statepuma,
                                      cmethod = 'reghdfe',
                                      weights = acswithvotes$PWGTP)
summary(EMPLOYEDonTrumpiest)

wage <- acswithvotes[which(acswithvotes$WAGP>0),]


felmlogwageonpropR16x <- felm(data = wage,
                              formula = log(WAGP) ~ propR16*YEAR | 0|0| statepuma,
                              cmethod = 'reghdfe',
                              weights = wage$PWGTP)

summary(felmlogwageonpropR16x)


trendwagereg <- felm(data = wage,
                 formula = log(WAGP) ~ Trumpiest*YEAR| statepuma |0| statepuma,
                 cmethod = 'reghdfe',
                 weights = wage$PWGTP)

summary(trendwagereg)

x <- felm(data = acswithvotes,
                     formula = WAGP ~ Trumpiest*YEAR| statepuma|0| statepuma,
                     cmethod = 'reghdfe',
                     weights = acswithvotes$PWGTP)

summary(x)

for(i in 1:20){ 
        if(is.integer(i/4) == TRUE){
       x<- i
        }  
}

set.seed(1)

sampleacsvotes <-  sample_n(acsvoteshartidy2013to2018, 2000000) 

head(acssample[which(acssample$WAGP<50),]['PWGTP'])


