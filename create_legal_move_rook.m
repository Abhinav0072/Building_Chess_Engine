function legal_moves=create_legal_move_rook(for_which_color,current_state,upper_highest,upper_color,upper_piece,lower_lowest,lower_color,lower_piece,left_lowest,left_color,left_piece,right_highest,right_color,right_piece)

%% for upper part in "same file".
if strcmp(upper_color,'None')
    for i=current_state.rank+1:upper_highest,
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file,i,'None')];
        catch
            legal_moves=create_legal_move_struct(current_state,current_state.file,i,'None');
        end
    end
else
    for i=current_state.rank+1:upper_highest-1,
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file,i,'None')];
        catch
            legal_moves=create_legal_move_struct(current_state,current_state.file,i,'None');
        end
    end
    if strcmp(upper_color,for_which_color)==0
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file,upper_highest,upper_piece)];
        catch
            legal_moves=create_legal_move_struct(current_state,current_state.file,upper_highest,upper_piece);
        end
    end
end

%% for lower part in "same file".
if strcmp(lower_color,'None')
    for i=lower_lowest:current_state.rank-1,
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file,i,'None')];
        catch
            legal_moves=create_legal_move_struct(current_state,current_state.file,i,'None');
        end
    end
else
    for i=lower_lowest+1:current_state.rank-1,
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file,i,'None')];
        catch
            legal_moves=create_legal_move_struct(current_state,current_state.file,i,'None');
        end
    end
    if strcmp(lower_color,for_which_color)==0
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file,lower_lowest,lower_piece)];
        catch
            legal_moves=create_legal_move_struct(current_state,current_state.file,lower_lowest,lower_piece);
        end
    end
end 

%% for right part keeping "rank same".
if strcmp(right_color,'None')
    for i=current_state.file+1:right_highest,
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,i,current_state.rank,'None')];
        catch
            legal_moves=create_legal_move_struct(current_state,i,current_state.rank,'None');
        end
    end
else
    for i=current_state.file+1:right_highest-1,
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,i,current_state.rank,'None')];
        catch
            legal_moves=create_legal_move_struct(current_state,i,current_state.rank,'None');
        end
    end
    if strcmp(right_color,for_which_color)==0
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,right_highest,current_state.rank,right_piece)];
        catch
            legal_moves=create_legal_move_struct(current_state,right_highest,current_state.rank,right_piece);
        end
    end
end

%% for left part keeping "rank same".
if strcmp(left_color,'None')
    for i=left_lowest:current_state.file-1,
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,i,current_state.rank,'None')];
        catch
            legal_moves=create_legal_move_struct(current_state,i,current_state.rank,'None');
        end
    end
else
    for i=left_lowest+1:current_state.file-1,
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,i,current_state.rank,'None')];
        catch
            legal_moves=create_legal_move_struct(current_state,i,current_state.rank,'None');
        end
    end
    if strcmp(left_color,for_which_color)==0
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,left_lowest,current_state.rank,left_piece)];
        catch
            legal_moves=create_legal_move_struct(current_state,left_lowest,current_state.rank,left_piece);
        end
    end
end
        
end