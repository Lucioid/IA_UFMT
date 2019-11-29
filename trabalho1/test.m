% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Script Octave/MATLAB que deve ser utilizado para testar a implementação.
%
% author: raonifst at gmail dot com

clear
clc

% Utilizado para comparar objetos - NAO APAGUE! %
global id;
id = intmin;
% %
M = [4 9 5; 3 8 6; 7 1 2];
dist = manhattan(M);
disp(dist);
%crie mais testes aqui
