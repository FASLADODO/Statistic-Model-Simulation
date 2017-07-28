clear
theta=5.5
d=theta-1/3;
c=1/sqrt(9*d);
i=0;
while(i<1000)
Z=normrnd(0,1);
U=rand();
V=(1+c*Z)^3;
    if(Z>-1/c && log10(U)<1/2*Z^2+d-d*V+d*log(V))
       X(i+1)=d*V; 
       i=i+1;
    end
end
%theoretic gamma
histogram(X,'Normalization','probability','BinWidth',1)
hold on; 
x=-5:0.1:15;
plot(x,gampdf(x,5.5,1),'LineWidth',2)
%set attributes of the figure
title('Gamma distribution simulation and theoretical curve')
xlabel('Event');
ylabel('Probability')
legend('Simulation','Theoretical')