function [T,X,info] = ImplicitEulerAdaptiveStep(funJac, tspan,x0,h0,abstol,reltol,varargin)

%Error controller parameters
epstol = 0.8; % target
facmin = 0.1; % maximum decrease factor
facmax = 5.0; % maximum increase factor
maxit = 100;
%Intergration interval
t0 = tspan(1);
tf = tspan(2);
%Initial conditions
t = t0;
h= h0;
x = x0;
%Output
T=t;
X=x';
% Information output
nfun = 0;
hvec = [];
rvec = [];
err = [];
rr = [];
hh =[];

%% Main algo
while t < tf
    if (t+h>tf)
        h = tf-t;
    end
    f = feval(funJac, t,x,varargin{:});
    nfun = nfun+1;
    AcceptStep = false;
    while ~AcceptStep
        %Take step of size h
        x1 = x+ h*f;
        [fm,nfunNewt] = NewtonsMethodODE(funJac, t, x, h, x1, epstol, maxit, varargin{:});
        nfun = nfun+nfunNewt;
        
        %Take step of size h/2
        hm = 0.5*h;
        tm = t+hm;
        xm = x+hm*f;
        [fm,nfunNewt] = NewtonsMethodODE(funJac, t, x, hm, xm, epstol, maxit, varargin{:});
        fm2 = feval(funJac, tm,fm,varargin{:});
        nfun = nfun + nfunNewt + 1;
        xinit= fm+hm*fm2;
        [x1hat,nfunNewt] = NewtonsMethodODE(funJac, tm, fm,hm,xinit,epstol,maxit,varargin{:});
        nfun = nfun + nfunNewt;
        
        %Error estimation
        e = x1hat-x1;
        r = max(abs(e)./max(abstol,abs(x1hat).*reltol));
        
        AcceptStep = (r <= 1.0);
        if AcceptStep
            t = t+h;
            x = x1hat;
            
            T = [T;t];
            X = [X;x'];
            err = [err;e.'];
            rr = [rr;r.'];
            hh = [hh;h.'];
        end
        %asymptotic step size controller
        h = max(facmin,min(sqrt(epstol./r),facmax)).*h; 
        hvec(end+1) = h;
        rvec(end+1) = r;

    end
end
info.nfun = nfun;
info.naccept = length(T);
info.nreject = length(hvec) - length(T) + 1;
info.nstep = length(hvec) + length(rvec)
info.hvec = hvec;
info.rvec = rvec;
info.err = err;
info.rr = rr;
info.hh = hh;