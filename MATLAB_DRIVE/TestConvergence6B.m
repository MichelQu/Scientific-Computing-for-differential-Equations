T    = 10;
N    = 1000;
Ns   = 10;
seed = 100;
x0 = 1;
lambda = 0.15;
sigma  = 0.15;
p = [lambda; sigma];

[W,Tw,dW]=ScalarStdWienerProcess(T,N,Ns,seed);
Xerr = zeros(size(Ns));
Xtrue = x0*exp(((lambda-0.5*sigma*sigma) + sigma*W(end)))
