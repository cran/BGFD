
hCBellEW<-function (x, alpha, beta, theta, lambda, log = FALSE,log.p = FALSE, lower.tail = TRUE) 
{
	G=(1-exp(-alpha*x^(beta)))^theta
	g=alpha*beta*x^(beta-1)*exp(-alpha*x^beta)*theta*(1-exp(-alpha*x^(beta)))^(theta-1)

	pdf <- x
	pdf[log == FALSE] <- lambda*g*exp(lambda*G)*exp(exp(lambda*G)-1)/(exp(exp(lambda)-1)-1)
    pdf[log == TRUE] <- log(lambda)+log(g)+(lambda*G)+(exp(lambda*G)-1)-log((exp(exp(lambda)-1)-1))
  
	cdf <- x
	cdf[log.p == FALSE & lower.tail == TRUE] <-  (exp(exp(lambda*G)-1)-1)/(exp(exp(lambda)-1)-1)        
	cdf[log.p == TRUE & lower.tail == TRUE]  <-  log(exp(exp(lambda*G)-1)-1)-log(exp(exp(lambda)-1)-1)  
	cdf[log.p == FALSE & lower.tail == FALSE] <- (exp(exp(lambda)-1)-exp(exp(lambda*G)-1))/((exp(exp(lambda)-1)-1))  
	cdf[log.p == TRUE & lower.tail == FALSE] <-  log(exp(exp(lambda)-1)-exp(exp(lambda*G)-1))-log((exp(exp(lambda)-1)-1))
  
	hrf<-pdf/(1-cdf)
	return(hrf)
}