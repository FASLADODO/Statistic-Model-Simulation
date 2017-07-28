%Q1_a
clear
N=10000;
bound(1:2)=[-2,2]
bound(3)=0
syms x
%y=exp(x+x^2);
y=exp(-x^2)
handout=vpa(int(y,bound(1),bound(2)))
fx=inline(y);
bound(4)=max(fx(bound(1):0.01:bound(2)));
B = bound;
     R = rand(2, N);
     %Set the random samplings to the correct intervals
     R(1, :) = (B(2)-B(1))*R(1, :)+ B(1);
     R(2, :) = R(2, :)*(B(4) - B(3)) + B(3);
     area = (B(2)-B(1))*(B(4)-B(3));
     s = fx(R(1,:))>=R(2,:);
     total = sum(s);
     avgF = total/N;
     Approx = avgF*area
     plot(R(1,:),fx(R(1,:)),'*')
     hold on 
     plot(R(1,:),R(2,:),'b*')

