acswithvotes$PWGTP <- as.numeric(acswithvotes$PWGTP)

acswithvotes$WAGP <- as.numeric(acswithvotes$WAGP)

acswithvotes$WKHP <- as.numeric(acswithvotes$WKHP)

acswithvotes$AGEP <- as.numeric(acswithvotes$AGEP)

acswithvotes$SCHL <- as.numeric(acswithvotes$SCHL)

difindif_WKHPonpropR <- lm(data = acswithvotes, WKHP ~ propR16 + AFTR + propR16*AFTR, weights = PWGTP)

difindif_WAGPonpropR <- lm(data = acswithvotes, WAGP ~ propR16 + AFTR + propR16*AFTR, weights = PWGTP)

acswithvotes$Trumpiest <- as.numeric(acswithvotes$propR16 >= quantile(acswithvotes$propR16, .90, names = FALSE, na.rm = TRUE)
          & acswithvotes$changeinpropR >= quantile(acswithvotes$changeinpropR, .90, names = FALSE, na.rm = TRUE))


difindif_WAGPonTrumpiest <- lm(data = acswithvotes, WAGP ~ Trumpiest + AFTR + Trumpiest*AFTR, weights = PWGTP)

difindif_WAGPonTrumpiestx <- lm(data = acswithvotes, WAGP ~ Trumpiest + AFTR + Trumpiest*AFTR,
                                weights = PWGTP, subset = acswithvotes$AGEP > 18 & acswithvotes$SCHL < 21)

difindif_WKHPonTrumpiestx <- lm(data = acswithvotes, WKHP ~ Trumpiest + AFTR + Trumpiest*AFTR,
                                weights = PWGTP, subset = acswithvotes$AGEP > 18 & acswithvotes$SCHL < 21)

summary(difindif_WKHPonTrumpiestx)

acswithvotes$HINS4 <- acswithvotes$HINS4 - 2

acswithvotes$HINS4 <- acswithvotes$HINS4* -1

