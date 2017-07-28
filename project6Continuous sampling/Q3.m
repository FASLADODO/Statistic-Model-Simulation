clear 
t=-10:0.1:10;
alpha=[0.5,1,1.8,2.0];%set alpha
beta=0.7;%set beta 
gama=1;%why 1?
for z=1:length(alpha)
    for i=1:10000
    X(i)=Sim(alpha(z),beta);
    end
subplot(2,2,z);
histogram(X,'Normalization','probability','Binwidth',1)
hold on;%above code obtain simulation histogram 
T=stblpdf(t,alpha(z),beta,gama,0);%obtain theoretical values 
plot(t,T,'LineWidth',2)
%set plot attributes 
axis([-10 10 0 0.6])
title(['alpha=', num2str(alpha(z)),'    beta=',num2str(beta)])
xlabel('Event');
ylabel('Probability')
legend('Simulation','Theoretical')
end