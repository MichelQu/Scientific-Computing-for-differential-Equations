mu = 10;
x0 = [2.0; 0.0];
options = odeset('RelTol',1.0e-6,'AbsTol',1.0e-6);
[T,X]=ode45(@VanDerPol,[0 5*mu],x0,options,mu);
figure(1);
tiledlayout(2,1);
nexttile;
plot(T,X(:,1));
nexttile;
plot(T,X(:,2));
figure(2);
plot(X(:,1),X(:,2));