function [T,Y,info] = ExplicitEuler_AdaptiveStep(...
                 fun,tspan,n,x0,abstol,reltol,type,varargin)

switch type
    case 'asymptotic'
        ki = 1/2; kp = 0;
    case 'PI'
        ki = 0.4/2; kp = 0.3/2;
end
             
% Controller parameters
epstol = 0.8;
facmin = 0.1;
facmax = 5.0;

% Explicit Euler's method
x = x0;
t = tspan(1);

% Compute initial step size
hn = (tspan(2)-tspan(1))/(n-1);

% Information for testing
funeval = 0;
hvec = [];
rvec = [];

while t < tspan(2)
    
    if t+hn > tspan(2)
        hn = tspan(2)-T(end);
    end
    
    f = feval(fun,t,x,varargin{:});
    funeval = funeval+1;
    rp = epstol;
    
    AcceptStep = false;
    while ~ AcceptStep
        h = hn;
        % Step size h
        Y1 = x + h*f;
    
        % Step size h/2
        hm = 0.5*h;
        Tm = t + hm;
        Ym = x + hm*f;
        fm = feval(fun,Tm,Ym,varargin{:});
        funeval = funeval+1;
        Yhat = Ym + hm*fm;
    
        % Error estimation
        e = Y1 - Yhat;
        r = max(abs(e)./max(abstol,abs(Yhat).*reltol));
        
        % Check condition
        AcceptStep = r <= 1;
        
        % step size controller (Asymptotic or PI)
        hn = max(facmin,min((epstol/r)^ki*(rp/r)^kp,facmax))*h;
        rp = r;
        
        hvec(end+1) = h;
        rvec(end+1) = r;
    end
    T(end+1) = T(end) + h;
    Y(:,end+1) = Yhat;

end
Y = Y';
info.funeval = funeval;
info.naccept = length(T);
info.nreject = length(hvec) - length(T) + 1;
info.hvec = hvec;
info.rvec = rvec;
end