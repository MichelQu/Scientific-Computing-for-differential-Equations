% Van der Pol
t0 = 0;
tN = 50;
h0 = 0.005;
N  = 10000;
x0 = [0.5; 0.5];
tN = 50;
mu=[2.0; 12.0];
abstol = 1e-6%[1e-12,1e-9, 1e-6, 1e-3]; 
reltol = 1e-6%[1e-12,1e-9, 1e-6, 1e-3]; 

[T1,X1] = ImplicitEulerFixedSS2(@VanderPolfunjac,t0,tN,N,x0,mu(1));
[T2,X2,info2] = ImplicitEulerAdaptiveStep(@VanderPolfunjac,[t0 tN],x0,h0,abstol,reltol,mu(1));
[T3,X3] = ImplicitEulerFixedSS2(@VanderPolfunjac,t0,tN,N,x0,mu(2));
[T4,X4,info4] = ImplicitEulerAdaptiveStep(@VanderPolfunjac,[t0 tN],x0,h0,abstol,reltol,mu(2));
options = odeset('Jacobian',@JacVanDerPol,'RelTol',1.0e-6,"AbsTol",1.0e-6);
[T5,X5,stats] = ode15s(@VanderPolfunjac,[t0 tN],x0,options,mu(1));
[T6,X6] = ode15s(@VanderPolfunjac,[t0 tN],x0,options,mu(2));
options2 = odeset('RelTol',1.0e-6,'AbsTol',1.0e-6);
[T7,X7]=ode45(@VanDerPol,[t0 tN],x0,options2,mu(1));
[T8,X8]=ode45(@VanDerPol,[t0 tN],x0,options2,mu(2));


figure(1);
tiledlayout(2,1);
nexttile;
plot(T1,X1(:,1),'LineWidth',1.5);
hold on
plot(T2,X2(:,1),'LineWidth',1.5);
%plot(T5,X5(:,1),'-','LineWidth',1.5);
%plot(T7,X7(:,1),'-','LineWidth',1.5);
xlim([t0 tN]);
ylabel('X1');
xlabel('t');
legend('Implicit Euler Fixed step','Implicit Euler Adaptative step','ode15s','ode45');
hold off
nexttile;
plot(T1,X1(:,2),'LineWidth',1.5);
hold on 
plot(T2,X2(:,2),'LineWidth',1.5);
%plot(T5,X5(:,2),'-','LineWidth',1.5);
%plot(T7,X7(:,2),'-','LineWidth',1.5);
legend('Implicit Euler Fixed step','Implicit Euler Adaptative step','ode15s','ode45');
xlim([t0 tN]);
ylabel('X2');
xlabel('t');
hold off

figure(2);
plot(X1(:,1),X1(:,2),'LineWidth',1.5);
hold on
plot(X2(:,1),X2(:,2),'LineWidth',1.5);
%plot(X5(:,1),X5(:,2),'-','LineWidth',1.5);
%plot(X7(:,1),X7(:,2),'-','LineWidth',1.5);

legend('Implicit Euler Fixed step','Implicit Euler Adaptative step','ode15s','ode45');
ylabel('X1');
xlabel('X2');
hold off

figure(3);
tiledlayout(2,1);
nexttile;
plot(T3,X3(:,1),'LineWidth',1.5);
hold on
plot(T4,X4(:,1),'LineWidth',1.5);
%plot(T6,X6(:,1),'-','LineWidth',1.5);
%plot(T8,X8(:,1),'-','LineWidth',1.5);

legend('Implicit Euler Fixed step','Implicit Euler Adaptative step','ode15s','ode45');
xlim([t0 tN]);
ylabel('X1');
xlabel('t');
hold off
nexttile;
plot(T3,X3(:,2),'LineWidth',1.5);
hold on 
plot(T4,X4(:,2),'LineWidth',1.5);
%plot(T6,X6(:,2),'-','LineWidth',1.5);
%plot(T8,X8(:,2),'-','LineWidth',1.5);
legend('Implicit Euler Fixed step','Implicit Euler Adaptative step','ode15s','ode45');
xlim([t0 tN]);
ylabel('X2');
xlabel('t');
hold off
figure(4);
plot(X3(:,1),X3(:,2),'LineWidth',1.5);
hold on
plot(X4(:,1),X4(:,2),'LineWidth',1.5);
%plot(X6(:,1),X6(:,2),'-','LineWidth',1.5);
%plot(X8(:,1),X8(:,2),'-','LineWidth',1.5);
legend('Implicit Euler Fixed step','Implicit Euler Adaptative step','ode15s','ode45');
ylabel('X1');
xlabel('X2');
hold off

%Errors 
Err1 = abs(info2.err(:,1));
Err2 = abs(info2.err(:,2));
merr1 = max(Err1); merr2 = max(Err2);
figure(5);
plot(Err1,'LineWidth',1.5);
xlim([0 length(Err1)-1]);
ylabel('| e |');
xlabel('nfun');
figure(6)
plot(Err2,'LineWidth',1.5);
xlim([0 length(Err2)-1]);
ylabel('| e |');
xlabel('nfun');
%H and R
H = info2.hh(:,1);
R = info2.rr(:,1);
figure(7)
plot(T2(2:end),H,'LineWidth',1.5);
ylabel('h');
xlabel('t');
figure(8)
plot(T2(2:end),R,'LineWidth',1.5);
ylim([0.7 0.9]);
ylabel('r');
xlabel('t');

H = info4.hh(:,1);
R = info4.rr(:,1);
figure(9)
plot(T4(2:end),H,'LineWidth',1.5);
ylabel('h');
xlabel('t');
figure(10)
plot(T4(2:end),R,'LineWidth',1.5);
%ylim([0.4 0.9]);
ylabel('r');
xlabel('t');