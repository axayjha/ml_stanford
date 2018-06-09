function plotData(x, y)
	figure;
	plot(x, y, 'rx', 'MarkerSize', 10);
	ylabel('Profit in $10,000s');
	xlabel('Population of city in 10,000s');
end

%-----------------------------------

fprintf('Plotting Data ... \n');
data = load('ex1data1.txt');
X = data(:, 1); y = data(:, 2)
m = length(y);

plotData(X, y);

fprintf('Program paused. Press enter to continue.\n');
pause;