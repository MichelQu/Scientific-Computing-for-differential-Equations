function xdot = Robertson(t, x, alph, beta, gam)

xdot = zeros(3,1);
xdot(1) = -alph*x(1)+beta*x(2)*x(3);
xdot(2) = alph*x(1)-beta*x(2)*x(3)-gam*x(2)*x(2);
xdot(3) = gam*x(2)*x(2);