M = [4 1 3; 9 2 5; 7 8 6];
m = astar(M, @hamming);
% decomente esta linha para ver as movimentacoes
reconstruct_path(m);

function [n, error] = astar(M, h)
  printf("teste");
  error = 0;
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
	    
	    % Remove um nó m com a menor prioridade na fila q
	    m = q.extractMin();    
	    
	    
	end


end