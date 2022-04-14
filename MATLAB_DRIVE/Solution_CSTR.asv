% Parameters
rho = 1.0;      % density
cp = 4.186;      % specific heat capacity
k0 = exp(24.6); % Arrhenius constant
EaR = 8500;     % Activation Energy
delHr = -560;   % Reaction enthalpy
V = 0.105;      % Reactor Volume
CAin = 0.8;   % Inlet Concentration of A
CBin = 1.2;   % Inlet Concentration of B
Tin = 273.65;       % Inlet Temperature


p = [rho; cp; k0; EaR; delHr; V; CAin; CBin; Tin];
%Simulation
tt =[0;3;5;7;9;12;16;18;20;22;24;28;32;35];
u = [0.65;0.6;0.5;0.4;0.3;0.2;0.3;0.4;0.5;0.6;0.7;0.2;0.7];
%solution
X=[];
T=[];
X1=273.65;
options = odeset('Jacobian',@CSTR1d,'RelTol',1.0e-10,"AbsTol",1.0e-10);
F=[];
for i=1:13
    t1=tt(i)*60;
    t2=tt(i+1)*60;
    [T1,X1] = ode15s(@CSTR1d,[t1 t2], X1(end,:),options,u(i)/60,p);
    X=[X;X1];
    T=[T;T1];
    ftemp=zeros(size(T1))+u(i);
    F=[F;ftemp];
end
figure(1)
tiledlayout(2,1);
nexttile;
plot(T,X);
xlim([0 max(T)]);
ylabel('T [°C]');
xticks(linspace(0,max(T),8));
yticks(linspace(273.65,323.65,3));
xticklabels({'0','5','10','15','20','25','30','35'});
yticklabels({'0','50'});
nexttile;
plot(T,F);
xlim([0 max(T)]);
ylim([0 1]);
ylabel('F [ml/min]');
xlabel('t [min]');
xticks(linspace(0,max(T),8));
yticks(linspace(0,1,3))
xticklabels({'0','5','10','15','20','25','30','35'});
yticklabels({'0','500','1000'});

%ylim([x0 x0+50])
