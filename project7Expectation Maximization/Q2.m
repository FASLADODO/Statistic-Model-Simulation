clear
for i=1:10000
    x=rand;
    n1=normrnd(-1,1);
    n2=normrnd(1,1);
    if x>0.4    X(i)=n2;
    else X(i)=n1;       
    end 
end

hold on
norm_x=-5:0.1:5;
y=0.4*normpdf(norm_x,-1,1)+0.6*normpdf(norm_x,1,1);
plot(norm_x,y);
histogram(X,'Normalization','probability','Binwidth',1)
title('Mixture distribution')
xlabel('Event');
ylabel('Probability')
