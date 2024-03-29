
dCBellF<-function (x, a, b, lambda, log = FALSE)
{
	G=(1-((1+(x/a)^b))^(-1))
	g=((1+(x/a)^b))^(-2) *b*x^(b-1)*a^(-b)


	pdf <- x
	pdf[log == FALSE] <- lambda*g*exp(lambda*G)*exp(exp(lambda*G)-1)/(exp(exp(lambda)-1)-1)
    pdf[log == TRUE] <- log(lambda)+log(g)+(lambda*G)+(exp(lambda*G)-1)-log((exp(exp(lambda)-1)-1))
	return(pdf)
}

