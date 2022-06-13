function [mem cent] = kDBA(A, K)

m=size(A, 1);
mem = ceil(K*rand(m, 1));
cent = zeros(K, size(A, 2));

for iter = 1:10
   disp(iter);
    prev_mem = mem;
    
    for k = 1:K
        cent(k,:) = dba_centroid(mem, A, k, cent(k,:));        
    end
    
    for i = 1:m
        %x = A(i,:);
        for k = 1:K
            %y = cent(k,:);
            dist = cDTW(A(i,:),cent(k,:),length(A(i,:))); 
            D(i,k) = dist;
        end
    end
    
    [val mem] = min(D,[],2);
    if norm(prev_mem-mem) == 0
        break;
    end
end

end


function ksc = dba_centroid(mem, A, k, cur_center)
%Computes centroid
a = [];
for i=1:length(mem)
    if mem(i) == k
        opt_a = A(i,:);
        a = [a; opt_a];
    end
end

if size(a,1) == 0;
    ksc = zeros(1, size(A,2)); 
    return;
end;

ksc = DBA(a,cur_center);

end

function average = DBA(sequences,cur_center)
	
    % Use previous centroid as reference
    average=cur_center;
    average=DBA_one_iteration(average,sequences);
end

function average = DBA_one_iteration(averageS,sequences)

	tupleAssociation = cell (1, size(averageS,2));
	for t=1:size(averageS,2)
		tupleAssociation{t}=[];
	end

	costMatrix = [];
	pathMatrix = [];

	for k=1:size(sequences,1)
	    sequence = sequences(k,:);
	    costMatrix(1,1) = distanceTo(averageS(1),sequence(1));
	    pathMatrix(1,1) = -1;
	    for i=2:size(averageS,2)
		costMatrix(i,1) = costMatrix(i-1,1) + distanceTo(averageS(i),sequence(1));
		pathMatrix(i,1) = 2;
	    end
	    
	    for j=2:size(sequence,2)
		costMatrix(1,j) = costMatrix(1,j-1) + distanceTo(sequence(j),averageS(1));
		pathMatrix(1,j) = 1;
	    end
	    
	    for i=2:size(averageS,2)
		for j=2:size(sequence,2)
		    indiceRes = ArgMin3(costMatrix(i-1,j-1),costMatrix(i,j-1),costMatrix(i-1,j));
		    pathMatrix(i,j)=indiceRes;
		    
		    if indiceRes==0
			res = costMatrix(i-1,j-1);
		    elseif indiceRes==1
			res = costMatrix(i,j-1);
		    elseif indiceRes==2
			res = costMatrix(i-1,j);
		    end
		    
		    costMatrix(i,j) = res + distanceTo(averageS(i),sequence(j));
		    
		end
	    end
	    
	    i=size(averageS,2);
	    j=size(sequence,2);
	    
	    while(true)
		tupleAssociation{i}(end+1) = sequence(j);
		if pathMatrix(i,j)==0
		    i=i-1;
		    j=j-1;
		elseif pathMatrix(i,j)==1
		    j=j-1;
		elseif pathMatrix(i,j)==2
		    i=i-1;          
		else
		    break;
		end
	    end
	    
	end

	for t=1:size(averageS,2)
	   averageS(t) = mean(tupleAssociation{t});
	end
	   
	average = averageS;

end

function value = ArgMin3(a,b,c)

	if (a<b)
	    if (a<c)
		value=0;
		return;
	    else
		value=2;
		return;
	    end
	else
	    if (b<c)
		value=1;
		return;
	    else
		value=2;
		return;
	    end
	end

end

function dist = distanceTo(a,b)
    dist=(a-b)*(a-b);
end
