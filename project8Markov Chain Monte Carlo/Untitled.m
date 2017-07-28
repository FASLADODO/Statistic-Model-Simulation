x = linspace(-500,500); % Generate a row vector of 100 linearly equally spaced points between -512 and 512
y = linspace(-500,500); % Generate a row vector of 100 linearly equally spaced points between -512 and 512
[X,Y] = meshgrid(x,y);  % Obtain 100x100 pairs of points in matrix form from vectors x and y
Z = 418.9829*2-X*sin(sqrt(abs(X))+Y*sin(sqrt(abs(Y))));% Compute f(x,y) in matrix form

% Compute f(x,y) in matrix form

figure(1)
contour(X,Y,Z); % Plot a contour plot
colorbar;

figure(2)
mesh(X,Y,Z); % Plot a mesh plot
colorbar;
xlim([-500 500]);
ylim([-500 500]);