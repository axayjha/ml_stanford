function [X_norm, mu, sigma] = featureNormalize(X)
	X_norm = X;
	mu = zeros(1, size(X, 2));
	sigma = zeros(1, size(X, 2));

	mu = mean(X);
	sigma = std(X);

	for i = 1:size(X, 2)
		X_norm(:, i) = (X(:, i) - mu(i)) / sigma(i);
	end
end

%----------------------------------------------------

function J = computeCostMulti(X, y, theta)
	m = length(y);
	J = (X*theta - y)' * (X*theta - y) / (2*m);
end

%----------------------------------------------------

function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
	m = length(y);
	J_history = zeros(num_iters, 1);
	for iter = 1:num_iters
		htheta = X * theta;
		theta_tmp = zeros(3,1);
		for row = 1:size(theta, 1)
			theta_tmp(row) = theta(row) - alpha/m * sum((htheta - y) .* X(:, row));
		end 
		theta = theta_tmp;

		J_history(iter) = computeCostMulti(X, y, theta);
	end
end

%----------------------------------------------------

fprintf('Loading data ...\n');
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

[X mu sigma] = featureNormalize(X);

X = [ones(m, 1) X];
fprintf('Running gradient descent ...\n')
alpha = 0.3;
num_iters = 100;
theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

figure;
plot(1: numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

price = ([1, 1650, 3] - [0 mu]) ./ [1 sigma] * theta;

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);

fprintf('Program paused. Press enter to continue.\n');
pause;
