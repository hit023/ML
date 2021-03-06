function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
a=((-y)')*log(sigmoid(X*theta));
b=(y-1)'*log(1-sigmoid(X*theta));
c=a+b;
%d=(theta)'*(theta);
e=theta(2:length(theta));
f=e'*e;
J=c/m+(lambda/(2*m))*f;

newx=X(:,2:size(X,2));
prediction=sigmoid(X*(theta));
difference=(prediction-y); 
tp=(newx)'*(difference);
n=ones(1,length(y))*(sigmoid(X*theta)-y);    
grad(1)=n/m;
grad(2:length(theta))=(1/m)*tp+(lambda/m)*e;
% =============================================================

end
