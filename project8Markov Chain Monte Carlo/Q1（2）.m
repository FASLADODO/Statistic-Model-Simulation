clear;
N=1000000;
x=2*rand(2,N)-1;
g = cos(pi+sum(5*x));
y=(rand(1,N)*2-1).*max(g);
sum1=0;
sum2=0;
for i=1:N
    if(g(i)>=0)
       if(g(i)>y(i)&&y(i)>0)
           sum1=sum1+1;
       end
    elseif(g(i)<y(i)&&y(i)<0)
        sum2=sum2+1;
    end
end
area=(sum1-sum2)/N*2*(max(g)-min(g))
disp([area*2 2*std(g)/sqrt(N)])
%---------------Stratified sampling:
clear
g = @(x)cos(pi+sum(5*x));
N = 100000; X = g(2*rand(2,N)-1); % Simple MC
disp([mean(X)*2*2 2*std(X)/sqrt(N)])
K = 10; Nij = N/K^2; % Stratified
for i = 1:K
for j = 1:K
XS = g([-1+2*(i-1)/K+2*(rand(1,Nij)/K);-1+2*(j-1)/K+2*(rand(1,Nij)/K)]);
XSb(i,j) = mean(XS); SS(i,j) = var(XS);
end
end, SST = mean(mean(SS/N));
disp([mean(mean(XSb))*2*2 2*sqrt(SST) ])
%--------------------Importance sampling
clear;
N = 1000000; U = -1+2*rand(2,N); T = cos(pi+sum(5*U));;
disp( [mean(T)*2*2 2*std(T)/sqrt(N)]) % simple MC
e = exp(1/2); X = (acos(U)-pi)/5;
T = (cos(pi+sum(5*X)))/10/(-e);
disp( [mean(T)*2*2 2*std(T)/sqrt(N)])