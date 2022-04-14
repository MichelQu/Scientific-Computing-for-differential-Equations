mu = [1.5; 15];
h0 = 0.1;
abstol = 1e-6;
reltol = 1e-6;
x0 = [1; 1];
[T,X] = ClassicalRungeKuttaAdaptiveStep(@VanDerPol,[0, 5*mu(2)],x0,h0,abstol,reltol,mu(2));
options = odeset('Jacobian',@JacVanDerPol,'RelTol',1.0e-6,"AbsTol",1.0e-6);
[TT,XX]=ode15s(@VanDerPol,[0 5*mu(2)],x0,options,mu(2));

figure(1);
tiledlayout(2,1);
nexttile;
hold on
plot(T,X(:,1),'LineWidth', 2)
plot(TT,XX(:,1),'--','LineWidth', 2);
legend('RK4','ode15s')
xlim([t0 5*mu(2)])
hold off
nexttile;
hold on
plot(T,X(:,2),'-','LineWidth', 2)
plot(TT,XX(:,2),'--','LineWidth', 2);
legend('RK4','ode15s')
xlim([t0 5*mu(2)])

hold off
figure(2);
hold on
plot(X(:,1),X(:,2),'LineWidth', 2)
plot(XX(:,1),XX(:,2),'--','LineWidth', 2);
legend('RK4','ode15s')
xlim([-2.5 2.5])
hold off

