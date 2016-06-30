function legal_move=create_legal_move_struct(current_status,final_file,final_rank,capturing_what)
legal_move=struct('current_status',current_status,'final_file',final_file,'final_rank',final_rank,'capturing_what',capturing_what);
end