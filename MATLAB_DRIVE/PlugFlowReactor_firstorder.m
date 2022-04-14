function dCdt = PlugFlowReactor_firstorder(t,x,u,p)

 

%Parameters

CA = x;

v = p(1,1);

k = p(2,1);

DA = p(3,1);

Nz = p(4,1);

dz = p(5,1);

CA_in = u;

 

% Pre-allocations

dCdt =zeros(Nz,1);

NA =zeros(Nz+1,1);

r =zeros(Nz,1);

RA =zeros(Nz,1);

 

% Fluxes

NA(1,1) = v*CA_in;

for i = 1:Nz-1
    NA(i+1,1) = v*CA(i,1)-DA*(CA(i+1,1)-CA(i,1))/dz;
    NA(end,1) = v*CA(Nz,1);
end

 

%Reactions

for i = 1:Nz
    r(i,1) = k*CA(i,1);
    RA(i,1) = -r(i,1);
end

 

%Differential equations

for i = 1:Nz
    dCdt(i,1) = - (NA(i+1,1)-NA(i,1))/dz + RA(i,1);
end