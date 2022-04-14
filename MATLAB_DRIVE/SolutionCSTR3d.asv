% Parameters
rho = 1.0;      % density
cp = 4.186;      % specific heat capacity
k0 = exp(24.6); % Arrhenius constant
EaR = 8500;     % Activation Energy
delHr = -560;   % Reaction enthalpy
V = 0.105;      % Reactor Volume
CAin = 0.8;   % Inlet Concentration of A
CBin = 1.2;   % Inlet Concentration of B
Tin =273.65;       % Inlet Temperature


p = {rho; cp; k0; EaR; delHr; V; CAin; CBin ;Tin};
%Simulation
tt =[0;3;5;7;9;12;16;18;20;22;24;28;32;35];
u = [0.65;0.6;0.5;0.4;0.3;0.2;0.3;0.4;0.5;0.6;0.7;0.2;0.7];
%solution
X3d=[];
T3d=[];
X3d=[0,0,273.65];
options = odeset('Jacobian',@CSTR3d,'RelTol',1.0e-9,"AbsTol",1.0e-9);

% 3d
for i=1:13
    t1=tt(i)*60;
    t2=tt(i+1)*60;
    [T3d,X3d] = ode15s(@CSTR3d,[t1 t2], X3d(end,:),options,u(i)/60,p);
    X=[X;X3d];
    T=[T;T3d];
end
%figure(2)
%plot(T3d,X3d);
%xlim([0 max(T)]);