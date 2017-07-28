clear
TRIES=[100,1000,10000]
SUM=0;

i=0;
for z=1:3
    for j=1:TRIES(z)
     SUM=0;
     i=0;
        while(SUM<4)
            SUM=rand+SUM;
            i=i+1;
        end
    x(j)=i;
    end
    subplot(1,3,z)
    hist(x)
    title(['TRIE: ',num2str(TRIES(z)),' TIMES']);
    xlabel('The Frequency of N');
    ylabel('The Possible N');
    mean(x)
end

