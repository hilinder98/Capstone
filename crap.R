acasafter$PWGTP <- as.numeric(acasafter$PWGTP)

acs2017to2018$PWGTP <- as.numeric(acs2017to2018$PWGTP)

acasafter$WAGP <- as.numeric(acasafter$WAGP)

acs2017to2018$WAGP <- as.numeric(acs2017to2018$WAGP)

acasafter$WKHP <- as.numeric(acasafter$WKHP)

acs2017to2018$WKHP <- as.numeric(acs2017to2018$WKHP)

acasafter$AGEP <- as.numeric(acasafter$AGEP)

acs2017to2018$AGEP <- as.numeric(acs2017to2018$AGEP)

acasafter$SCHL <- as.factor(acasafter$SCHL)

acs2017to2018$SCHL <- as.factor(acs2017to2018$SCHL)

summary(lm(data = acasafter, log(WAGP+1) ~ SCHL+AGEP+ (AGEP)^2, weights = PWGTP))

summary(lm(data = acs2017to2018, log(WAGP+1) ~ SCHL+AGEP+(AGEP)^2, weights = PWGTP))

as.list(colnames(acsbefore))
