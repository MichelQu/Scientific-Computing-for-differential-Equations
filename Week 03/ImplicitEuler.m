function [T,X] = ImplicitEuler(t0,tN,N,x0,lambda) 
    % Compute step size and allocate memory
    dt = (tN-t0)/N;
    nx = size(x0,1);
    X = zeros(nx,N+1);
    T = zeros(1,N+1);
    % Eulers Explicit Method
    T(:,1) = t0;
    X(:,1) = x0;
    for k=1:N
        T(:,k+1) = T(:,k) + dt;
        X(:,k+1) = X(:,k)/(1-lambda*dt);
    end
end 