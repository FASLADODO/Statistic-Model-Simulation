%4
clear
x=input('The number of heads:')
TRIES=1;
THREDSHOD=0.5;
Count=0;
HEAD=0;
    while(HEAD<x)
    HEAD=HEAD+(rand(1)<THREDSHOD);
    Count=Count+1;
    end
disp('You need to toss:')
disp(Count)
disp('times')
100