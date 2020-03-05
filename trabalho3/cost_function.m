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
a1 = [ones(size(X),1) X];
z2 = a1*Theta1';
a2_= [ones(size(z2),1) z2];
a2 = sigmoid(a2_);
z3 = a2*Theta2';
a3 = sigmoid(z3);
J=(1/m)*sum(sum(-Y.*log(a3)- (1-Y).*log(1-a3))) + (lambda/(2*m))*(sum(sum(Theta1.*Theta1))+sum(sum(Theta2.*Theta2)));
%erro da camada de saída
gamma3 = (a3-y);
gamma2 = (gamma3*Theta2).*sigmoidGradient([ones(size(z2,1),1) z2]);
gamma2 = gamma2(:,2:end);
delta1=(gamma2'*a1);
delta2=(gamma3'*a2);

%Theta1_grad=(1/m)*delta1;
%Theta2_grad=(1/m)*delta2;

%regularização do gradiente

p1 = (lambda/m)*[zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];
p2 = (lambda/m)*[zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];
Theta1_grad = ((1/m)*delta1)+p1;
Theta2_grad = ((1/m)*delta2)+p2;


% Não altere esta linha!!
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
