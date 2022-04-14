function [x, nfun] = NewtonsMethodODE(FunJac, tk, xk, dt, xinit, tol, maxit, varargin)
k = 0;
t = tk + dt;
x = xinit;
[f,J] = feval(FunJac,t,x,varargin{:})
R = x - f*dt - xk;
I = eye(length(xk));
nfun = 1;
while( (k<maxit) & (norm(R,'inf')>tol) )
    k = k+1;
    dRdx = I - J*dt;
    dx = dRdx\R;
    x = x - dx;
    [f,J] = feval(FunJac,t,x,varargin{:});
    nfun = nfun + 1;
    R = x - dt*f - xk;
end