% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Função Octave/MATLAB que deve implementar o algoritmo A-estrela.
% A função deve receber uma matriz __M__ com estado inicial do quebra-cabeça 
% o apontador para a função heurística __h__ e devolver um nó de busca __n__
% com o estado objetivo. Para que seja possível reconstruir o caminho percorrido 
% até a solução,  cada nó produzido pelo algoritmo de busca deve conter uma 
% referência para o nó que o descobriu (i.e., nó visitado no passo anterior).
%
% Para executar o algoritmo para um estado S com heurística de hamming por exemplo pode-ser fazer:
% S = [4 1 3; 9 2 5; 7 8 6];
% node = astar(S, @hamming);
% 
% Extra: A variável __error__ deve ser utilizada para identificar jogos que não 
% possuem solução. 
%
% author: raonifst at gmail dot com

function [n, error] = astar(M, h)
	
	error = 0;
  %Cria fila de prioridades
	q = PriorityQueue() ;
  %Define estado Objetivo
	O = [1 2 3; 4 5 6; 7 8 9]; 
	%atribui a n o nó inicial, custo 0
 	n = Node(M, 0);
  q.insert(n.f+h(n.State), n.State);
  % Insere o nó __n__ na fila de prioridades __q__. O custo deste nó 
	% é igual a n.f+g(n.State). __g__ é um apontador para função heurística
	% considerada
	#q.insert(n.f+h(n.State), n);
	% Laço principal do algoritmo A-estrela - é interrompido quando a fila 
  %ficar vazia ou o estado do nó for = objetivo
  show(M);
  input("Matriz inicial");
	while (~q.isempty())
    if isequal(n.State,O);
        n = m;
        break;
    end
      m = q.extractMin();
      moves = legal_moves(m.State); #recebe os movimentos possiveis dado o estado __n.State__
      input("\nExecutar movimentos validos\n");
      #percorre o vetor de possiveis movimentos e atribui a N
      for i=1:size(moves, 1) 
        new_state = do_move(m.State, moves(i));
       #printf("N(%d): %d \n",i,N.state);
        show(new_state);
        input("\nProximo Movimento\n");
        new = Node(new_state,m.f+1); # Como implementar a prioridade (custo nó anterior +1) 
        q.insert(new.f+h(new.State), new.State);
        new.Prev = m;
      end
      input("\nFim da rodada\n");
	    % Remove um nó m com a menor prioridade na fila q
	    disp(m);
      input("Nó pai na proxima rodada");
	    
	end


end
