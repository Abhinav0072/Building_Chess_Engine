function legal_moves=swear_rulebook_moveS(current_status,previous_state,Color,is_castling_legal)
%%  %This function contain the rules of the legality of the moves.
    %This will give  a list of all
    %possible moves by all possible pieces alives of one or both, according
    %to need(for AI vs AI,AI vs Human)
     
    %"status matrix" :- will give the current status of board to help decide
    % which pieces possible moves need to be given out.
    %"Color" :-for what color we need to generate the legal moves.
    
%% Calculating all possible moves for each piece of required color
% files=['a';'b';'c';'d';'e';'f';'g';'h'];
[m,~]=size(current_status);
for i=1:m,
    
    %% Writing rule for Rook and taking out the possible moves for Rook
    if strcmp(current_status(i).status,'Alive')&&(and(strcmp(current_status(i).color,Color),strcmp(current_status(i).piece,'Rook')))
      %initializing the default values for free places,assuming the whole
      %row or file is empty.
      upper_highest=8;
      upper_color='None';                           %assuming that no piece is there in the last possible khana(and it is possible to move there)
      upper_piece='None';                           %assuming that no piece is there in the last possible khana
      lower_lowest=1;
      lower_color='None';                           %assuming that no piece is there in the last possible khana
      lower_piece='None';                           %assuming that no piece is there in the last possible khana
      left_lowest=1;
      left_color='None';                            %assuming that no piece is there in the last possible khana
      left_piece='None';                            %assuming that no piece is there in the last possible khana
      right_highest=8;
      right_color='None';                           %assuming that no piece is there in the last possible khana
      right_piece='None';                           %assuming that no piece is there in the last possible khana
      for j=1:m,
          if and((j~=i),strcmp(current_status(j).status,'Alive'))
              if (current_status(j).file==current_status(i).file)
                  if (current_status(j).rank>current_status(i).rank)
                      if (current_status(j).rank<=upper_highest)
                          upper_highest=current_status(j).rank;
                          upper_color=current_status(j).color;
                          upper_piece=current_status(j).piece;
                      end
                  elseif (current_status(j).rank<current_status(i).rank)
                      if (current_status(j).rank>=lower_lowest)
                          lower_lowest=current_status(j).rank;
                          lower_color=current_status(j).color;
                          lower_piece=current_status(j).piece;
                      end
                  end  
          elseif (current_status(j).rank==current_status(i).rank)
                  if (current_status(j).file>current_status(i).file)
                      if (current_status(j).file<=right_highest)
                          right_highest=current_status(j).file;
                          right_color=current_status(j).color;
                          right_piece=current_status(j).piece;
                      end
                  elseif (current_status(j).file<current_status(i).file)
                      if (current_status(j).file>=left_lowest)
                          lower_lowest=current_status(j).file;
                          left_color=current_status(j).color;
                          left_piece=current_status(j).piece;
                      end
                  end 
              end
          end
      end
      try
          legal_moves=[legal_moves;create_legal_move_rook(Color,current_status(i),upper_highest,upper_color,upper_piece,lower_lowest,lower_color,lower_piece,left_lowest,left_color,left_piece,right_highest,right_color,right_piece)];
      catch
          try
            legal_moves=create_legal_move_rook(Color,current_status(i),upper_highest,upper_color,upper_piece,lower_lowest,lower_color,lower_piece,left_lowest,left_color,left_piece,right_highest,right_color,right_piece);
          catch
          end
      end
    end
    
    %% Taking out all possible moves for Bishop according to rule
    if strcmp(current_status(i).status,'Alive')&&(and(strcmp(current_status(i).color,Color),strcmp(current_status(i).piece,'Bishop')))
        % initializing the default value of free space in digonal of
        % movement of bishop ,assuming the whole digonal is empty.
        
        % for firstQuadrant (relative to Bishop)
        first_closest_file_diff=8-current_status(i).file;
        first_closest_rank_diff=8-current_status(i).rank;
        first_color='None';                     %assuming that no piece is there in the last possible khana
        first_piece='None';                     %assuming that no piece is there in the last possible khana
        if first_closest_file_diff<first_closest_rank_diff
            first_closest_file=8;
            first_closest_rank=current_status(i).rank+first_closest_file_diff;
        else
            first_closest_rank=8;
            first_closest_file=current_status(i).file+first_closest_rank_diff;
        end
        
        %for second Quadrant(relative to Bishop)
        second_closest_file_diff=current_status(i).file-1;
        second_closest_rank_diff=8-current_status(i).rank;
        second_color='None';                        %assuming that no piece is there in the last possible khana
        second_piece='None';                        %assuming that no piece is there in the last possible khana
        if second_closest_file_diff<second_closest_rank_diff
            second_closest_file=1;
            second_closest_rank=current_status(i).rank+second_closest_file_diff;
        else
            second_closest_rank=8;
            second_closest_file=current_status(i).file-second_closest_rank_diff;
        end
        
        %for third Quadrant(relative to Bishop)
        third_closest_file_diff=current_status(i).file-1;
        third_closest_rank_diff=current_status(i).rank-1;
        third_color='None';                 %assuming that no piece is there in the last possible khana
        third_piece='None';                 %assuming that no piece is there in the last possible khana
        if third_closest_file_diff<third_closest-rank_diff
            third_closest_file=1;
            third_closest_rank=current_status(i).rank-third_closest_file_diff;
        else
            third_closest_rank=1;
            third_closest_file=current_status(i).file-third_closest_rank_diff;
        end
        
        % for fourth quadrant(relative to Bishop)
        fourth_closest_file_diff=8-current_status(i).file;
        fourth_closest_rank_diff=current_status(i).rank-1;
        if fourth_closest_file_diff<fourth_closest_rank_diff
            fourth_closest_file=8;
            fourth_closest_rank=current_status(i).rank-fourth_closest_file_diff;
        else
            fourth_closest_rank=1;
            fourth_closest_file=current_status(i).file+fourth_closest_rank_diff;
        end
        
        for j=1:m,
            if and((j~=i),strcmp(current_status(j).status,'Alive'))
               file_diff=current_status(j).file-current_status(i).file;
               rank_diff=current_status(j).rank-current_status(i).rank;
               % checking if the (examining) piece is in the first quadrant
               % digonal.
               if and(and(file_diff>0,rank_diff>0),(file_diff./rank_diff)==1);
                   if current_status(j).file<=first_closest_file
                       first_closest_file=current_status(j).file;
                       first_closest_rank=current_status(j).rank;
                       first_color=current_status(j).color;
                       first_piece=current_status(j).piece;
                   end
               
               % checking on second quadrant digonal
               elseif and(and(file_diff<0,rank_diff>0),(file_diff./rank_diff)==-1);
                   if current_status(j).file>=second_closest_file
                       second_closest_file=current_status(j).file;
                       second_closest_rank=current_status(j).rank;
                       second_color=current_status(j).color;
                       second_piece=current_status(j).piece;
                   end
                   
               % checking on third quadrant digonal
               elseif and(and(file_diff<0,rank_diff<0),(file_diff./rank_diff)==1);
                   if current_status(j).file>=third_closest_file
                       third_closest_file=current_status(j).file;
                       third_closest_rank=current_status(j).rank;
                       third_color=current_status(j).color;
                       third_piece=current_status(j).piece;
                   end
               % checking in fourth quadrant digonal    
               elseif and(and(file_diff>0,rank_diff<0),(file_diff./rank_diff)==-1);
                   if current_status(j).file<=fourth_closest_file
                       fourth_closest_file=current_status(j).file;
                       fourth_closest_rank=current_status(j).rank;
                       fourth_color=current_status(j).color;
                       fourth_piece=current_status(j).piece;
                   end
               end
            end
        end
        try
            legal_moves=[legal_moves;create_legal_move_bishop(Color,current_status(i),first_closest_file,first_closest_rank,first_color,first_piece,second_closest_file,second_closest_rank,second_color,second_piece,third_closest_file,third_closest_rank,third_color,third_piece,fourth_closest_file,fourth_closest_rank,fourth_color,fourth_piece)];
        catch
             legal_moves=create_legal_move_bishop(Color,current_status(i),first_closest_file,first_closest_rank,first_color,first_piece,second_closest_file,second_closest_rank,second_color,second_piece,third_closest_file,third_closest_rank,third_color,third_piece,fourth_closest_file,fourth_closest_rank,fourth_color,fourth_piece);
        end
    end
    
    %% Generating all possible legal moves for Knight according to rule
    if strcmp(current_status(i).status,'Alive')&&(and(strcmp(current_status(i).color,Color),strcmp(current_status(i).piece,'Knight')))
        % initializing the default value in possible position of movement
        % of Knight(1.by keeping file constant(with four possibilities)
        % 2.keeping rank constant(with four furthur possibilities))
        
        % first going dhai along file.
        % first going down the file
        file_down_right_color='NA';                   % ASSUMING THEY ARE NOT AVAILABLE (NOT VALID OR OUT OF BOUND) FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        file_down_left_color='NA';                    % ASSUMING THEY ARE NOT AVAILABLE (NOT VALID OR OUT OF BOUND) FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        file_up_right_color='NA';                     % ASSUMING THEY ARE NOT AVAILABLE (NOT VALID OR OUT OF BOUND) FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        file_up_left_color='NA';                      % ASSUMING THEY ARE NOT AVAILABLE (NOT VALID OR OUT OF BOUND) FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        file_down_right_piece='NA';   %add them too
        if current_status(i).rank>2
            if current_status(i).file<8
                file_down_right_color='None';
                file_down_right_piece='None';
            end
            if current_status(i).file>1
                file_down_left_color='None';
                file_down_left_piece='None';
            end
        end
        % now going up the file
        if current_status(i).rank<7
            if current_status(i).file<8
                file_up_right_color='None';
                file_up_right_piece='None';
            end
            if current_status(i).file>1
                file_up_left_color='None';
                file_up_left_piece='None';
            end
        end
        
        % now going dhai along the rank
        % first going left
        rank_left_down_color='NA';                      % ASSUMING THEY ARE NOT AVAILABLE (NOT VALID OR OUT OF BOUND) FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        rank_left_up_color='NA';                        % ASSUMING THEY ARE NOT AVAILABLE FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        rank_right_down_color='NA';                     % ASSUMING THEY ARE NOT AVAILABLE FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        rank_right_up_color='NA';                       % ASSUMING THEY ARE NOT AVAILABLE FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        if current_status(i).file>2        
            if current_status(i).rank>1
                rank_left_down_color='None';
                rank_left_down_piece='None';
            end
            if current_status(i).rank<8
                rank_left_up_color='None';
                rank_left_up_piece='None';
            end
        end
        % now going right along the same rank and then dhai
        if current_status(i).file<7
            if current_status(i).rank>1
                rank_right_down_color='None';
                rank_right_down_piece='None';
            end
            if current_status(i).rank<8
                rank_right_up_color='None';
                rank_right_up_piece='None';
            end
        end
        
        % now searching from amongst the other pieces that if they are
        % empty or what pieces are there
        for j=1:m,
            if and((j~=i),strcmp(current_status(j).status,'Alive'))
                %checking along the files now.
                % first up
                if and((current_status(j).rank==current_status(i).rank+2),current_status(j).file==current_status(i).file+1)
                    file_up_right_color=current_status(j).color;
                    file_up_right_piece=current_status(j).piece;
                    
                elseif and(current_status(j).rank==current_status(i).rank+2,current_status(j).file==current_status(i).file-1)
                    file_up_left_color=current_status(j).color;
                    file_up_left_piece=current_status(j).piece;
                % now going down
                elseif and(current_status(j).rank==current_status(i).rank-2,current_status(j).file==current_status(i).file+1)
                    file_down_right_color=current_status(j).color;
                    file_down_right_piece=current_status(j).piece;
                    
                elseif and(current_status(j).rank==current_status(i).rank-2,current_status(j).file==current_status(i).file-1)
                    file_down_left_color=current_status(j).color;
                    file_down_left_piece=current_status(j).piece;
                    
                % now moving along the file
                % going left first
                elseif and(current_status(j).file==current_status(i).file-2,current_status(j).rank==current_status(i).rank-1)
                    rank_left_down_color=current_status(j).color;
                    rank_left_down_piece=current_status(j).piece;
                    
                elseif and(current_status(j).file==current_status(i).file-2,current_status(j).rank==current_status(i).rank+1)
                    rank_left_up_color=current_status(j).color;
                    rank_left_up_piece=current_status(j).piece;
                    
                % now going right
                elseif and(current_status(j).file==current_status(i).file+2,current_status(j).rank==current_status(i).rank-1)
                    rank_right_down_color=current_status(j).color;
                    rank_right_down_piece=current_status(j).piece;
                    
                elseif and(current_status(j).file==current_status(i).file+2,current_status(j).rank==current_status(i).rank+1)
                    rank_right_up_color=current_status(j).color;
                    rank_right_up_piece=current_status(j).piece;
                end
            end
        end
        try
            legal_moves=[legal_moves;create_legal_move_knight(Color,current_status(i),file_up_right_color,file_up_right_piece,file_up_left_color,file_up_left_piece,file_down_right_color,file_down_right_piece,file_down_left_color,file_down_left_piece,rank_left_up_color,rank_left_up_piece,rank_left_down_color,rank_left_down_piece,rank_right_up_color,rank_right_up_piece,rank_right_down_color,rank_right_down_piece)];
        catch
            legal_moves=create_legal_move_knight(Color,current_status(i),file_up_right_color,file_up_right_piece,file_up_left_color,file_up_left_piece,file_down_right_color,file_down_right_piece,file_down_left_color,file_down_left_piece,rank_left_up_color,rank_left_up_piece,rank_left_down_color,rank_left_down_piece,rank_right_up_color,rank_right_up_piece,rank_right_down_color,rank_right_down_piece);
        end
    end
    
    %% Generating all possible for the King according to rule
    if strcmp(current_status(i).status,'Alive')&&(and(strcmp(current_status(i).color,Color),strcmp(current_status(i).piece,'King')))
        % first initializing assuming none of the position is possible
        up_color='NA';                          % ASSUMING THEY ARE NOT AVAILABLE (NOT VALID OR OUT OF BOUND) FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        down_color='NA';                        % ASSUMING THEY ARE NOT AVAILABLE (NOT VALID OR OUT OF BOUND) FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        left_color='NA';                        % ASSUMING THEY ARE NOT AVAILABLE (NOT VALID OR OUT OF BOUND) FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        right_color='NA';                       % ASSUMING THEY ARE NOT AVAILABLE (NOT VALID OR OUT OF BOUND) FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        dig_1_color='NA';                       % ASSUMING THEY ARE NOT AVAILABLE (NOT VALID OR OUT OF BOUND) FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        dig_2_color='NA';                       % ASSUMING THEY ARE NOT AVAILABLE (NOT VALID OR OUT OF BOUND) FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        dig_3_color='NA';                       % ASSUMING THEY ARE NOT AVAILABLE (NOT VALID OR OUT OF BOUND) FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        dig_4_color='NA';                       % ASSUMING THEY ARE NOT AVAILABLE (NOT VALID OR OUT OF BOUND) FIRST, THEN IF THEY ARE,UPDATING ACCORDINGLY.
        
        % ACTIVATION: if the control enter any of the condition down some of the positions will be "available" to move out of "8 possible"
        %for down and dig_3,dig_4 
        if current_status(i).rank>1
            down_color='None';
            down_piece='None';
            if current_status(i).file>1
                dig_3_color='None';                 % digonals will be activate if it meet both the condition(i.e foe dig 3 the king should be above rank 1 and ahead of file1)
                dig_3_piece='None';
            elseif current_status(i).file<8
                dig_4_color='None';
                dig_4_piece='None';
            end
        end
        %for up and dig_1,dig_2 
        if current_status(i).rank<8
            up_color='None';
            up_piece='None';
            if current_status(i).file>1
                dig_2_color='None';                 % digonals will be activate if it meet both the condition(i.e foe dig 3 the king should be above rank 1 and ahead of file1)
                dig_2_piece='None';
            elseif current_status(i).file<8
                dig_1_color='None';
                dig_1_piece='None';
            end
        end
        %for left
        if current_status(i).file>1
            left_color='None';                      %assuming its empty and then checking furthur
            left_piece='None';
        end
        %for right
        if current_status(i).file<8
            right_color='None';
            right_piece='None';
        end
        
        % Now searching from the rest of the alive pieces
        for j=1:m,
            if and((j~=i),strcmp(current_status(j).status,'Alive'))
                
                %checking top first
                if current_status(j).file==current_status(i).file && current_status(j).rank==current_status(i).rank+1
                    up_color=current_status(j).color;
                    up_piece=current_status(j).piece;
                    
                %checking dig_1
                elseif current_status(j).file==current_status(i).file+1 && current_status(j).rank==current_status(i).rank+1
                    dig_1_color=current_status(j).color;
                    dig_1_piece=current_status(j).piece;
                    
                %checking dig_2
                elseif current_status(j).file==current_status(i).file-1 && current_status(j).rank==current_status(i).rank+1
                    dig_2_color=current_status(j).color;
                    dig_2_piece=current_status(j).piece;
                
                %checking down
                elseif current_status(j).file==current_status(i).file && current_status(j).rank==current_status(i).rank-1
                    down_color=current_status(j).color;
                    down_piece=current_status(j).piece;
                    
                %checking dig_3
                elseif current_status(j).file==current_status(i).file-1 && current_status(j).rank==current_status(i).rank-1
                    dig_3_piece=current_status(j).piece;
                    dig_3_color=current_status(j).color;
                    
                %checking dig_4
                elseif current_status(j).file==current_status(i).file+1 && current_status(j).rank==current_status(i).rank-1
                    dig_4_piece=current_status(j).piece;
                    dig_4_color=current_status(j).color;
                    
                %checking left
                elseif current_status(j).file==current_status(i).file-1 && current_status(j).rank==current_status(i).rank
                    left_color=current_status(j).color;
                    left_piece=current_status(j).piece;
                    
                %checking right
                elseif current_status(j).file==current_status(i).file+1 && current_status(j).rank==current_status(i).rank
                    right_color=current_status(j).color;
                    right_piece=current_status(j).piece;
                end
            end
        end
        try
            legal_moves=[legal_moves;create_legal_move_king(Color,current_status.(i),up_color,up_piece,down_color,down_piece,left_color,left_piece,right_color,right_piece,dig_1_color,dig_1_piece,dig_2_color,dig_2_piece,dig_3_color,dig_3_piece,dig_4_color,dig_4_piece)];
        catch
            legal_moves=create_legal_move_king(Color,current_status.(i),up_color,up_piece,down_color,down_piece,left_color,left_piece,right_color,right_piece,dig_1_color,dig_1_piece,dig_2_color,dig_2_piece,dig_3_color,dig_3_piece,dig_4_color,dig_4_piece);
        end
    end
    
    %% Generating all possible moves for the pawn
    
    % initializing the foreward position of the pawn assuming its empty
    foreward_one_color='None';
    foreward_one_piece='None';
    foreward_two_color='NA';
    foreward_two_piece='NA';
    
    
    if strcmp(current_status(i).displacement,'No')
        foreward_two_color='None';
        foreward_two_piece='None';
    end
    
    % initializing the attack move of digonal assuming that the move is not
    % possible (and then updating accordingly if it is possible)
    attack_left_color='NA';
    attack_left_piece='NA';
    attack_right_piece='NA';
    attack_right_color='NA';
    
    % Now updating the attack default move according to its pos assuming
    % that it is empty to move (then furthur check will happen)
    if current_status(i).file>1 || current_status(i).file<8
        attack_left_color='None';
        attack_left_piece='None';
        attack_right_piece='None';
        attack_right_color='None';
        
    elseif current_status(i).file==1
        attack_right_color='None';
        attack_right_piece='None';
        
    elseif current_status(i).file==8
        attack_left_color='None';
        attack_left_piece='None';
    end
    
    %now checking through the alive pieces
   for j=1:m,
            % implementing it for "white pawn".
            if and(and((j~=i),strcmp(current_status(j).status,'Alive')),strcmp(current_status(i).color,'White'))
                %for the one move foreward
                if current_status(j).file==current_status(i).file && current_status(j).rank==curretn_status(i).rank+1
                    foreward_one_color=current_status(j).color;
                    foreward_one_piece=current_status(j).piece;
                    
                %for two move foreward on the first move of that piece
                elseif (current_status(j).file==current_status(i).file && current_status(j).rank==current_status(i).rank+2 )&& (strcmp(current_status.displacement,'No'))
                    foreward_two_color=current_status(j).color;
                    foreward_two_piece=current_status(j).piece;
                    
                %for the right attack
                elseif current_status(j).file==current_status(i).file+1 && current_status(j).rank==current_status(i).rank+1
                    attack_right_color=current_status(j).color;
                    attack_right_piece=current_status(j).piece;
                    
                %for left attack
                elseif current_status(j).file==current_status(i).file-1 && current_status(j).rank==current_status(i).rank+1
                    attack_left_color=current_status(j).color;
                    attack_left_piece=current_status(j).piece;
                    
                % for "en-passent" capture
                elseif strcmp(current_status(j).piece,'pawn') && strcmp(current_status(j).color,'Black') && current_status(j).rank==5 && strcmp(previous_status(j).displacement,'No') && current_status(i).rank==5 && (current_status(j).file==current_status(i).file+1 || current_status(j).file==current_status(i).file==-1)
                    try
                        legal_moves=[legal_moves;create_legal_move_struct(current_status(j),current_status(j).file,6,'pawn')];
                    catch
                        legal_moves=create_legal_move_struct(current_status(j),current_status(j).file,6,'pawn');
                    end
                end
            end
            
            
            % implementing it for "black pawn".
             if and(and((j~=i),strcmp(current_status(j).status,'Alive')),strcmp(current_status(i).color,'Black'))
                %for the one move foreward
                if current_status(j).file==current_status(i).file && current_status(j).rank==curretn_status(i).rank-1
                    foreward_one_color=current_status(j).color;
                    foreward_one_piece=current_status(j).piece;
                    
                %for two move foreward on the first move of that piece
                elseif (current_status(j).file==current_status(i).file && current_status(j).rank==current_status(i).rank-2 )&& (strcmp(current_status.displacement,'No'))
                    foreward_two_color=current_status(j).color;
                    foreward_two_piece=current_status(j).piece;
                    
                %for the right attack
                elseif current_status(j).file==current_status(i).file+1 && current_status(j).rank==current_status(i).rank-1
                    attack_right_color=current_status(j).color;
                    attack_right_piece=current_status(j).piece;
                    
                %for left attack
                elseif current_status(j).file==current_status(i).file-1 && current_status(j).rank==current_status(i).rank-1
                    attack_left_color=current_status(j).color;
                    attack_left_piece=current_status(j).piece;
                    
                % for "en-passent" capture
                elseif strcmp(current_status(j).piece,'pawn') && strcmp(current_status(j).color,'White') && current_status(j).rank==4 && strcmp(previous_status(j).displacement,'No') && current_status(i).rank==4 && (current_status(j).file==current_status(i).file+1 || current_status(j).file==current_status(i).file==-1)
                    try
                        legal_moves=[legal_moves;create_legal_move_struct(current_status(j),current_status(j).file,3,'pawn')];
                    catch
                        legal_moves=create_legal_move_struct(current_status(j),current_status(j).file,3,'pawn');
                    end
                end
             end           
   end
   try
       legal_moves=[legal_moves;];
   catch
       legal_moves=();
   end
end
end