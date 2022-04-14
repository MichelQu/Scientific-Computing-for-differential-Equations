t0 = 0;
tN = 50;
h0 = 0.005;
N  = 10000;
x0 = [1.0; 1.0];
tN = 50;
mu=[1.5; 15];
abstol = 1.0e-7;
reltol = 1.0e-7;


[T1,X1] = ExplicitEulerFixedSS2(@VanderPolfunjac,t0,tN,N,x0,mu(1));
[T2,X2,info2] = ExplicitEulerAdaptiveStep(@VanderPolfunjac,[t0 tN],x0,h0,abstol,reltol,mu(1));
[T3,X3] = ExplicitEulerFixedSS2(@VanderPolfunjac,t0,tN,N,x0,mu(2));
[T4,X4,info4] = ExplicitEulerAdaptiveStep(@VanderPolfunjac,[t0 tN],x0,h0,abstol,reltol,mu(2));
options = odeset('Jacobian',@JacVanDerPol,'RelTol',1.0e-6,"AbsTol",1.0e-6);
[T5,X5,stats] = ode15s(@VanderPolfunjac,[t0 5*mu(1)],x0,options,mu(1));
[T6,X6] = ode15s(@VanderPolfunjac,[t0 5*mu(2)],x0,options,mu(2));
options2 = odeset('RelTol',1.0e-6,'AbsTol',1.0e-6);
[T7,X7]=ode45(@VanDerPol,[t0 5*mu(1)],x0,options2,mu(1));
[T8,X8]=ode45(@VanDerPol,[t0 5*mu(2)],x0,options2,mu(2));

figure(1);
tiledlayout(2,1);
nexttile;
hold on
%plot(T1,X1(:,1),'--','LineWidth',1.5);
%plot(T2,X2(:,1),'-','LineWidth',1.5);
plot(T5,X5(:,1),'-','LineWidth',1.5);
plot(T7,X7(:,1),'--','LineWidth',1.5);
xlim([t0 5*mu(1)]);
ylabel('X1');
xlabel('t');
legend('ode15s','ode45');
hold off
nexttile;
hold on
%plot(T1,X1(:,2),'LineWidth',1.5);
%plot(T2,X2(:,2),'LineWidth',1.5);
plot(T5,X5(:,2),'-','LineWidth',1.5);
plot(T7,X7(:,2),'--','LineWidth',1.5);
legend('ode15s','ode45');
xlim([t0 5*mu(1)]);
ylabel('X2');
xlabel('t');
hold off

figure(2);
hold on
%plot(X1(:,1),X1(:,2),'LineWidth',1.5);
%plot(X2(:,1),X2(:,2),'LineWidth',1.5);
plot(X5(:,1),X5(:,2),'-','LineWidth',1.5);
plot(X7(:,1),X7(:,2),'--','LineWidth',1.5);
xlim([-2.5 2.5]);
legend('ode15s','ode45');
ylabel('X1');
xlabel('X2');


hold off
figure(3);
tiledlayout(2,1);
nexttile;
hold on
plot(T6,X6(:,1),'-','LineWidth',1.5);
plot(T8,X8(:,1),'--','LineWidth',1.5);

legend('ode15s','ode45');
xlim([t0 5*mu(2)]);
ylabel('X1');
xlabel('t');
hold off
nexttile;
hold on 
plot(T6,X6(:,2),'-','LineWidth',1.5);
plot(T8,X8(:,2),'--','LineWidth',1.5);
legend('ode15s','ode45');
xlim([t0 5*mu(2)]);
ylabel('X2');
xlabel('t');
hold off
figure(4);
hold on
plot(X6(:,1),X6(:,2),'-','LineWidth',1.5);
plot(X8(:,1),X8(:,2),'--','LineWidth',1.5);
legend('ode15s','ode45');
ylabel('X1');
xlabel('X2');

hold off