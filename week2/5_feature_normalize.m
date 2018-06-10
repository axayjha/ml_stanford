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

fprintf('Loading data ...\n');

data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10, :) y(1:10, :)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

X = [ones(m, 1) X]
