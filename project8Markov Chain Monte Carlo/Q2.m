clear
N=100000;
x=exprnd(1,3,N);
mean=0;
for i=1:N
if(sum(x(:,i))>15)
    mean=mean+sum(x(:,i));
end
end
mean=mean/N
%==================
clear
N=100000;
x=exprnd(1,1,N);
X123=[0,0,0]';
mean=0;
for i=1:N
    if(sum(X123)>15)
        mean=mean+sum(X123);
    end
    X123(mod(i,3)+1)=x(i);%change one element one time 
end
mean=mean/N;

