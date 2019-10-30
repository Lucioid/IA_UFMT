
% Universidade Federal de Mato Grosso
% Inteligência Artificial
%
% Este código contém uma demonstração da aplicação do algoritmo de subida 
% de encosta para o problema das _N_ rainhas. Neste problema, devemos
% encontrar uma maneira de dispor _N_ rainhas em um tabuleiro NxN de tal  
% que nenhuma delas seja atacada.
% Cada estado do problema é representado por um vetor de N posições. 
%
% Nota: este é um código ilustrativo que deliberadamente não segue nenhum
% padrão de projeto.
%
% author: raonifst at gmail dot com 


%Parâmetros
% Numeros de rainhas e dimensão do tabuleiro
N = 4;


atual_estado = randi(N,  1, N); % estado inicial aleatório
melhor_estado = atual_estado; % vetor que representa o melhor estado encontrado até o momento 
val_melhor = evaluate(melhor_estado); % valor da função de avaliação para o melhor estado até o momento

it = 0;

while 1, %loop infinito (a instrução break interrompe este laço)
    
    proximo_estado = atual_estado;
    
    % gera todos os estados vizinhos - de acordo com a definição, há 56
    % estados vizinhos
    for i=1:N,         
        for j=1:N,
            
            if atual_estado(i) ~= j,
                
                proximo_estado(i) = j;
                
                % neste ponto, proximo_estado é um dos estados vizinhos ao 
                % estado atual
                
                if evaluate(proximo_estado) < val_melhor,
                    melhor_estado = proximo_estado;
                    val_melhor = evaluate(proximo_estado);
                end
            end
        end
        proximo_estado = atual_estado;
    end
    
    % verifica se melhor_estado é igual ao atual_estado 
    % lembre-se de que chegamos em um mínimo (local ou global) sempre
    % que o estado melhor estado é igual ao atual (i.e., estaod nao muda)
    if sum(atual_estado ~= melhor_estado) > 0, 
        atual_estado = melhor_estado;
     else
         break; 
    end
    
    it = it + 1; % qtde de iterações
end


fprintf('O melhor estado encontrado foi:\n');
disp(melhor_estado)
fprintf('Custo deste estado é: %.0f\n', val_melhor);
fprintf('O numero de iterações utilizado foi: %d\n',it);
    
