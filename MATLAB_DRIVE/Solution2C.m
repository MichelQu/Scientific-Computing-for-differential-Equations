t0 = 0;
tN = 50;
N  = 1000;
mu = 5;
x0 =  [2.0; 0.0];

figure(1);
[T,X] = ExplicitEulerFixedSS2(@VanderPolfunjac,t0,tN,N,x0,mu);
plot(T,X);
figure(2);
[T,X] = ImplicitEulerFixedSS2(@VanderPolfunjac,t0,tN,N,x0,mu);
plot(T,X);