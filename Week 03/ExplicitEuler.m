function [T,X] = ExplicitEuler(func, t0,tN,N,x0,u,varargin) 
    
    % Compute step size and allocate memory
    dt = (tN-t0)/N;
    nx = size(x0,1);
    X = zeros(nx,N+1);
    T = zeros(1,N+1);
    
    % Eulers Explicit Method
    T(:,1) = t0;
    X(:,1) = x0;
        
    for k = 1:N
        f = feval(func,T(:,k),X(:,k),u,varargin{:});
        T(:,k+1) = T(:,k) + dt;
        X(:,k+1) = X(:,k) + f*dt;
    end
    
    % Form a nice table for the result
    T = T';
    X = X';
end