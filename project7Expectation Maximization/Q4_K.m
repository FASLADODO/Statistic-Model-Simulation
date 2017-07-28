%% Generate data for kmeans
clear
X= load('data.txt');
figure(1)
X=X(:,2:3);
plot(X(:,1), X(:,2), 'o');
title('Data Points without Labels')

%% kmeans and scatter plot
[y C] = kmeans(X,2); % Find the assignment y and the means C of each cluster

figure(2)
plot(X(y==1,1),X(y==1,2), 'x');
hold on
plot(X(y==2,1),X(y==2,2), 'o');

plot(C(1,1),C(1,2), 'rx','LineWidth',2);
plot(C(2,1),C(2,2), 'ro','LineWidth',2);

legend('Points of cluster 1','Points of cluster 2')
title('Data Points with Labels by K-means Clustering')
hold off