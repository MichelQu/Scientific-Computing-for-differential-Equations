function xdot = Lorentz(t,x,sigma,rho,beta)
    xdot = zeros(3,1);
    xdot(1) = sigma*(x(2)-x(1));
    xdot(2) = (x(1)*(rho-x(3))) - x(2);
    xdot(3) = x(1)*x(2) - beta*x(3);
end