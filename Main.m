%% Deploying Game Manager
%% Checklist (for me)

% give playtime                                                                 (to be done at game time)

% playtime= and how to implement                                                (to be done)

% Assign  role_of_each playing (something=white,something =AI ,with AI_color used in swear rulebook) (done)

% AI engine will also give input in format like the player do                   (to be done after AI engine))
% files=['a';'b';'c';'d';'e';'f';'g';'h'];

% keep track of castling by tracking if king or bishop has moved                (done)
%keep track of promotion of new piece by pawn moving to the end.                (done)
%will keep track of two states one current and other previous at any time.      (done)
%keep track of check and checkmate.                                             (to be done)


%% IMPLEMENTATION
playtime=10;                            % give the playtime of the game (in minutes)
init_state=init_board(playtime);        % Initializing the chess board for first time.
current_status=init_state;              % Initializing the initial status as current status and previous status for first time.
previous_status=init_state;
super_previous_status=init_state;
AI_color='White';                       % assigning the roles to the player (could be anything)
player_color='Black';                   % assigning roles.

% IDEA:(we could run the loop each time we get input either from camera or AI engine and keep running the clock simultaneously)
control_flag=1;
control_color='White';
while (playtime_black>0 || playtime_white>0)
    %% heve to keep the clock counting down simultaneously (I have no idea how to do it now)
    
    %% will take input from Ebin's Code(opponent move) or AI Engine (common input method for both)
     % arguments required  are initial file,initial rank,final file ,final
     % rank,castling,castling_side,promotion,promotion_preference
     % on castling the final and initial will be given of king
     % on promotion the initial position will be given of pawn and final
     % position and preference piece by the player
         
    %% Taking input and checking legality and then updating status (keeping track)
    [khana_index,legal,capturing,promotion_piece_index,castling,castling_side]=take_input(current_status,previous_status,init_file,init_rank,final_file,final_rank,promotion,promotion_preference);
    % updating the match record.
    [current_status,previous_status,super_previous_status]=update_status(current_status,khana_index,legal,capturing,final_file,final_rank,castling,castling_side,promotion,promotion_piece_index);
    
    %% Determining if the king is check or mate or the game is draw
    [check,checkmate,draw]=analyze_game_check(control_color,current_status,previous_status,super_previous_status);
    
    %% Change of control to other player (mainly to be used to control time)
    if control_flag==1
        control_color='Black';
    elseif control_flag==-1
        control_color='White';
    end
    control_flag=control_flag.*(-1);
  
    %% now calculating all legal moves for the AI engine (remove from here ) this will be called by AI engine not here
    legal_moves=swear_rulebook_all_move(current_status,previous_status,AI_color,0);
end
