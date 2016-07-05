function legal_moves=create_legal_move_king(for_which_color,current_state,up_color,up_piece,down_color,down_piece,left_color,left_piece,right_color,right_piece,dig_1_color,dig_1_piece,dig_2_color,dig_2_piece,dig_3_color,dig_3_piece,dig_4_color,dig_4_piece)
 %% when file same
 % creating legal move for the up position (if available free or to capture).
if strcmp(up_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file,current_state.rank+1,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file,current_state.rank+1,'None');
    end
elseif strcmp(up_color,for_which_color)==0 && strcmp(up_color,'NA')==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file,current_state.rank+1,up_piece)];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file,current_state.rank+1,up_piece);
    end
end

% creating legal move for the down position.
if strcmp(down_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file,current_state.rank-1,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file,current_state.rank-1,'None');
    end
elseif strcmp(down_color,for_which_color)==0 && strcmp(down_color,'NA')==0
     try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file,current_state.rank-1,down_piece)];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file,current_state.rank-1,down_piece);
     end
end

%% keeping rank same (the moves which are possible).
% creating legal moves for left position

if strcmp(left_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-1,current_state.rank,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file-1,current_state.rank,'None');
    end
elseif strcmp(left_color,for_which_color)==0  && strcmp(left_color,'NA')==0     % taking the left position if its filled and that of opposite color as a capturing position.
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-1,current_state.rank,left_piece)];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file-1,current_state.rank,left_piece);
    end
end

% creating legal_moves for the right positions
if strcmp(right_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+1,current_state.rank,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file+1,current_state.rank,'None');
    end
elseif strcmp(right_color,for_which_color)==0 && strcmp(right_color,'NA')==0 % taking the right position if its filled and that of opposite color as a capturing position.
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+1,current_state.rank,right_piece)];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file+1,current_state.rank,right_piece);
    end
end

%% keeping digonal_1 and 3 same (the moves which are possible)

% creating legal moves for dig_3 position
if strcmp(dig_3_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-1,current_state.rank-1,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file-1,current_state.rank-1,'None');
    end
elseif strcmp(dig_3_color,for_which_color)==0   && strcmp(dig_3_color,'NA')==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-1,current_state.rank-1,dig_3_piece)];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file-1,current_state.rank-1,dig_3_piece);
    end
end

% creating legal_moves for the dig_1 positions
if strcmp(dig_1_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+1,current_state.rank+1,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file+1,current_state.rank+1,'None');
    end
elseif strcmp(dig_1_color,for_which_color)==0 && strcmp(dig_1_color,'NA')==0 
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+1,current_state.rank+1,dig_1_piece)];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file+1,current_state.rank+1,dig_1_piece);
    end
end

%% keeping digonal_2 and 4 same (the moves which are possible)

% creating legal moves for dig_2 position
if strcmp(dig_2_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-1,current_state.rank+1,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file-1,current_state.rank+1,'None');
    end
elseif strcmp(dig_2_color,for_which_color)==0  && strcmp(dig_2_color,'NA')==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-1,current_state.rank+1,dig_2_piece)];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file-1,current_state.rank+1,dig_2_piece);
    end
end

% creating legal_moves for the dig_4 positions
if strcmp(dig_4_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+1,current_state.rank-1,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file+1,current_state.rank-1,'None');
    end
elseif strcmp(dig_4_color,for_which_color)==0  && strcmp(dig_4_color,'NA')==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+1,current_state.rank-1,dig_4_piece)];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file+1,current_state.rank-1,dig_4_piece);
    end
end

end

