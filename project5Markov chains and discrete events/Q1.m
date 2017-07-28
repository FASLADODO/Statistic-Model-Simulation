clear 
close all; clc;
% initial value of all variables
x = 0; % 50 products on hand    ???  x=0
y = 0;%number  ----job number
Ts = 0; %time interval 
T = 100; % the total time we want to analyze
i = 1;
while(Ts(i) < T)
   
    % generate nonhomogeneous Poission event
    % lamda(t) = is the time !! for one job
    lambda = 19;
   t=0;
    while(t<T)
       u1 = rand ();
       t = Ts(i) - 1/lambda*log(u1);%why log?
       u2 = rand();
       if(mod(t,10)<5&&mod(t,10)>0)
           %pare=11111
           pare=(3*mod(t,10)+4)/lambda;
       else 
           pare=(34-3*mod(t,10))/lambda;
       end
       if (u2 <= pare)% ok, draw a digram and you will understand 
           Ts(i+1) = t;
           i = i + 1;
           break;
       end
    end
end   
Ts(end)=100
interval=diff(Ts)
remainder=interval(1);
sum=0;

for i=2:length(Ts)-1
while(remainder>0)
    r=0.3*rand();
    remainder=remainder-r;
    sum=sum+r;
end
remainder=interval(i)-exprnd(1/25)+remainder
end
sum