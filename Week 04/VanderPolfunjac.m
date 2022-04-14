function [f,J] = VanderPolfunjac(~,x,mu)

    % Compute the function f
    f = zeros(2,1);
    f(1) = x(2);
    f(2) = (mu*(1-x(1)*x(1))*x(2))-x(1);

    % Compute the Jacobian
    J= zeros(2,2);
    J(2,1) = -2*mu*x(1)*x(2)-1.0;
    J(1,2)= 1.0;
    J(2,2) = mu*(1-x(1)*x(1));
end 