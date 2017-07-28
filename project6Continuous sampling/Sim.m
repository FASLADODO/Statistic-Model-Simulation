function X=Sim(alpha,beta2)
    gama=pi*rand()-pi/2;
    W=exprnd(1);
    K=alpha-1+sign(1-alpha);
    gama0=-pi/2*beta2*K/alpha;
if alpha ~=1
    X=sin(alpha*(gama-gama0))/(cos(gama))^(1/alpha)*(cos(gama-alpha*(gama-gama0))/W)^((1-alpha)/alpha);
    if X>10 X=11;
    elseif X<-10 X=-11;
        %some of too large or too small values are set to a fixed value so that when plot the figure, 
        %they will not influence the other value.
    end
elseif alpha==1
    X=(pi/2+beta2*gama)*tan(gama)-beta2*log10(W*cos(gama)/((pi/2)+beta2*gama));
end 


    