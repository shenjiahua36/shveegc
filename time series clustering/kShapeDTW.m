function [mem cent] = kShape(A, K)

m=size(A, 1);
mem = ceil(K*rand(m, 1));
cent = zeros(K, size(A, 2));

for iter = 1:100
    disp(iter);
    prev_mem = mem;
    
    for k = 1:K
        cent(k,:) = kshape_centroid(mem, A, k, cent(k,:));
    end
    
    for i = 1:m
        %x = A(i,:);
        for k = 1:K
            %y = cent(k,:);
	    dist = cDTW(A(i,:),cent(k,:), round(100/100*length(A(1,:))));
	    D(i,k) = dist;
        end
    end
    
    [val mem] = min(D,[],2);
    if norm(prev_mem-mem) == 0
        break;
    end
end

end

function centroid = kshape_centroid(mem, A, k, cur_center)
%Computes centroid
a = [];
for i=1:length(mem)
    if mem(i) == k
        if sum(cur_center) == 0
            opt_a = A(i,:);
        else
             [tmp tmps opt_a] = SBD(cur_center, A(i,:));
        end
        a = [a; opt_a];
    end
end

if size(a,1) == 0;
    centroid = zeros(1, size(A,2)); 
    return;
end;

[m, ncolumns]=size(a);
[Y mean2 std2] = zscore(a,[],2);
S = Y' * Y;
P = (eye(ncolumns) - 1 / ncolumns * ones(ncolumns));
M = P*S*P;

[V D] = qdwheig(M);

centroid = V(:,end);

finddistance1 = sqrt(sum((a(1,:) - centroid').^2));
finddistance2 = sqrt(sum((a(1,:) - (-centroid')).^2));

if (finddistance1<finddistance2)
    centroid = centroid;
else
    centroid = -centroid;
end

centroid = zscore(centroid);


end

