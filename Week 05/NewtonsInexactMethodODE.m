function [x,nfunNewt] = NewtonsInexactMethodODE(FunJac, tk, xk, dt, xinit, tol, maxit, varargin)
k = 0;
t = tk + dt;
x = xinit;
[f,J] = feval(FunJac,t,x,varargin{:});
R = x - f*dt - xk;
I = eye(length(xk));

h = 0;

nfunNewt  = 0;

while( (k<maxit) & (norm(R,'inf')>tol) )
    k = k+1;
    if (hk ~= h) 
        dRdx = I - h*J; %M
        dx = dRdx\R;
        x = x - dx;
        [f,J] = feval(FunJac,t,x,varargin{:});
    else 
        x = x - dx;
    end
    R = x - dt*f - xk;
    nfunNewt = nfunNewt + 1;
end