% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Função Octave/MATLAB que deve implementar a heurística de manhattan.
% A funçao deve receber uma matriz __State__ representando um estado
% qualquer do jogo e deve calcular a soma das distâncias (horizontal e
% vertical) de cada célula deste estado para a posição que ela deveria
% ocupar no estado objetivo.
%
%
% author: raonifst at gmail dot com

function dist = manhattan(State)
	Obj = [1 2 3; 4 5 6; 7 8 9];
	dist = 0;
	for i=1: 9;
		[x1,y1] = find(State == i);
		[x2,y2] = find(Obj == i);
		dist += (abs(x1-x2) + abs(y1-y2));
	end
end
