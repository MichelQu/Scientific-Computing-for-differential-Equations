function [T, X] = ImplicitEulerFixedSS(func, t0, tN, N,x0,varargin)
dt = (tN-t0)/N;
nx = size(x0,1);
X = zeros(nx, N+1);
T = zeros(1,N+1);
tol = 1.0e-8;
maxit = 100;
T(:,1) = t0;
X(:,1) = x0;

for k=1:N
    f = feval(func, T(k),X(:,k),varargin{:});
    T(:,k+1) = T(:,k) +dt;
    xinit = X(:,k) + f*dt;
    X(:,k+1) = NewtonsMethodODE(func,[T(:,k) T(:,k+1)]⁾,X(:,k),dt, xinit, tol, varargin{:});

end

T= T';
X= R';
