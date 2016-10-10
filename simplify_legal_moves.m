function legal_moves_simplified=simplify_legal_moves(legal_moves)
[m,~]=size(legal_moves);
for i=1:m,
    temp_legal=struct('piece',legal_moves(i).current_status.piece,'initial_file',legal_moves(i).current_status.file,'initial_rank',legal_moves(i).current_status.rank...
        ,'final_file',legal_moves(i).final_file,'final_rank',legal_moves(i).final_rank,'capturing',legal_moves(i).capturing_what);
    if i==1,
        legal_moves_simplified=temp_legal;
    else
        legal_moves_simplified=[legal_moves_simplified;temp_legal];
    end
end
end