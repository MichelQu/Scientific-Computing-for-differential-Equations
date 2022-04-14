function [f, Jac] = PreyPredatorfunjac(t, x, a, b)
f = zeros(2,1);
f(1) = a*(1-x(2))*x(1);
f(2) = -b*(1-x(1))*x(2);

Jac = zeros(2,2);
Jac(1,1) = a*(1-x(2));
Jac(2,1) = b*x(2);
Jac(1,2) = -a*x(1);
Jac(2,2) = -b*(1-x(1));
