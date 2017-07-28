mu = [1,2,3];
sigma = [3,-1,1;-1,5,3;1,3,4];
rng default  % For reproducibility
r = mvnrnd(mu,sigma,1000);
       plot(r(:,1),r(:,2),'.');
%----------------------
clear
Z=0;
Xsum=0
for i=1:1000
z1=normrnd(0,1);
z2=normrnd(0,1);
z3=normrnd(0,1);
mu = [1,2,3];
sigma = [3,-1,1;-1,5,3;1,3,4];
A=chol(sigma);
X(1:3,i)=A*[z1,z2,z3]'+mu'
end
subplot(2,2,1);
histogram(X(1,:));
title('X1')
xlabel('Event');
ylabel('Frequency')

subplot(2,2,2);
histogram(X(2,:));
title('X2')
xlabel('Event');
ylabel('Frequency')

subplot(2,2,3);
histogram(X(3,:));
title('X3')
xlabel('Event');
ylabel('Frequency')

subplot(2,2,4);
histogram(X(1,:));
hold on
histogram(X(2,:));
hold on
histogram(X(3,:));
title('X1,X2,X3 overlay figure')
xlabel('Event');
ylabel('Frequency')
legend('X1','X2','X3')

