% Parameters
a1 = 1.2272;
a2 = 1.2272;
a3 = 1.2272;
a4 = 1.2272;

A1 = 380.1327;
A2 = 380.1327;
A3 = 380.1327;
A4 = 380.1327;

gamma1 = 0.45;
gamma2 = 0.40;

g = 981;
rho = 1.00;
p = [a1; a2; a3; a4; A1; A2; A3; A4; gamma1; gamma2; g; rho];

%Simulation


m10 = 0.0;
m20 = 0.0;
m30 = 0.0;
m40 = 0.0;

x0 = [m10; m20; m30; m40];

%value to change
F1 = 300;
F2 = 300;

u = [F1; F2];
t = linspace(0, 20*60,60)
%-----------------------

N=100
X = zeros(0, nX);
T = zeros(0, 1);

x(:,1) = x0;
for k = 1:N-1
    y(:,k) = FourTankSystemSensor(x(:,k),p);
    z(:,k) = FourTankSystemOutput(x(:,k),p);
    
    [Tk,Xk] = ode15s(@FourTankSystem, [t(k) t(k+1)], x(:,k),[],u(:,k),p);
    x(:,k+1) = Xk(end,:)';
    
    T = [T;Tk];
    X = [X;Xk];
end
k = N;
y(:,k) = FourTankSystemSensor(x(:,k),p);
z(:,k) = FourTankSystemOutput(x(:,k),p);

plot(T,X);