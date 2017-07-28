%4
clear
p=1./(1:60);
p=p./sum(p);
TRIES=[100,1000,10000];
for z=1:3
        for i=1:TRIES(z)
    N(i)=0;
    while(rand<(1-p(60)))
    N(i)=N(i)+1;
    end
        end
    subplot(1,3,z);
    hist(N)
    title(['TRIE: ',num2str(TRIES(z)),' TIMES']);
    ylabel('The Frequency of N');
        xlabel('The Possible number N of car arrviing per one hour');
    sprintf('Trials: %f, Mean: %f, Variance: %f\n', TRIES(z), mean(N),var(N))
end
    sprintf('Theoritically, we need to try %f times', 1/p(60))
