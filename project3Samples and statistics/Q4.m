%Q4
p=1./(1:60)
p=p./sum(p)
TRIES=[100,1000,10000]
for z=1:3
y=randsrc(TRIES(z),1,[1:60; p])%to use randsrc, MATLAB shoud be updated to 2016b 
        subplot(1,3,z);
           hist(y)
        title(['TRIE: ',num2str(TRIES(z)),' TIMES']);
        ylabel('The Frequency of N');
        xlabel('The Possible number N ');
end
