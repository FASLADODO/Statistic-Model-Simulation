tic;% Start the timer
clear all; close all; clc;

M1 = 1; % Mean of X
M2 = 2; % Mean of Y
V1 = 4; % Variance of X
V2 = 9; % Variance of Y

u1 = rand(1000000,1);
u2 = rand(1000000,1);

% Geberate X and Y that are N(0,1) random variables and independent
X = sqrt( - 2*log(u1)).*cos(2*pi*u2 ); 
Y = sqrt( - 2*log(u1)).*sin(2*pi*u2 );

% Scale them to a particular mean and variance 
x = sqrt(V1)*X + M1; % x~ N(M1,V1)
y = sqrt(V2)*Y + M2; % y~ N(M2,V2)
toc; % Read elapsed time from stopwatch(Q1_6 compare the computational time)

A=x+y;  h=histogram(A,'Normalization','probability','BinWidth',1);hold on; %Q1_2, generate histogram for A
NormX=-10:0.1:15;%Q1_3 overlay theoretical norm distribution plot 
plot(NormX,normpdf(NormX,M1+M2,sqrt(V1+V2)),'LineWidth',2);
Cov_XY=cov(x,y)%Q1_1: calculate the covariance of X and Y
Meanx=mean(x)%Q1_4 sample mean and var and compare 
Meany=mean(y)
%set attributes of the figure
title('Normal distribution simulation')
xlabel('Event');
ylabel('Probability')
legend('Simulation','Theoretical')



