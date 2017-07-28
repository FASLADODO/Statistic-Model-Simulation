clear;
%Implement a random number generator for a random(the method used in Q1)
mu1 = [-3,3];
sigma1 = [1 0;0 1];
mu2 = [3,-3];
sigma2 = [1 0;0 1];
%mixture distribution, method in Q2
p=0.5;
for i=1:30000
x=rand;
if x>p
    r(i,:) = mvnrnd(mu1,sigma1,1);
else 
    r(i,:) = mvnrnd(mu2,sigma2,1);
end
end
%EM to estimate the paremeter 
tic;
GMModel = fitgmdist(r,2)
toc;
plot(r(:,1),r(:,2),'.');
title(' sphere')
xlabel('X1');
ylabel('X2')
axis([-8 8 -8 8])
