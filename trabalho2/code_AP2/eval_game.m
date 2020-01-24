% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Função Octave/MATLAB que implementa
%
% author: raonifst at gmail dot com

function [ score ] = eval_game( Board, depth,  player)

       %testar pontuação do computador
       scoreA=find_streak(Board, 1, 4);
       %testar pontuação do jogador 2
       scoreB=find_streak(Board, 2, 4);
       if scoreA==0
         scoreA=find_streak(Board,1,3);
       end
       if scoreB==0
         scoreB=find_streak(Board,2,3);
       end
       if  scoreB >= 1 || scoreB > scoreA
        score= -1*scoreB - depth;
       else
         score=scoreA;
      end

end
