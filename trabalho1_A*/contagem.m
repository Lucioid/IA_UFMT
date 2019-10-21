% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Função Octave/MATLAB que deve contar a quantidade de elementos
% com valor igual a 1 (um) em uma matriz __M__ de entrada.
%
# author: raonifst at gmail dot com
function [ c ] = contagem( M )
a= size(M)
cont = 0;
for i=1:a(1)
  for j = 1: a(2)
    if(M(i,j)==1)
      cont++;
      disp(M(i,j));
    endif
  endfor
endfor
c=cont;

endfunction