% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Script Octave/MATLAB que deve ser utilizado para testar a implementação da
% parte principal do exercício.
% Este arquivo não deve ser alterado
% author: raonifst at gmail dot com
clear
clc

% Utilizado para comparar objetos - NAO APAGUE! %
global id;
id = intmin;

% %
tic
% Teste 1
tic
M = [4 1 3; 9 2 5; 7 8 6];
m = astar(M, @hamming);
% decomente esta linha para ver as movimentacoes
reconstruct_path(m);
assert(m.eq(Node([1 2 3; 4 5 6; 7 8 9], 0)));
fprintf('Teste 1: OK\n');
toc

% Teste 2
tic
M = [9 1 3; 4 2 5; 7 8 6];
m = astar(M, @hamming);
reconstruct_path(m);
assert(m.eq(Node([1 2 3; 4 5 6; 7 8 9], 0)));
fprintf('Teste 2: OK\n');
toc

% Teste 3
tic
M = [4 9 5; 3 8 6; 7 1 2];
m = astar(M, @hamming);
reconstruct_path(m);
assert(m.eq(Node([1 2 3; 4 5 6; 7 8 9], 0)));
fprintf('Teste 3: OK\n');
toc

% Teste 4
tic
M = [5 3 2; 7 6 4; 8 1 9];
m = astar(M, @hamming);
reconstruct_path(m);
assert(m.eq(Node([1 2 3; 4 5 6; 7 8 9], 0)));
fprintf('Teste 4: OK\n');
toc

% Teste 5
tic
M = [4 6 7; 9 5 8; 2 1 3];
m = astar(M, @hamming);
reconstruct_path(m);
assert(m.eq(Node([1 2 3; 4 5 6; 7 8 9], 0)));
fprintf('Teste 5: OK\n');
toc
fprintf('Sua implementação está correta\n');
toc
