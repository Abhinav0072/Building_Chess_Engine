function [check,checkmate,draw]=analyze_game_check(for_which_color,current_status,previous_status,super_previous_status)
%% Determine if the king is in check
% for which color is the color of one jisko check karna hai ki samne wala
% mereko check de raha hai ki nahi
% so "Color" will be mera apponents color

if strcmp(for_which_color,'White')
    %khana_index=5;
    Color='Black';
elseif strcmp(for_which_color,'Black')
    %khana_index=21;
    Color='White';
end
legal_moves=swear_rulebook_all_move(current_status,previous_status,Color);
[n,~]=size(legal_moves);
for i=1:n
    if strcmp(legal_moves(i).capturing_what,'King')
        check=1;
        break
    else
        check=0;
    end
end

%% Determine if the king is checkmate
checkmate=0;
if check==1
    checkmate=1;  % assuming it is check mate and switching it off when we get a legal move which remove king from check
    legal_move_apna=swear_rulebook_all_move(current_status,previous_status,for_which_color);
    [n,~]=size(legal_move_apna);
    for i=1:n,
            init_file=legal_move_apna(i).current_status.file;
            init_rank=legal_move_apna(i).current_status.rank;
            final_file=legal_move_apna(i).final_file;
            final_rank=legal_move_apna(i).final_rank;
            
            % Implement this in take input too. Dont ask for it, there
            if strcmp(legal_move_apna(i).current_status.color,'White') && strcmp(legal_move_apna(i).current_status.piece,'pawn') && final_rank==8
                promotion =1;
            elseif strcmp(legal_move_apna(i).current_status.color,'Black') && strcmp(legal_move_apna(i).current_status.piece,'pawn') && final_rank==1
                promotion=1;
            else
                promotion=0;
            end
            
            promotion_preference='Queen';               % change here later
            current_status_temp=current_status;
            previous_status_temp=previous_status;
            [khana_index,legal,capturing,promotion_piece_index,castling,castling_side]=take_input(current_status_temp,previous_status_temp,init_file,init_rank,final_file,final_rank,promotion,promotion_preference);
            [current_status_temp,previous_status_temp,super_previous_status]=update_status(current_status_temp,previous_status_temp,khana_index,legal,capturing,final_file,final_rank,castling,castling_side,promotion,promotion_piece_index);
            legal_moves=swear_rulebook_all_move(current_status_temp,previous_status_temp,Color);
            [n,~]=size(legal_moves);
            for j=1:n
                if strcmp(legal_moves(j).capturing_what,'King')
                    temp_check=1;
                    break
                else
                    temp_check=0;
                end
            end
            if temp_check==1
                continue;
            elseif temp_check==0
                checkmate=0;
                fprintf('%d',i);
                break
            end
        
    end
end

%% Determine if the game is draw (base on three state rule)
draw=0;
end
