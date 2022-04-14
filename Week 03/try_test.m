function [xdot] = Reactor_1st(x,u,Nt,Nz,L,T)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% 
delta_z = L/Nz;
delta_t = T/Nt;

beta = (v + Da/delta_z)/delta_z;
gamma = (Da/delta_z)/delta_z;
delta = v/delta_z;
alpha = beta + gamma + k;
alpha_bar = beta + k;

size_vect = size(Nz,1);
xdot = zeros(size_vect);

v_diag = - alpha * ones(Nz,1);
v_diag(1) = - alpha_bar;
v_diag(Nz) = - alpha_bar;
v_beta = beta * ones(Nz-1,1);
v_gamma = gamma * ones(Nz-1,1);

A = diag(v_diag,0) + diag(v_beta,-1) + diag(v_gamma,+1);
C = zeros(1,Nz); C(Nz) = 1;
B = zeros(Nz,1); B(1) = delta;

xdot = A * x + B * u;

end

