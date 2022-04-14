% Van der Pol
t0 = 0;
h0 = 0.001;
N  = 1000;
x0 = [0.5; 0.5];
tN = 500;
mu=100;
abstol = [1e-8 1e-7 1e-6 1e-5 1e-4 1e-3 1e-2 1]; 
reltol = [1e-8 1e-7 1e-6 1e-5 1e-4 1e-3 1e-2 1];
nfun_exp = [];
nfun_imp = [];
for i=1:8
    [T1,X1,info1] = ExplicitEulerAdaptiveStep(@VanderPolfunjac,[t0 5*mu],x0,h0,abstol(i),reltol(i),mu);
    [T2,X2,info2] = ImplicitEulerAdaptiveStep(@VanderPolfunjac,[t0 5*mu],x0,h0,abstol(i),reltol(i),mu);
    nfun_exp =[nfun_exp;info1.nfun];        
    nfun_imp =[nfun_imp;info2.nfun];
end

figure(1);
loglog(abstol(2:end),nfun_exp,'b-o');
xlabel('Tol');
xlim([1e-7 10]);
ylim([0 8*1e5]);

ylabel('nfun');
hold on
loglog(abstol(2:end),nfun_imp,'r-o');
legend('Explicit Euler Adaptative step','Implicit Euler Adaptative step');

hold off