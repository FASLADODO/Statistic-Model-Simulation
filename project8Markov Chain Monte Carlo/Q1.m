clear;
N=1000;
x=rand(2,N);
g = exp(sum(5*abs(x-5)));
y=rand(1,N).*max(g);
sum=0;
for i=1:N
   if(g(i)>y(i))
       sum=sum+1;
   end
end
area=sum/N*max(g);
disp([area 2*std(g)/sqrt(N)])
%---------------Stratified sampling:
clear
g = @(x)exp(sum(5*abs(x-5)));
N = 1000; X = g(rand(2,N)); % Simple MC
disp([mean(X) 2*std(X)/sqrt(N)])
K = 10; Nij = N/K^2; % Stratified
for i = 1:K
for j = 1:K
XS = g([i-1+rand(1,Nij);j-1+rand(1,Nij)]/K);
XSb(i,j) = mean(XS); SS(i,j) = var(XS);
end
end, SST = mean(mean(SS/N));
disp([mean(mean(XSb)) 2*sqrt(SST) ])
%--------------------Importance sampling
clear;
N = 1000; U = rand(2,N); T = exp(sum(5*abs(U-5)));
disp( [mean(T) 2*std(T)/sqrt(N)]) % simple MC
e = exp(1); X = log(1+(e-1)*U);
T = (e-1)^2*exp(sum(5*abs(X-5))-sum(X));
disp( [mean(T) 2*std(T)/sqrt(N)])