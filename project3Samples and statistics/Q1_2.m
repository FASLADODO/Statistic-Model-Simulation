%Q1(2
clear
B=ones(1,125);
B(1:6)=0;
DEFECT_N=0;
N=10000;


EXPERIMENT=0;
while(DEFECT_N/N<0.95)
     if(EXPERIMENT==5)
        sprintf('the propability of 5 tires to rejecct: %2f ',DEFECT_N/N)
     end
    EXPERIMENT=EXPERIMENT+1;
    DEFECT_N=0;
for z=1:N%N experiments
      A=B;
      i=0;
    while(i<EXPERIMENT)%the time to try 
    i=i+1;
    j=ceil(125*rand);
        if(A(j)==1)
            A(j)=2;%without replacement
        elseif(A(j)==0)
            DEFECT_N=DEFECT_N+1;
            break;
        else
            i=i-1;   
        end
    end
end
end
sprintf('Try %d times to get 95%% reject', EXPERIMENT)

