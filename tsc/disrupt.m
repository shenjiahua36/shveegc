function [mem_new] = disrupt(mem,K)
[n,m] = size(mem);
times = ceil(m/(K*2));
mem_new = mem;
old_index = [-1];
for i = 1:times
    flag=0;
    while flag==0
        index = ceil(rand*(m-1)+1);
        if 0==ismember(index,old_index)
            mem_new(index)=K+1-mem_new(index);
            flag =1;
            old_index = [old_index,index];
        else
            flag=0;
        end
        
    end
    

end

