t0 = 0;
tN = 1;
N  = 100;
x0 = 1;
figure(1);
[T,X] = ImplicitEulerFixedSS(@func2,t0,tN,N,x0,1);
plot(T,X);

