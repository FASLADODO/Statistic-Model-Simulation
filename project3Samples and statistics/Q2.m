%Q2
clear
N=10000;
TRIES=[100,1000,10000];
E=120/N;
lambda=120
%generate a theoretical poisson p.d.f
Theo_Poisson=poisspdf(lambda,90:0.1:159)
for z=1:3
    for y=1:TRIES(z)
        for i=1:N
        CarArriving(i)=rand<E;
        end
        SumCarArriving(y)=sum(CarArriving);
    end
        subplot(1,3,z);
        bins=  range(SumCarArriving)%rescale the bandwidth of p
        histogram(SumCarArriving,bins,'Normalization','probability')
        hold on
        plot(90:0.1:159,Theo_Poisson,...
    'LineWidth',3,...
    'MarkerFaceColor',[0.5,0.5,0.5]);
        title(['TRIE: ',num2str(TRIES(z)),' TIMES']);
        ylabel('The Frequency of N');
        xlabel('The Possible number N of car arrviing per one hour');
end