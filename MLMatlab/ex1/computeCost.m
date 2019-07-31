function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression


% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


J = sum((X*theta-y).^2)/2/m;

% =========================================================================

end
