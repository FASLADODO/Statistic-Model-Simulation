clear
clc
A=5*rand(1,10000)-3;
hist(A);%Q1(a)
Mean=mean(A)%mean
Variance=var(A)%variance
disp('Q1(c)confidence interval for sample mean: ')
Confidence_mean=bootstrp(10000,@mean,A);
x=sort(Confidence_mean);
ConMeanLow=x(250)
ConMeanHigh=x(10000-250)
disp('Q1(c)confidence interval for sample standard: ')
Confidence_std=bootstrp(10000,@std,A);
x=sort(Confidence_std);
ConStdLow=x(250)
ConStdHigh=x(10000-250)