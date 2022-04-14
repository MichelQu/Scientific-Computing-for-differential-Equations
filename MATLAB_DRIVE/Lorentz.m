function xdot = Lorentz(t, x, sig, rho, beta, eta)

xdot = zeros(3,1);
xdot(1) = sig*x(2)-sig*x(1);
xdot(2) = x(1)*rho-x(1)*x(3)-x(2);
xdot(3) = x(1)*x(2)-beta*x(3);