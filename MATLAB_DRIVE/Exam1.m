t0 = 0;
tN = 10;
h = logspace(-1,-3,10);
x0 = 1.0;
lamb=-1.0;
local_err=zeros(2,10);
global_err=zeros(2,10);
for i=1:10
    N = ceil((tN - t0)/h(i));
    [T,X]=ExplicitEulerFixedSS2(@func2,t0,tN,N,x0,lamb);
    [TI,XI]=ImplicitEulerFixedSS2(@func2,t0,tN,N,x0,lamb);
    y = exp(-T);
    local_err(1,i) = abs(y(2)-X(2));
    local_err(2,i) = abs(y(2)-XI(2));
    global_err(1,i) = abs(y(end)-X(abs(T - 10) <= 1e-3));
    global_err(2,i) = abs(y(end)-XI(abs(TI - 10) <= 1e-3));
    
end
%loglog(T,local_err);
figure(1)
loglog(h,global_err(1,:),'LineWidth',1.5)
hold on
loglog(h,global_err(2,:),'LineWidth',1.5)
legend('Explicit Euler','Implicit Euler')
hold off

figure(2)
loglog(h,local_err(1,:),'LineWidth',1.5)
hold on
loglog(h,local_err(2,:),'LineWidth',1.5)
ax = gca;
loglog(h,h.^2,'--',h,h.^3,'--')
r = legend('Explicit Euler','Implicit Euler','$O(h^2)$','$O(h^3)$','Location','southeast');
set(r,'Interpreter','latex')


