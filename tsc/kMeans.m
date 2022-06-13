function [mem cent] = kMeans(A, K)

m=size(A, 1);
mem = ceil(K*rand(m, 1));
cent = zeros(K, size(A, 2));

for iter = 1:100
    %disp(iter);
    prev_mem = mem;
    
    for k = 1:K
        cent(k,:) = kmeans_centroid(mem, A, k, cent(k,:));     
    end
    
    for i = 1:m
        %x = A(i,:);
        for k = 1:K
            %y = cent(k,:);
            dist = ED(A(i,:),cent(k,:));
            D(i,k) = dist;
        end
    end
    
    [val mem] = min(D,[],2);
    if norm(prev_mem-mem) == 0
        break;
    end
end

end

function centroid = kmeans_centroid(mem, A, k, cur_center)
%Computes centroid
a = [];
for i=1:length(mem)
    if mem(i) == k
        opt_a = A(i,:);
        a = [a; opt_a];
    end
end

if size(a,1) == 0;
    centroid = zeros(1, size(A,2)); 
    return;
end;

centroid = mean(a);

end
