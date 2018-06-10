function J = computeCost(X, y, theta)
	m = length(y);
	J = 0;
	predictions = X * theta;
	sq_errors = (predictions - y).^2;
	J = (1/(2 * m)) *sum(sq_errors);
end


function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
	m = length(y);
	J_history = zeros(num_iters, 1);

	for iter = 1:num_iters
		htheta = X*theta;
		theta0 = theta(1) - (alpha / m) * sum((htheta - y) .* X(:, 1));
		theta1 = theta(2) - (alpha / m) * sum((htheta - y) .* X(:, 2));
		theta = [theta0; theta1];
		J_history(iter) = computeCost(X, y, theta);
	end
end

fprintf('Running Gradient Descent ...\n');

data = load('ex1data1.txt');
y = data(:, 2);
m = length(y);
X = [ones(m, 1), data(:, 1)];

theta = zeros(2, 1);

iterations = 1500;
alpha = 0.01;

computeCost(X, y, theta)

theta = gradientDescent(X, y, theta, alpha, iterations);

fprintf('Theta found by gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));

hold on;
plot(X(:, 2), X*theta, '-')
legend('Training data')
hold off

predict1 = [1, 3.5] * theta;
fprintf('For population = 35,000, we predict a profit of %f\n', ...
	predict1*10000);

predict2 = [1, 7] * theta;
fprintf('For population = 70,000, we predict a profit of %f\n', ...
	predict2*10000);

fprintf('Program paused. Press enter to continue\n');
pause;