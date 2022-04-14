function [Tx,G,I,X]=HovorkaModelSimulation(T,x0,U,D,par)

%Meal Model = CHO Absorption
Ddot(1) = AG*1000/MwG*d(t)-1/tauD*D(1);
Ddot(2) = 1/tauD*D(1)-1/tauD*D(2);
UG = 1/tauD*D(2);
%missing d(t) and MwG

%SC Insulin Absorption Model
Sdot(1) = u(t)- 1/tauS*S(1);
Sdot(2) = 1/tauS*S(1)-1/tauS*S(2);
UI = 1/tauS*S(2);
%missing u(t)

%Glucose Subsystem
Qdot(1) = UG - F01c - FR - x(1)*Q(1) + k12*Q(2) +EGP0*(1-x(3));
Qdot(2) = x(1)*Q(1) - k12*Q(2) - x(2)*Q(2);

%Glucose Consumption
%%Plasma Glucose Concentration
G = Q(1)/VG
%%Insulin independent glucose consumption (CNS)

if G >= 4.5 
    F01c = F01;
else 
    F01c = F01*G/4.5; 
end