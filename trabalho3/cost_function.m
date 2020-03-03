function [J grad] = cost_function(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%COST_FUNCTION implementa a função de custo da rede neural
%   [J grad] = COST_FUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) calcula a função de custo  e o gradiente da rede.
%

% Não altere!!
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Variáveis úteis
m = size(X, 1);

% Você deve preencher as seguintes variáveis corretamente
J = 0;
Theta1_grad = zeros(size(Theta1)); % gradiente de Theta1
Theta2_grad = zeros(size(Theta2)); % gradiente de Theta2



% Mudança de representação de y para um vetor Y
I = eye(num_labels);
Y = zeros(m, num_labels);
for i=1:m
  Y(i, :)= I(y(i), :);
end

% =============== Sua implementação deve ser vir aqui ==================
%Obter valores da ultima camada por feedforward
p = zeros(m, 1);
bias1 = ones(5000,1);
a1 = [ones(size(X),1) X];
z2 = a1*Theta1';
a2_= [ones(size(z2),1) z2];
a2 = sigmoid(a2_);
z3 = a2*Theta2';
a3 = sigmoid(z3);

%erro da camada de saída
E1 = (a3-y)






% Não altere esta linha!!
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
