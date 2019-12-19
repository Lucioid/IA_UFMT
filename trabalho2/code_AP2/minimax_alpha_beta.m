function [ best_val, best_pos ] = minimax_alpha_beta( Board, depth, player, alpha, beta )
%     Minimax helper function: Return the minimax value of a particular board,
%     given a particular depth to estimate to
%
	debug=0;

	i = 1;
	best_val = nan;
	best_pos = randi(7);

	if is_terminal(Board, depth),
			best_val =  eval_game(Board, depth, player);
	else
			val = -inf;
			while i<8,
					[new_board, valid] = do_move( Board, i, player);
					if valid == 1,
							val = max(val,-1*minimax_alpha_beta(new_board, depth-1, opposite_player(player),-beta,-alpha));
								if val >= beta,
									best_val = val;
									best_pos = i;
									i = 8;
								else
									if isnan(best_val) || val > best_val
										best_val = val;
										best_pos = i;
									end
									alpha = max(alpha,val);
							end
					end
					i++;
			end

	end

	if debug == 1,
			fprintf('******************************************\n');
			fprintf('Profundidade: %d\nJogador: %d\nMelhor valor: %f\nMelhor Posicao: %f\n', depth, player, best_val, best_pos);

			%player
			%best_val
			%best_pos

		 fprintf('******************************************\n');
	end

end
