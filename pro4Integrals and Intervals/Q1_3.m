clear
N=10000;
bound(1:4)=[0,1,0,1]
bound(5)=0
syms x y
%y=exp(x+x^2);
%y=exp(-x^2)
z=exp(-(x+y).^2);
%handout=vpa(int(y,bound(1),bound(2)))
%fx=inline(y);
fx=inline(z);
handout=vpa(int(int(z, x, 0, 1), y, 0, 1))
bound(6)=max(fx(bound(1):0.01:bound(2),bound(3):0.01:bound(4)));
B = bound;
     R = rand(3, N);
     %Set the random samplings to the correct intervals
     R(1, :) = (B(2)-B(1))*R(1, :)+ B(1);
     R(2, :) = R(2, :)*(B(4) - B(3)) + B(3);
     R(3, :) = R(3, :)*(B(6) - B(5)) + B(5);

     V = (B(2)-B(1))*(B(4)-B(3))*(B(6)-B(5));
     s = fx(R(1,:),R(2,:))>=R(3,:);
     total = sum(s);
     avgF = total/N;
     Approx = avgF*V




