function [f,J] = Lorentzfunjac(t,x, sig, rho, beta)
f=zeros(3,1);
f(1) = sig*x(2)-sig*x(1);
f(2) = x(1)*rho-x(1)*x(3)-x(2);
f(3) = x(1)*x(2)-beta*x(3);

J= zeros(3,3);
J(1,1)=-sig;
J(2,1)=sig;
J(1,2)=rho-x(3);
J(2,2)=-1;
J(3,2)=-x(1);
J(1,3)=x(2);
J(2,3)=x(1);
J(3,3)=-beta;
