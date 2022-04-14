T    = 10;
N    = 100;
Ns   = 10;
seed = 100;
x0 = 1;
lambda = 0.15;
sigma  = 0.15;
p = [lambda; sigma];

[W,Tw,dW]=ScalarStdWienerProcess(T,N,Ns,seed);
Xerr=zeros(N,5);
for s=1:N
    Xtrue = x0*exp(((lambda-0.5*sigma*sigma) + sigma*W(end)))
    for z=1:5
        X = zeros(size(W));
        for i=1:Ns
            [X(i,:) ,dt]= SDEsolverExplicitExplicit(@GeometricBrownianDrift,@GeometricBrownianDiffusion,Tw,x0,W(i,:),p);
        end
        Xerr(s,z) = abs(X(z,end) - Xtrue);      % store the error at t=1
    end
end
Dtvals = dt*(2.^([0:4]));
subplot(221);                                 % top LH picture
loglog(Dtvals,mean(Xerr),'b*-');
hold on
loglog(Dtvals,(Dtvals.^(.5)),'r--');
axis([1e-2 10 1e-1 10]);


hold off % reference slope of 1/2
xlabel('\Delta t');
ylabel('Sample average of | X(T) - X_L |');
title('emstrong.m','FontSize',10 );

%%% Least squares fit of error=C*Dt^q %%%%
A = [ones(5,1), log(Dtvals)'];
rhs = log(mean(Xerr)');
sol = A\rhs;
q = sol(2);
resid = norm(A*sol - rhs);


