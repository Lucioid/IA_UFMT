function J = computeCost(X, y, theta)
%COMPUTECOST Calcula o Custo da regressão com o parâmetro theta
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% 
m = length(y); % numero de examplos de treinamento 

% Voce deve preencher a variável J adequadamente
J = 0;

predictions = X*theta;              % predictions of hypothesis on examples
sqrErrors   = (predictions - y).^2; % squared errors

J = 1/(2*m) * sum(sqrErrors);

%
% =========================================================================

end
