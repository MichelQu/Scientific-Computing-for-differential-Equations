function [T, X] = ExplicitEulerFixedSS(func, t0, tN, N,x0,varargin) % play with parameter N and mu (last question 2C)
dt = (tN-t0)/N;
nx = size(x0,1);
X = zeros(nx, N+1);
T = zeros(1,N+1);

T(:,1) = t0;
X(:,1) = x0;
for k=1:N
    f = feval(func, T(k),X(:,k),varargin{:});
    T(:,k+1) = T(:,k) +dt;
    X(:,k+1) = X(:,k) +f*dt;
end

T= T';
X= X';

