%2_2
clear


TRIES=[100,1000];
lambda=120;
%generate a theoretical poisson p.d.f
Theo_Poisson=poisspdf(lambda,90:0.1:159)
%generate a simultaiton histgram with inverse transform method
for z=1:2
    for i=1:TRIES(z)
temp=rand;
j(i)=1;
while(temp>sum(poisspdf(lambda,1:j(i))))
    %inverse transform methodequal to exp(-lambda).*lambda.^k(i)/factorial(k(i))+p
j(i)=j(i)+1;
end
end
        subplot(1,2,z);
         histogram(j,1)
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%
         bins=  range(j)%rescale the bandwidth of p
        histogram(j,bins,'Normalization','probability')
        hold on
        plot(90:0.1:159,Theo_Poisson,...
    'LineWidth',3,...
    'MarkerFaceColor',[0.5,0.5,0.5]);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        title(['TRIE: ',num2str(TRIES(z)),' TIMES']);
        ylabel('The Frequency of N');
        xlabel('The Possible number N of car arrviing per one hour');
end
