function SolveRobertson()
disp('Time for ode45');
tic
[t,Y45] = ode45(@Robertson,[0,100],[1;0;0]);
toc

subplot(1,2,1);
plot(t,Y45(:,1),'b',t,Y45(:,2),'r',t,Y45(:,3),'g');
legend('y_1 ode45','y_2 ode45','y_3 ode45');

disp('Time for ode15s');
tic
[t,Y15s] = ode15s(@Robertson,[0,100],[1;0;0]);
toc

subplot(1,2,2);
plot(t,Y15s(:,1),'b',t,Y15s(:,2),'r',t,Y15s(:,3),'g');
legend('y_1 ode15s','y_2 ode15s','y_3 ode15s');

function dYdt = Robertson(t,Y)

dYdt = [-0.04*Y(1) + 10000*Y(2)*Y(3);
         0.04*Y(1) - 10000*Y(2)*Y(3) - 30000000*Y(2)^2;
         30000000*Y(2)^2];