%Q5
clear
N=10000
p=[6 6 6 6 6 15 13 14 15 13]/100
x(1:10)=0;
for j=1:N
temp=rand;
for i=1:10
    x(i)=x(i)+(temp<sum(q(1:i)));
end
end
X=[x(1),diff(x)];
sampleX=X/N;
bar(sampleX);
hold on
plot(q,'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5]);
title('Probability')
xlabel('p(i)');
ylabel('frequency')
legend('Simulation','Theoretical')
sprintf('Sample mean: %f Sample variance: %f\n Theoretical mean:  %f ...Theoretical variance: %f',mean(sampleX),var(sampleX),mean(q),var(q))
