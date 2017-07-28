clear
N=10000;
p=[6 6 6 6 6 15 13 14 15 13]/100
q=0.1;
c=max([p,q])/q
for i = 1:N, k = 0;
    while(1)
        k = k + 1;
         j = 1 + floor(10*rand);   % Get Uniform j
	 if (c*rand) < p(j)/0.1  % Accept p(j) if U<p(j)/c, q(j)= 0.1
	 X(i) = p(j); C(i) = k; 
         break
         end
     end
end
sprintf('Simulation efficience: %f\n My estimate: %f', 1/mean(C),sum(p/c))
%my estimate 
% Check mean X and C
%disp([ mean(X) sum(p.*[1:10]) mean(C) ])
