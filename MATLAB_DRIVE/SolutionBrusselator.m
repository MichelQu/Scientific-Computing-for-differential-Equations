A = 1;
B = 3;
x0 = [0 0];

options = odeset('RelTol',1.0e-6,'AbsTol',1.0e-6);
[T,X]=ode45(@Brusselator,[0 100],x0,options,A,B);

figure(1);
tiledlayout(2,1);
nexttile;
plot(T,X(:,1));
nexttile;
plot(T,X(:,2));
figure(2);
plot(X(:,2),X(:,1));
% Need to try a loop or something for different x0's