function [T, X] = ExplicitEulerFixedSS2(funJac, ta, tb, N,xa,varargin)
dt = (tb-ta)/N;
nx = size(xa,1);
X = zeros(nx, N+1);
T = zeros(1,N+1);
tol = 1.0e-8;
maxit = 100;
T(:,1) = ta;
X(:,1) = xa;

for k=1:N
    f = feval(funJac, T(k),X(:,k),varargin{:});
    T(:,k+1) = T(:,k) +dt;
    X(:,k+1) = X(:,k) +f*dt;
end

T= T';
X= X';

