function [check,checkmate,draw]=analyze_game_check(for_which_color,current_status,previous_status,super_previous_status)
%% Determine if the king is in check
% for which color is the color of one jisko check karna hai ki samne wala
% mereko check de raha hai ki nahi
% so "Color" will be mera apponents color

if strcmp(for_which_color,'White')
    Color='Black';
elseif strcmp(for_which_color,'Black')
    Color='White';
end
legal_moves=swear_rulebook_all_move(current_status,previous_status,Color);
[n,~]=size(legal_moves);
for i=1:n
    if strcmp(legal_moves(i).capturing_what,'King')
        check=1;
    else
        check=0;
    end
end

%% Determine if the king is checkmate


%% Determine if the game is draw (base on three state rule)

end