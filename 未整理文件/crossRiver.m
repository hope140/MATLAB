function crossRiver(pos_currentS)
global State D numD SS;
global pos_passed pos_end;
global k;
if pos_currentS==pos_end
    showSolution();
else                 
    for i=1:numD
        possibleS=zeros(1,3,'single');    
        possibleS(1,1:2)=State(pos_currentS,1:2)+((-1)^(State(pos_currentS,3)))*D(i,:);
        possibleS(1,3)=1-State(pos_currentS,3);
        sign=ismember(State,possibleS,'rows'); 
        if sum(sign)==1
            [pos_next,~]=find(sign==1);  
            if SS(pos_next)==0                
                SS(pos_next)=1;         
                k=k+1;
                pos_passed(k)=pos_next;  
                crossRiver(pos_next);                              
                SS(pos_next)=0;       
                k=k-1;                  
            end
        end      
    end  
end