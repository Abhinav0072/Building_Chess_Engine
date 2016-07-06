function [current_status,previous_status]=update_status(current_status_now,previous_status_now,khana_index,legal,capturing,final_file,final_rank)
% if the move is legal.
[m,~]=size(current_status_now);
if legal==1
    previous_status=current_status_now;
     if capturing==1
        for i=1:m,
            if current_status_now(i).rank==final_rank && current_status_now(i).file==final_file
                index=i;
                break
            end
        end
        current_status_now(index).status='Dead';
     end
    current_status_now(khana_index).file=final_file;
    current_status_now(khana_index).rank=final_rank;
    current_status_now(khana_index).displacement='Yes';
    current_status=current_status_now;
   
% if the move is illegal.
else
    fprintf('The move is illegal by the player. Please check the move.');
    current_status=current_status_now;
    previous_status=previous_status_now;
end
end