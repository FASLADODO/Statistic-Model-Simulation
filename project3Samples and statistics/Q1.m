%theoretically 
clear
TOTAL=125;
DEFECTIVE=6;
FINE=TOTAL-DEFECTIVE;
TRIES=5;i=0;P=0;REJECT=0.95;
while(sum(P)<REJECT)
    i=i+1;
    TOTAL=125;
    DEFECTIVE=6;
    FINE=TOTAL-DEFECTIVE;
    P(i)=1;
    for j=1:i-1
    P(i)=P(i)*FINE/TOTAL;
    TOTAL=TOTAL-1;
    FINE=FINE-1;
    end
    P(i)=P(i)*DEFECTIVE/TOTAL;
    X(i)=sum(P);
end
sprintf(' fewest number of microchips that the distributor should test to reject this lot %d is: \n %d', REJECT, i)

