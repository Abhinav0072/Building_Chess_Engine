function legal_moves=create_legal_move_bishop(for_which_color,current_state,first_closest_file,first_closest_rank,first_color,first_piece,second_closest_file,second_closest_rank,second_color,second_piece,third_closest_file,third_closest_rank,third_color,third_piece,fourth_closest_file,fourth_closest_rank,fourth_color,fourth_piece)

%% creating legal moves data struct for the legal moves in  first diagonal (with slope1)
% generating legal moves from the space between the two ends
for i=1:(first_closest_file-third_closest_file-1)
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,third_closest_file+i,third_closest_rank+i,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,third_closest_file+i,third_closest_rank+i,'None');
    end
end
% checking the first endpoints for possible capture
if strcmp(third_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,third_closest_file,third_closest_rank,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,third_closest_file,third_closest_rank,'None');
    end
elseif strcmp(third_color,for_which_color)==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,third_closest_file,third_closest_rank,third_piece)];
    catch
        legal_moves=create_legal_move_struct(current_state,third_closest_file,third_closest_rank,third_piece);
    end
end

% checking the second endpoints for possible capture
if strcmp(first_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,first_closest_file,first_closest_rank,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,first_closest_file,first_closest_rank,'None');
    end
elseif strcmp(third_color,for_which_color)==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,first_closest_file,first_closest_rank,first_piece)];
    catch
        legal_moves=create_legal_move_struct(current_state,first_closest_file,first_closest_rank,first_piece);
    end
end


%% creating legal moves data_struct for the legal moves in  second diagonal (with slope -1)
% generating legal moves from the space between the two ends
for i=1:(fourth_closest_file-second_closest_file-1)
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,fourth_closest_file+i,fourth_closest_rank+i,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,fourth_closest_file+i,fourth_closest_rank+i,'None');
    end
end
% checking the first endpoints for possible capture
if strcmp(fourth_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,fourth_closest_file,fourth_closest_rank,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,fourth_closest_file,fourth_closest_rank,'None');
    end
elseif strcmp(fourth_color,for_which_color)==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,fourth_closest_file,fourth_closest_rank,fourth_piece)];
    catch
        legal_moves=create_legal_move_struct(current_state,fourth_closest_file,fourth_closest_rank,fourth_piece);
    end
end

% checking the second endpoints for possible capture
if strcmp(second_color,'None')
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,second_closest_file,second_closest_rank,'None')];
    catch
        legal_moves=create_legal_move_struct(current_state,second_closest_file,second_closest_rank,'None');
    end
elseif strcmp(second_color,for_which_color)==0
    try
        legal_moves=[legal_moves;create_legal_move_struct(current_state,second_closest_file,second_closest_rank,second_piece)];
    catch
        legal_moves=create_legal_move_struct(current_state,second_closest_file,second_closest_rank,second_piece);
    end
end  
end