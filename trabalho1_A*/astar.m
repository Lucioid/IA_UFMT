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

	%Cria uma fila de prioridades vazia
	q = PriorityQueue() ;

	% Estado objetivo
	O = [1 2 3; 4 5 6; 7 8 9]; %Lembre-se de que seu programa deve para quando um estado objetivo for alcançado.

	% Cria um novo nó __n__ com estado igual a matriz __M__ (estado inicial) e
	% custo 0 (zero).
 	n = Node(M, 0);

	% Insere o nó __n__ na fila de prioridades __q__. O custo deste nó
	% é igual a n.f+g(n.State). __g__ é um apontador para função heurística
	% considerada
	q.insert(n.f+h(n.State), n);

	% Laço principal do algoritmo A-estrela - é interrompido quando a fila ficar vazia
	while (~q.isempty())
      m = q.extractMin();
	   if isequal(m.State,O)
        n=m;
        break;
     endif
     moves = legal_moves(m.State);
     for i=1:size(moves,1)
        new_s=do_move(m.State,moves(i));
				if isempty(m.Prev)
					new_n=Node(new_s,m.f+1);
					new_n.Prev=m;
					q.insert(new_n.f+h(new_n.State), new_n);
				else if ~isequal(new_s,m.Prev.State) %entra se for diferente
							new_n=Node(new_s,m.f+1);
							new_n.Prev=m;
							q.insert(new_n.f+h(new_n.State), new_n);
						 endif
				endif

     endfor
	end
end
