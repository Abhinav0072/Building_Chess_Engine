function [khana_index,legal,capturing]=take_input(current_status,previous_status,init_file,init_rank,final_file,final_rank)

%% searching for the piece which was in that position in the current_status of game (which had yet to be updated).
m=length(current_status);
for i=1:m,
    if current_status(i).file==init_file && current_status(i).rank==init_rank
        index=i;
        break
    end
end
khana_index=index;                      % it is the index of current position of that piece in current_status matrix
Color=current_status(index).color;

%% checking if the move is legal or not

% first get all legal moves from the rulebook for that piece
legal_moves=swear_rulebook_legality(current_status,previous_status,index,Color);
[n,~]=size(legal_moves);

% checking if the played move is in the legal moves of that piece
for i=1:n,
    if legal_moves(i).final_file==final_file && legal_moves(i).final_rank==final_rank
        index=i;
        legal=1;
        break
    else
        legal=0;
    end
end

% giving info if this move is capturing something or not
if strcmp(legal_moves(index).capturing_what,'None')==0
    capturing=1;
else
    capturing=0;
end

% khana_update=create_khana(Color,Piece,final_file,final_rank,'Alive','Yes');
end