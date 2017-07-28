clear;
clc;
%axil;
ResultX=0;
ResultY=0;
XMAX= 4;
  YMAX = 4;
%initialize 
 MarkovLength = 10000; 
 DecayScale = 0.95; 
 StepFactor = 0.02; 
 Temperature=30; 
 Tolerance = 1e-8; 
AcceptPoints = 0.0; 
rnd =rand;
% choose point randomly
PreX = -XMAX * rand ;
PreY = -YMAX * rand;
PreBestX  = PreX;
PreBestY = PreY;
PreX = -XMAX * rand ;
PreY = -YMAX * rand;
%begin at (0,0)
BestX = 0;
BestY = 0;
% itiration
mm=abs( ObjectFunction( BestX,BestY)-ObjectFunction (PreBestX, PreBestY));
itirationNumber=1000;%initial number
for circle=1:itirationNumber
%Temperature=DecayScale*Temperature;%polymial
%Temperature=Temperature/(log(itirationNumber+1));%log 
Temperature=exp(-itirationNumber*(itirationNumber)^(1/DecayScale));%

AcceptPoints = 0.0;
%
for i=0:MarkovLength:1
% 1) 
p=0;
while p==0
     NextX = PreX + StepFactor*XMAX*(rand-0.5);
    NextY = PreY + StepFactor*YMAX*(rand-0.5);
    if p== (~(NextX >= -XMAX && NextX <= XMAX && NextY >= -YMAX && NextY <= YMAX))
        p=1;
    end
end
% 2) 
if (ObjectFunction(BestX,BestY) > ObjectFunction(NextX,NextY))
% 
PreBestX =BestX;
PreBestY = BestY;
ResultX(circle)=NextX;
ResultY(circle)=NextY;
BestX=NextX;
BestY=NextY;

end
% 3) Metropolis
if( ObjectFunction(PreX,PreY) - ObjectFunction(NextX,NextY) > 0 )
  %//
PreX=NextX;
PreY=NextY;
AcceptPoints=AcceptPoints+1;
else
 changer = -1 * ( ObjectFunction(NextX,NextY) - ObjectFunction(PreX,PreY) ) / Temperature ;
rnd=rand;
p1=exp(changer);
double (p1);
if p1 > rand             %//
    PreX=NextX;
    PreY=NextY;
    AcceptPoints=AcceptPoints+1;
end
end
end
mm=abs( ObjectFunction(BestX,BestY)-ObjectFunction (PreBestX, PreBestY));
end
BestX
BestY
ObjectFunction(BestX, BestY)
