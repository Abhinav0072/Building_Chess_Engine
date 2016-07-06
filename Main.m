%% Deploying Game Manager
%% Checklist (for me)

% give playtime (to be done)

% playtime= and how to implement (to be done)

% Assign  role_of_each playing (something =white ,     something =AI ,with
% AI_color used in swear rulebook) (done)

% AI engine will also give input in format like the player do (to be done after AI engine))
% files=['a';'b';'c';'d';'e';'f';'g';'h'];

% keep track of castling by tracking if king or bishop has moved (to be
% done)
%keep track of promotion of new piece by pawn moving to the end. (to be
%done)


%will keep track of two states one current and other previous at any
%time.(done)


%% IMPLEMENTATION
playtime=10;                            % give the playtime of the game (in minutes)
init_state=init_board(playtime);        % Initializing the chess board for first time.
current_status=init_state;              % Initializing the initial status as current status and previous status for first time.
previous_status=init_state;
AI_color='Black';                       % assigning the roles to the player (could be anything)
player_color='White';                   % assigning roles.

% IDEA:(we could run the loop each time we get input either from camera or AI engine and keep running the clock simultaneously)
while (playtime_black>0 || playtime_white>0)
    %% heve to keep the clock counting down simultaneously (I have no idea how to do it now)
    
    %% will take input from Ebin's Code or AI Engine (common for both)
     % arguments required  are initial file,initial rank,final file ,final
     % rank
     
    %% Taking input and checking legality and then updating status (keeping track)
    [khana_index,legal,capturing]=take_input(current_status,previous_status,init_file,init_rank,final_file,final_rank);
    % updating the match record.
    [current_status,previous_status]=update_status(current_status,khana_index,legal,capturing,final_file,final_rank);
  
    %% now calculating all legal moves for the AI engine
    legal_moves=swear_rulebook_all_move(current_status,previous_status,AI_color,0);
end
