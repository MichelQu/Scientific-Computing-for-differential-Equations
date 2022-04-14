function xdot =Brusselator(t, x, A, B)

xdot = zeros(2,1);
xdot(1) = A + x(1)*x(1)*x(2) - (B+1)*x(1);
xdot(2) = B*x(1) - x(1)*x(1)*x(2);
