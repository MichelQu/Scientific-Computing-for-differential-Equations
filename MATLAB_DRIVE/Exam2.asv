
% Van der Pol
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


figure(3);
tiledlayout(2,1);
nexttile;
plot(T1,X1(:,1),'LineWidth',1.5);
ylabel('X1')
xlabel('t')
hold on
plot(T2,X2(:,1),'LineWidth',1.5);
xlim([t0 tN]);
legend('Explicit Euler Fixed step','Explicit Euler Adaptative step');
hold off
nexttile;
plot(T1,X1(:,2),'LineWidth',1.5);
ylabel('X2')
xlabel('t')
hold on 
plot(T2,X2(:,2),'LineWidth',1.5);
legend('Explicit Euler Fixed step','Explicit Euler Adaptative step');
xlim([t0 tN]);
hold off
figure(4);
plot(X1(:,1),X1(:,2),'LineWidth',1.5);
hold on
ylabel('X1');
xlabel('X2');
plot(X2(:,1),X2(:,2),'LineWidth',1.5);
legend('Explicit Euler Fixed step','Explicit Euler Adaptative step');
hold off


figure(5);
tiledlayout(2,1);
nexttile;
plot(T3,X3(:,1),'LineWidth',1.5);
hold on
plot(T4,X4(:,1),'LineWidth',1.5);
legend('Explicit Euler Fixed step','Explicit Euler Adaptative step');
xlim([t0 tN]);
ylabel('X1');
xlabel('t');
hold off
nexttile;
plot(T3,X3(:,2),'LineWidth',1.5);
hold on 
plot(T4,X4(:,2),'LineWidth',1.5);
legend('Explicit Euler Fixed step','Explicit Euler Adaptative step');
xlim([t0 tN]);
ylabel('X2');
xlabel('t');
hold off
figure(6);
plot(X3(:,1),X3(:,2),'LineWidth',1.5);
hold on
plot(X4(:,1),X4(:,2),'LineWidth',1.5);
legend('Explicit Euler Fixed step','Explicit Euler Adaptative step');
ylabel('X1');
xlabel('X2');
hold off
%Errors 
Err1 = abs(info2.err(:,1));
Err2 = abs(info2.err(:,2));
merr1 = max(Err1); merr2 = max(Err2);
figure(7);
plot(Err1,'LineWidth',1.5);
xlim([0 length(Err1)-1]);
ylabel('| e |');
xlabel('nfun');
figure(8)
plot(Err2,'LineWidth',1.5);
xlim([0 length(Err2)-1]);
ylabel('| e |');
xlabel('nfun');
%H and R
H = info2.hh(:,1);
R = info2.rr(:,1);
figure(9)
plot(T2(2:end),H,'LineWidth',1.5);
ylabel('h');
xlabel('t');
figure(10)
plot(T2(2:end),R,'LineWidth',1.5);
ylim([0.7 0.9]);
ylabel('r');
xlabel('t');

H = info4.hh(:,1);
R = info4.rr(:,1);
figure(11)
plot(T4(2:end),H,'LineWidth',1.5);
ylabel('h');
xlabel('t');
figure(12)
plot(T4(2:end),R,'LineWidth',1.5);
ylim([0.4 0.9]);
ylabel('r');
xlabel('t');
