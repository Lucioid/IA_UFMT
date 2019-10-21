% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Script Octave/MATLAB que deve ser utilizado para testar a implementação 
% do exercício de aquecimento.
% Este arquivo não deve ser alterado
%
% author: raonifst at gmail dot com

clear 
t=-1;
% Teste 1 %
if(contagem([1,2,3;1,7,6;5,4,2]) == 2)
  fprintf('Teste 1: OK\n');
  t=1;
endif
% Teste 2 %
if(contagem([1 0 1; 1 0 1; 1 0 1]) == 6)
  fprintf('Teste 2: OK\n');
  t=2;
endif
% Teste 3 %
if(contagem(eye(3)) == 3)
  fprintf('Teste 3: OK\n');
  t=3;
endif
% Teste 4 %
if(contagem([1 1 1; 1 0 1; 1 0 1]) == 7)
  fprintf('Teste 4: OK\n');
  t=4;
endif

% Teste 5 %
if(contagem([0 1 0; 0 0 1; 0 0 1]) == 3)
  fprintf('Teste 5: OK\n'); 
  t=5;
endif

if(t>-1 & t<6)
  fprintf('Sua implementação está correta!\n');
else
  fprintf('Sua implementação está incorreta!\n');
endif