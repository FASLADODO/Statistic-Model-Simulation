%Q1
clear
N=100;
TRIES=1;
THREDSHOD=0.5;
for i=1:TRIES
isHEAD=rand(1,N)>THREDSHOD;
runs=reshape(find(xor([0,isHEAD],[isHEAD,0])==1),2,[]);
run=runs(2,:)-runs(1,:)
longest=max(run);
T(i)=sum(runs(2,:)-runs(1,:));
end
histogram(isHEAD);
%title('The Histogram for the Bernoulli Outcomes')
%xlabel('Outcomes:HEADS(1)/TAILS(0)');
%ylabel('Frequency of the Outcome');
%disp('The longest run is:')
%disp(longest)

%histogram(T)
%title('The Histogram of Towssing(TRIES:1)')
%xlabel('The Number of Head');
%ylabel('Frequency of the Same Head Number');


histogram(run)
title('The Histogram of Runs Lengths of TOSSING 100 Times')
xlabel('The Frequency of Possible Runs Lengths');
ylabel('The Possible Runs Lengths');
