function [theta] = normalEqn(X, y)
	theta = pinv(X' * X) * X' * y;
end

%-----------------------------------------------------

fprintf('Solving with normal equations...\n');
data = csvread('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

X = [ones(m, 1) X];

theta = normalEqn(X, y);

fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');

price = [1 1650 3] * theta;

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);
