sig = 10;
rho = 28;
beta = 8/3;
eta = sqrt(rho*(beta-1));
xc = [(rho-1) eta eta];
x0 = xc + [0 0 3];

t0 = 0;
tN = 50;
h0 = 0.01;
N  = 100;
abstol = 1e-6%[1e-12,1e-9, 1e-6, 1e-3]; 
reltol = 1e-6%

%options = odeset('Jacobian',@Lorentzfunjac,'RelTol',1.0e-6,"AbsTol",1.0e-6);
%[T2,X2,stats] = ode15s(@Lorentz,[t0 tN],x0,options,sig,rho,beta);
options = odeset('RelTol',1.0e-6,'AbsTol',1.0e-6);
[T,X]=ode45(@Lorentz,[0 50],x0,options, sig, rho, beta, eta);
%[T1,X1] = ImplicitEulerFixedSS2(@Lorentzfunjac,t0,tN,N,x0,sig,rho,beta,eta);
%[T2,X2,info2] = ImplicitEulerAdaptiveStep(@Lorentzfunjac,[t0 tN],x0,h0,abstol,reltol,sig,rho,beta);

figure(1);
tiledlayout(3,1);
nexttile;
plot(T,X(:,1));
nexttile;
plot(T,X(:,2));
nexttile;
plot(T,X(:,3));

figure(2);
tiledlayout(3,1);

xticks([-20 20]);
nexttile;
plot(X(:,1),X(:,3));
nexttile;
plot(X(:,1),X(:,2));
nexttile;
plot(X(:,2),X(:,3));