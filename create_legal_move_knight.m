function legal_moves=create_legal_move_knight(for_which_color,current_state,file_up_right_color,file_up_right_piece,file_up_left_color,file_up_left_piece,file_down_right_color,file_down_right_piece,file_down_left_color,file_down_left_piece,rank_left_up_color,rank_left_up_piece,rank_left_down_color,rank_left_down_piece,rank_right_up_color,rank_right_up_piece,rank_right_down_color,rank_right_down_piece)
%% #1 creating legal move if "file_up_right" is available free or legal to move
if strcmp(file_up_right_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+1,current_state.rank+2,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file+1,current_state.rank+2,'None');
    end
elseif strcmp(file_up_right_color,for_which_color)==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+1,current_state.rank+2,file_up_right_piece)];
        catch
        legal_moves=create_legal_move_struct(current_state,current_state.file+1,current_state.rank+2,file_up_right_piece);
    end
end

%% #2 creating legal move if "file_up_left" is available free or legal to move
if strcmp(file_up_left_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-1,current_state.rank+2,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file-1,current_state.rank+2,'None');
    end
elseif strcmp(file_up_left_color,for_which_color)==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-1,current_state.rank+2,file_up_left_piece)];
        catch
        legal_moves=create_legal_move_struct(current_state,current_state.file-1,current_state.rank+2,file_up_left_piece);
    end
end

%% #3 creating legal move if "file_down_left" is available free or legal to move
if strcmp(file_down_left_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-1,current_state.rank-2,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file-1,current_state.rank-2,'None');
    end
elseif strcmp(file_down_left_color,for_which_color)==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-1,current_state.rank-2,file_down_left_piece)];
        catch
        legal_moves=create_legal_move_struct(current_state,current_state.file-1,current_state.rank-2,file_down_left_piece);
    end
end
%% #4 creating legal move if "file_down_right" is available free or legal to move
if strcmp(file_down_right_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+1,current_state.rank-2,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file+1,current_state.rank-2,'None');
    end
elseif strcmp(file_down_right_color,for_which_color)==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+1,current_state.rank-2,file_down_right_piece)];
        catch
        legal_moves=create_legal_move_struct(current_state,current_state.file+1,current_state.rank-2,file_down_right_piece);
    end
end
%% #5 creating legal move if "rank_right_up" is available free or legal to move
if strcmp(rank_right_up_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+2,current_state.rank+1,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file+2,current_state.rank+1,'None');
    end
elseif strcmp(rank_right_up_color,for_which_color)==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+2,current_state.rank+1,rank_right_up_piece)];
        catch
        legal_moves=create_legal_move_struct(current_state,current_state.file+2,current_state.rank+1,rank_right_up_piece);
    end
end
%% #6 creating legal move if "rank_right_down" is available free or legal to move
if strcmp(rank_right_down_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+2,current_state.rank-1,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file+2,current_state.rank-1,'None');
    end
elseif strcmp(rank_right_down_color,for_which_color)==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+2,current_state.rank-1,rank_right_down_piece)];
        catch
        legal_moves=create_legal_move_struct(current_state,current_state.file+2,current_state.rank-1,rank_right_down_piece);
    end
end
%% #7 creating legal move if "rank_left_up" is available free or legal to move
if strcmp(rank_left_up_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-2,current_state.rank+1,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file-2,current_state.rank+1,'None');
    end
elseif strcmp(rank_left_up_color,for_which_color)==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-2,current_state.rank+1,rank_left_up_piece)];
        catch
        legal_moves=create_legal_move_struct(current_state,current_state.file-2,current_state.rank+1,rank_left_up_piece);
    end
end
%% #8 creating legal move if "rank_left_down" is available free or legal to move
if strcmp(rank_left_down_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-2,current_state.rank-1,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,current_state.file-2,current_state.rank-1,'None');
    end
elseif strcmp(rank_left_down_color,for_which_color)==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-2,current_state.rank-1,rank_left_down_piece)];
        catch
        legal_moves=create_legal_move_struct(current_state,current_state.file-2,current_state.rank-1,rank_left_down_piece);
    end
end

end