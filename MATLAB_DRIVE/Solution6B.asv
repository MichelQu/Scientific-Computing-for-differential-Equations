mu = 3 ;
sigma = 1;
x0  = [0.5; 0.5];
p = [mu; sigma];

tf = 5*mu;
nw = 1;
N = 5000;
Ns = 5;
seed = 100;

[W,T,~]=StdWienerProcess(tf,N,nw,Ns,seed);
X = zeros(length(x0),N+1,Ns);

for i=1:Ns
    X(:,:,i) = SDEsolverImplicitExplicit(@VanderpolDrift,@VanderPolDiffusion1,T,x0,W(:,:,i),p);
end
Xd = SDEsolverImplicitExplicit(@VanderpolDrift,@VanderPolDiffusion1,T,x0,W(:,:,i),[mu; 0.0]);
figure(1)
tiledlayout(2,1);
nexttile;
for i=1:5
    plot(T,X(1,:,i));
    plot(T,Xd(1,:,1),'LineWidth',2,'color', 'k');
    hold on
end
nexttile;
for i=1:Ns
    plot(T,X(2,:,i));
    plot(T,Xd(2,:,1),'LineWidth',2,'color', 'k');
    hold on
end
hold off
figure(2)
for i=1:Ns
    plot(X(1,:,i),X(2,:,i));
    plot(Xd(1,:,1),Xd(2,:,1),'LineWidth',2,'color', 'k');
    hold on
end
hold off




hold on
%plot(Tw, X);

[Wmean,sW,Wmeanp2sW,Wmeanm2sW]=ScalarSampleMeanStdVar(X);
plot(Tw,Wmean,'LineWidth',2,'color', 'k');
plot(Tw,Wmeanp2sW,'LineWidth',2,'color', 'k');
plot(Tw,Wmeanm2sW,'LineWidth',2,'color', 'k');
hold off

