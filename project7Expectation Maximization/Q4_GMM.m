%% Generate data for kmeans
clear
X= load('data.txt');
X=X(:,2:3);
title('Data Points without Labels')
GMModel = fitgmdist(X,2);
% 2D projection
ezcontourf(@(x,y) pdf(GMModel,[x y]),[1.5,5.5],[40,100]);
hold on
plot(X(:,1), X(:,2), 'or');
