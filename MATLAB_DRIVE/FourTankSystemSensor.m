function y = FourTankSystemSensor(x,p)
m = x;
A = p(5:8,1);
rho = p(12,1);

rhoA = rho*A;
y = m./rhoA;
end