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
t0 = 0.0;
tf = 20*60;

m10 = 0.0;
m20 = 0.0;
m30 = 0.0;
m40 = 0.0;

F1 = 300;
F2 = 300;

x0 = [m10; m20; m30; m40];
u = [F1; F2];

%solution
[T,X] = ode45(@FourTankSystem,[t0 tf], x0,[],u,p);

% plot
%plot variables
[nT,nX] = size(X);
a = p(1:4,1)';
A = p(5:8,1)';
% Compute the measured variables
H = zeros(nT,nX);
for i=1:nT
    H(i,:) = X(i,:)./(rho*A);
end
% Compute the flows out of each tank
Qout = zeros(nT,nX);
for i=1:nT
    Qout(i,:) = a.*sqrt(2*g*H(i,:));
end
tiledlayout(2,2);
nexttile;
plot(T,X(:,1));
nexttile;
plot(T,X(:,2));
nexttile;
plot(T,X(:,3));
nexttile;
plot(T,X(:,4));

tiledlayout(2,2);
nexttile;
plot(T,H(:,1));
nexttile;
plot(T,H(:,2));
nexttile;
plot(T,H(:,3));
nexttile;
plot(T,H(:,4));

tiledlayout(2,2);
nexttile;
plot(T,Qout(:,1));
nexttile;
plot(T,Qout(:,2));
nexttile;
plot(T,Qout(:,3));
nexttile;
plot(T,Qout(:,4));

