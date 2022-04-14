%% Stable Node
% Transformation matrix
A = [-0.9, 0; 0, -0.4];
% Create mesh grid
x = linspace(-2, 2, 20);
y = linspace(-2, 2, 20);
[X, Y] = meshgrid(x, y);
U = X.*A(1,1);
V = Y.*A(2,2);
figure;
quiver(X,Y,U,V); hold on;
xline(0, 'r', 'LineWidth', 2);
yline(0, 'r', 'LineWidth', 2);
title('Stable node');