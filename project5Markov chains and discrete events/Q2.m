% Program to simulate a Markov chain
% The program assumes that the states are labeled 1, 2, ...
% Below is a sample, which you can change them according to the project
 clear all; close all; clc; 
input=eye(201)
 N = 100;          % number of individuals
% transition matrix
 P=zeros(2*N+1,2*N+1); 
 for i = 1:2*N+1
     for j = 1:2*N+1
         P(i,j) = nchoosek(2*N,j-1)*((i-1)/(2*N))^(j-1)*(1-(i-1)/(2*N))^(2*N-j+1);
     end
 end
 for state=1:201
n=2000;           % number of time steps to take
output=zeros(n+1,2*N+1); % clear out any old values
t=0:n;          % time indices
output(1,:)=input(state,:); % generate first output value 
i = 0;
for i=1:n,
  output(i+1,:) = output(i,:)*P;
  %a tolerance check to  automatically stop the simulation when the density is close to its steady-state
  LIT = ismembertol(output(i+1,:),output(i,:));
  if all(LIT == 1)     
      break;
  end
        steady(state,:)=output(end,:);
end
 end
 plot(steady(:,1)')
 hold on 
 plot(steady(:,end)')
 legend('(200A1,0A2)','(200A2,0A1)')
 xlabel('initial state where the "1" locates');
 title('propability for state 1 (200A1, 0A2)] and (0A1, 200A2)');
ylabel('propability');

  