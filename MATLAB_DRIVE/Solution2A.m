%%% cos function

t0 = 0;
tN = 50;
N  = 10000;
x0 = 1;
figure(1);
[T,X] = ExplicitEulerFixedSS(@func1,t0,tN,N,x0);
plot(T,X);

% lambda function
[T,X] = ExplicitEulerFixedSS(@func2,t0,tN,N,x0,1.0);
figure(2);
plot(T,X);

% Van der Pol
x0 = [2; 0.0];
tN = 50;

[T,X] = ExplicitEulerFixedSS(@VanDerPol,t0,tN,N,x0,10);
figure(3);
tiledlayout(2,1);
nexttile;
plot(T,X(:,1));
nexttile;
plot(T,X(:,2));
figure(4);
plot(X(:,1),X(:,2));
%%%
% Predator prey
tN = 50;
a = 1;
b = 1;
x0 = [2; 2];
[T,X] = ExplicitEulerFixedSS(@PreyPredator,t0,tN,N,x0,a,b);
figure(5);
tiledlayout(2,1);
nexttile;
plot(T,X(:,1));
nexttile;
plot(T,X(:,2));
figure(6);
plot(X(:,1),X(:,2));