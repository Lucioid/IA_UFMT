
% Universidade Federal de Mato Grosso
% Inteligência Artificial
%
% Este código contém uma demonstração da aplicação de algoritmos genéticos 
% para o problema das _N_ rainhas. Neste problema, devemos encontrar 
% uma maneira de dispor _N_ rainhas em um tabuleiro NxN de tal  
% que nenhuma delas seja atacada.
% Cada estado do problema é representado por um vetor de N posições. 
%
% Nota: este é um código ilustrativo que deliberadamente não segue nenhum
% padrão de projeto.
%
% author: raoni at ufmt dot br

% Apenas para octave
pkg load statistics

%Parâmetros
M = 100; %quantidade de amostras
P = 0.3; %probabilidade de mutacao
N = 8; % Número de rainhas e de dimensões do tabuleiro

% Populacao inicial aleatoria
Pop = randi(N, M, N);
    
% Avaliacao de aptidao da populacao
[AP, APMax] = evaluate(Pop);
% maior aptidao - o programa para quando m = 28
[m, indx] = max(AP(:)); 

APMax
geracoes = 1; %conta a quantidade de gerações utilizadas

while m < APMax, 

    % Selecao
    S = randsample(1:M, M, true, AP);
    
    % vetor que receberá a nova população (após cruzamento e mutação)
    nPop = zeros(size(Pop));

    % Cruzamento e mutação
    for i=1:2:M-1,
        
        % Seleciona a posição ao redor da qual será realizada o cruzamento
        k = randi(N);
        
        % Concatena o primeiro vetor do cruzamento
        nPop(i, 1:k) = Pop(S(i), 1:k);
        nPop(i, k+1:end) = Pop(S(i+1), k+1:end);
        
        % Concatena o segundo vetor do cruzamento
        nPop(i+1, 1:k) = Pop(S(i+1), 1:k);
        nPop(i+1, k+1:end) = Pop(S(i), k+1:end);


        % Realiza a mutacao de um determinado gene com probabilidade P no 
        % primeiro vetor        
        if rand() < P,
            p = randi(N);
            nPop(i,p) = randi(N);
        end
        
         % Realiza a mutacao de um determinado gene com probabilidade P no 
        % segundo vetor
        if rand() < P,
            p = randi(N);
            nPop(i+1,p) = randi(N);
        end
    end
    
    Pop = nPop;
    AP = evaluate(Pop);
    [m, indx] = max(AP(:));
    
    geracoes = geracoes + 1;
end

fprintf('O melhor estado encontrado foi:\n');
disp(Pop(indx,:))
fprintf('Custo deste estado é: %.0f\n', APMax-m);
fprintf('O numero de gerações: %d\n',geracoes);


