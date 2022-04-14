% Van der Pol
t0 = 0;
tN = 50;
h0 = 0.005;
N  = 10000;
x0 = [0.5; 0.5];
tN = 50;
mu=[2.0; 12.0];
abstol = [ 1e-6,1e-5,1e-4, 1e-3]; 
reltol = [ 1e-6,1e-5,1e-4, 1e-3]; 
infomu1 = [];
infomu2 = [];
for i=1:4
    [T2,X2,info2] = ImplicitEulerAdaptiveStep(@VanderPolfunjac,[t0 tN],x0,h0,abstol(i),reltol(i),mu(1));
    %[T2,X2,info2] = ExplicitEulerAdaptiveStep(@VanderPolfunjac,[t0 tN],x0,h0,abstol(i),reltol(i),mu(1));
    infomu1 = [infomu1; info2]
    %[T4,X4,info4] = ExplicitEulerAdaptiveStep(@VanderPolfunjac,[t0 tN],x0,h0,abstol(i),reltol(i),mu(2));
    [T4,X4,info4] = ImplicitEulerAdaptiveStep(@VanderPolfunjac,[t0 tN],x0,h0,abstol(i),reltol(i),mu(2));
    infomu2 = [infomu2; info4]
end
