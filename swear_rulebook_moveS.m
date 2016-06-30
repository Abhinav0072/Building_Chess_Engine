function legal_moves=swear_rulebook_moveS(current_status,Color)
%%  %This function contain the rules of the legality of the moves.
    %This will give check if a move is legal or not and give a list of all
    %possible moves by all possible pieces alives of one or both, according
    %to need(for AI vs AI,AI vs Human,Human Vs. Human)
     
    % "status matrix" :- will give the current status of board to help decide
    % which pieces possible moves need to be given out.
    
%% Calculating all possible moves for each piece of required color
% files=['a';'b';'c';'d';'e';'f';'g';'h'];
[m,~]=size(current_status);
for i=1:m,
    
    %Writing rule for Rook
    if strcmp(current_status(i).status,'Alive')&&(and(strcmp(current_status(i).color,Color),strcmp(current_status(i).piece,'Rook')))
      upper_highest=8;
      upper_color='None';
      lower_lowest=1;
      lower_color='None';
      left_lowest=1;
      left_color='None';
      right_highest=8;
      right_color='None';
      for j=1:m,
          if (j~=i)
              if (current_status(j).file==current_status(i).file)
                  if (current_status(j).rank>current_status(i).rank)
                      if (current_status(j).rank<=upper_highest)
                          upper_highest=current_status(j).rank;
                          upper_color=current_status(j).color;
                      end
                  elseif (current_status(j).rank<current_status(i).rank)
                      if (current_status(j).rank>=lower_lowest)
                          lower_lowest=current_status(j).rank;
                          lower_color=current_status(j).color;
                      end
                  end  
          elseif (current_status(j).rank==current_status(i).rank)
                  if (current_status(j).file>current_status(i).file)
                      if (current_status(j).file<=right_highest)
                          right_highest=current_status(j).file;
                          right_color=current_status(j).color;
                      end
                  elseif (current_status(j).file<current_status(i).file)
                      if (current_status(j).file>=left_lowest)
                          lower_lowest=current_status(j).file;
                          left_color=current_status(j).color;
                      end
                  end 
              end
          end
      end
      if strcmp(upper_color,'None')
      end
          
    end
    
    
end
end