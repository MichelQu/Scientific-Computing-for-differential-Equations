alph = 0.04;
beta = 10000;
gam = 30000000;
x0 = [1 0 0];

options = odeset('RelTol',1.0e-6,'AbsTol',1.0e-6);
[T,X]=ode15s(@Robertson,[0, 100],x0,options,alph,beta, gam);

figure(1);
tiledlayout(3,1);
nexttile;
plot(T,X(:,1));
yticks([0.6 1]);
nexttile;
plot(T,X(:,2));
yticks([0 4]);
nexttile;
plot(T,X(:,3));
yticks([0 0.4]);
