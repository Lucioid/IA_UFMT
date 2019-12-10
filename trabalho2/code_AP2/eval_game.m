% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Função Octave/MATLAB que implementa
%
% author: raonifst at gmail dot com

function [ score ] = eval_game_a( Board, depth,  player)
       %testar pontuação do jogador 1
       scoreA=find_streak(Board,1,4);
       %testar pontuação do jogador 2]
       scoreB=find_streak(Board,2,4);
       if(scoreA>scoreB)
         score=(scoreA*-1);
       else
         score= scoreB;
end
