function legal_moves=create_legal_move_pawn(for_which_color,current_state,foreward_one_color,foreward_one_piece,foreward_two_color,foreward_two_piece,attack_left_color,attack_left_piece,attack_right_color,attack_right_piece)
%% creating move for foreward movement of one step
if strcmp(foreward_one_color,'None')
    if strcmp(current_state.color,'White')
        try
           legal_moves= [legal_moves;create_legal_move_struct(current_state,current_state.file,current_state.rank+1,'None')];
        catch
           legal_moves=create_legal_move_struct(current_state,current_state.file,current_state.rank+1,'None');
        end
        
    else
        try
            legal_moves= [legal_moves;create_legal_move_struct(current_state,current_state.file,current_state.rank-1,'None')];
        catch
            legal_moves=create_legal_move_struct(current_state,current_state.file,current_state.rank-1,'None');
        end
    end
end

%% creating move for foreward move of two step on first move
if strcmp(foreward_one_color,'None') && strcmp(foreward_two_color,'None')
    if strcmp(current_state.color,'White')
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file,current_state.rank+2,'None')];
        catch
            legal_moves=create_legal_move_struct(current_state,current_state.file,current_state.rank+2,'None');
        end
        
    else
         try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file,current_state.rank-2,'None')];
        catch
            legal_moves=create_legal_move_struct(current_state,current_state.file,current_state.rank-2,'None');
         end
    end
end

%% creating legal moves if there is any left capture
if strcmp(attack_left_color,'None')==0 && strcmp(attack_left_color,for_which_color)==0
    if strcmp(for_which_color,'White') 
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-1,current_state.rank+1,attack_left_piece)];
        catch
            legal_moves=create_legal_move_struct(current_state,current_state.file-1,current_state.rank+1,attack_left_piece);
        end
        
    else
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file-1,current_state.rank-1,attack_left_piece)];
        catch
            legal_moves=create_legal_move_struct(current_state,current_state.file-1,current_state.rank-1,attack_left_piece);
        end
    end
end
         
%% creating legal moves if there is any right capture
if strcmp(attack_right_color,'None')==0 && strcmp(attack_right_color,for_which_color)==0
    if strcmp(for_which_color,'White') 
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+1,current_state.rank+1,attack_right_piece)];
        catch
            legal_moves=create_legal_move_struct(current_state,current_state.file+1,current_state.rank+1,attack_right_piece);
        end
        
    else
        try
            legal_moves=[legal_moves;create_legal_move_struct(current_state,current_state.file+1,current_state.rank-1,attack_right_piece)];
        catch
            legal_moves=create_legal_move_struct(current_state,current_state.file+1,current_state.rank-1,attack_right_piece);
        end
    end
end
            
end