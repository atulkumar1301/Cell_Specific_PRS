##Chi = -2(Sum of natural logs of p-values)
chi <- -2 * (log (6.08E-01) + log (2.49E-03) + log (1.82E-02) + log (1.20E-03) + log (1.77E-03) + log (2.02E-03) + log (3.19E-03))
##Degree of Freedom 7*2=14
pchisq(q=chi, df=14, lower.tail=FALSE)
