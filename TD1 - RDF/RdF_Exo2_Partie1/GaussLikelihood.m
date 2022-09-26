function pxlikelihood=GaussLikelihood(xs,mu,sig_inv,d_sig)

d = length(mu);
coef_norm = (1/((2*pi)^(d/2)*d_sig^0.5));
pxlikelihood = coef_norm*exp(-(xs-mu)'*sig_inv*(xs-mu)/2);
