function [khana_initial,khana_update,pos_check,legal]=take_input(Color,Piece,init_file,init_rank,final_file,final_rank)

%creating khana for the initial state.
khana_initial=create_khana(Color,Piece,init_file,init_rank);
pos_check=initial_pos_check(khana_initial,current_status);  % check if the repported initial position match with current state(now previous)

%creating khana for the final state.
khana_update=create_khana(Color,Piece,final_file,final_rank);
legal=swear_rulebook_move(khana_update,khana_initial);      % check if the performed move is legal or not.

end