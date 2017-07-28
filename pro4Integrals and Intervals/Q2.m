%Q2
clear
n=[10,100,1000];
for q=1:3
for i=1:n(q);
       for j=1:4;
       z(j)=randn;
       end
    X(i)=z(1).^2+z(2).^2+z(3).^2+z(4).^2;%randn: Normally distributed random numbers 
 end
X=sort(X);
subplot(1,3,q);

figure(1);
stairs(X,1/n(q):1/n(q):1,'b','linewidth',2);%X is the sample. 
%The probablity of X1,X2,X3 may be 0.2, 0.5,0.3(pdf) or 0.2,0.7,1(cdf), 
%in this case, it is cdf. The theory of cdf is:
%sort all of the samples,
%give each sample a number, 1, 2, 3, ...n in a accending order
%when the sequence(or the sample number) is standared, it become the cdf of the samples scpace. 
hold on 
grid on
x=0:0.2:15;
y=chi2cdf(x,4);
plot(x,y,'r--','linewidth',2);
hold off
legend('Empirical cdf','Theoretical cdf');
ylim([0 1.05]);
xlabel('x');
ylabel('F(x)');
title(['empirical distribution for ',num2str(n(q)) , ' sample number']);

sprintf('Sample number: %d, Theoretical 25th, 50th, 90th percentiles:%f,%f,%f',...
n(q),chi2inv(0.25,4),chi2inv(0.5,4),chi2inv(0.90,4))
sprintf('Smaple number: %d, Empirical 25th, 50th, 90th percentiles:%f,%f,%f',...
n(q),X(ceil(0.25*n(q))),X(ceil(0.5*n(q))),X(ceil(0.9*n(q))))
sprintf('sample number: %d difference of 25th, 50th, 90th percentiles between Empirical and theoretical confidence interval:\n%f,%f,%f',...
  n(q),abs(chi2inv(0.25,4)-X(ceil(0.25*n(q)))),abs(X(ceil(0.5*n(q)))-chi2inv(0.5,4)),abs(X(ceil(0.9*n(q)))-chi2inv(0.90,4)))
end


