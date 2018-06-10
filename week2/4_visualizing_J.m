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

data = load('ex1data1.txt');
y = data(:, 2);
m = length(y);
X = [ones(m, 1), data(:, 1)];

theta = zeros(2, 1);


iterations = 1500;
alpha = 0.01;

computeCost(X, y, theta)

theta = gradientDescent(X, y, theta, alpha, iterations);

% ---------------Starts from here

fprintf('Visualizing J(theta_0, theta_1 ...\n')

theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

J_vals = zeros(length(theta0_vals), length(theta1_vals));

for i = 1:length(theta0_vals)
	for j = 1:length(theta1_vals)
		t = [theta0_vals(i); theta1_vals(j) ];
		J_vals(i, j) = computeCost(X, y, t);
	end
end

J_vals = J_vals';

figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('theta_0'); ylabel('theta_1');
pause;
figure;
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('theta_0'); ylabel('theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
pause;