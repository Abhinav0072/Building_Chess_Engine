function [khana_index,legal,capturing,promotion_piece_index,castling,castling_side]=take_input(current_status,previous_status,init_file,init_rank,final_file,final_rank,promotion,promotion_preference)
% if king is castled castling==1 or 'YES'
% which side is being castled
% if pawn is promoted ,promotion==1 and promotion preference by the the
% player
%% searching for the piece which was in that position in the current_status of game (which had yet to be updated).
m=length(current_status);
promotion_piece_index=0;   % default considering promotion not available
castling=0;
castling_side='none';
% if ebin dont give promotion preference through his code then we could ask
% here for the preference after checking if the pawn is in the last rank of
% his file,by analyzing from init pos and final pos.
for i=1:m,
    if current_status(i).file==init_file && current_status(i).rank==init_rank
        index=i;
    end
        
    if promotion==1 && strcmp(current_status(i).piece,promotion_preference) && strcmp(current_status(i).status,'Dead')
        promotion_legality=1;
        promotion_piece_index=i;
    end
end
khana_index=index;                      % it is the index of current position of that piece in current_status matrix
Color=current_status(index).color;
piece=current_status(index).piece;

%% checking if the move is legal or not

% first get all legal moves from the rulebook for that piece
legal_moves=swear_rulebook_legality(current_status,previous_status,index,Color);
[n,~]=size(legal_moves);

% checking if the played move is in the legal moves of that piece
for i=1:n,
    if legal_moves(i).final_file==final_file && legal_moves(i).final_rank==final_rank && strcmp(legal_moves(i).current_status.piece,piece)
        index=i;
        legal=1;
        if promotion==1 && promotion_legality==0
            legal=0;
        end
        break
    else
        legal=0;
    end
end

% giving info if this move is capturing something or not
if strcmp(legal_moves(index).capturing_what,'None') || strcmp(legal_moves(index).capturing_what,'Castling') || strcmp(legal_moves(index).capturing_what,'Promotion')
    capturing=0;
else
    capturing=1;
end

% giving information if this move is castling or not and to which side
if strcmp(legal_moves(index).current_status.piece,'King')
    if strcmp(legal_moves(index).capturing_what,'Queen_Castling')
        castling=1;
        castling_side='queen';
        
    elseif strcmp(legal_moves(index).capturing_what,'King_Castling')
        castling=1;
        castling_side='king';
    end       
end

% khana_update=create_khana(Color,Piece,final_file,final_rank,'Alive','Yes');
end