x0 = [0.0,0.0] ;
u = 0.0 ;
tspan= [0 50];
par= zeros(5,1);
v = 1
par(1,1) = v;
k =1
par(2,1) = k;
DA =1
par(3,1) = DA;
Nz = 10
par(4,1) = Nz;
dz = 10/Nz
par(5,1) = dz;

options = odeset('RelTol',1e-6,'AbsTol',1e-6);


figure(1);
[T, X] = ode15s(@PlugFlowReactor_firstorder,tspan, x0 ,options,u,par)
plot(T,X);
