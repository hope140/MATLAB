function showSolution()
global State
global pos_passed
global k count;
count=count+1;
fprintf('Solution %d:\n',count);
fprintf('\t\t  West       East\n');
for i=1:k 
   fprintf(' State%2d:(%d,%d)',i,State(pos_passed(i),1),State(pos_passed(i),2));
    if State(pos_passed(i),3)==1   
        fprintf('бя_____');         
    else
        fprintf('_____бя');
    end
    fprintf('(%d,%d)\n',3-State(pos_passed(i),1),3-State(pos_passed(i),2));
  
    if i~=k
        if State(pos_passed(i),3)==1
            fprintf(' Plan\t:--(%d,%d)->\n',State(pos_passed(i),1)-State(pos_passed(i+1),1),...
                                             State(pos_passed(i),2)-State(pos_passed(i+1),2));
        else
            fprintf(' Plan\t:<-(%d,%d)--\n',State(pos_passed(i+1),1)-State(pos_passed(i),1),...
                                             State(pos_passed(i+1),2)-State(pos_passed(i),2));
        end
    end
end
fprintf('\n');