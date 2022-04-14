function x = NewtonsMethodODE(func, tk, xk, dt, xinit, tol, maxit, varargin)
    
    k = 0;
    t = tk + dt;
    x = xinit;
    [f,J] = feval(func,t,x,varargin{:});
    R = x - f*dt - xk;
    I = eye(length(xk));

    while( (k<maxit) && (norm(R,'inf')>tol) )
        k = k+1;
        dRdx = I - J*dt;
        dx = dRdx\R;
        x = x - dx;
        [f,J] = feval(func,t,x,varargin{:});
        R = x - dt*f - xk;
    end
    
end 
