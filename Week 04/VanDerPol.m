function f = VanDerPol(~,x,mu)
     % VANDERPOL  Implementation of the Van der Pol model
     %
     % Syntax: xdot = VanDerPol(t,x,mu)
     f = zeros(2,1);
     f(1) = x(2);
     f(2) = mu*(1-x(1)*x(1))*x(2)-x(1);
end

