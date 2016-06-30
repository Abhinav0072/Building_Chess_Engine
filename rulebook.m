function [legal_moves,legality_bollean]=rulebook(status_matrix,move_to_check,operation_option)
%%  %This function contain the rules of the legality of the moves.
    %This will give check if a move is legal or not and give a list of all
    %possible moves by all possible pieces alives of one or both, according
    %to need(for AI vs AI,AI vs Human,Human Vs. Human)
    
    % "move to check" :- will be system taken input from player and need to
    %checked for legality
    
    % "status matrix" :- will give the current status of board to help decide
    % which pieces possible moves need to be given out.
    
%% Switching between two option.
[m,~]=size(status_matrix);
for i=1:m,
    if strcmp(status_matrix(i,:),'Rook')      
      
    end
end
end