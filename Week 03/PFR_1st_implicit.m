
u = 0.0;

t0 = 0;
tN = 5;

N = 1000;
Nz = 1000;

par = zeros(5,1);
v = 1;
par(1,1) = v;
k = 1;
par(2,1) = k;
DA = 1;
par(3,1) = DA;
par(4,1) = Nz;
L = 1;
dz = L/Nz;
par(5,1) = dz;

x0 = zeros(Nz,1);
x0(1) = 1.0;
lambda = 0.3;

figure(1);
[T,X] = ImplicitEulerFixedSS(@PlugFlowReactor_firstorder, t0,tN, N, x0, u, par);
plot(T,X);
