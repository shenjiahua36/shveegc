function [mem cent] = weight_kMeans(A,B, K,al,bl,pl)
% function [mem cent] = weight_kMeans(A, K,pl)
m=size(A, 1);  %行数
% mem = ceil(K*rand(m, 1));  %随机分配mem
mem = pl;
mem = disrupt(mem,K);
cent = zeros(K, size(A, 2));%初始化中心
cent_b = zeros(K, size(B, 2));%初始化

for iter = 1:1000
    %disp(iter);
    prev_mem = mem; %上次分配数组
    
    %计算中心
    for k = 1:K
        cent(k,:) = kmeans_centroid(mem, A, k, cent(k,:));  
        cent_b(k,:) = kmeans_centroid(mem, B, k, cent_b(k,:));  
    end
    
    for i = 1:m %每条数据
        %x = A(i,:);
        for k = 1:K %每一类
            %y = cent(k,:);
            dist = ED(A(i,:),cent(k,:));
            dist_b = ED(B(i,:),cent_b(k,:));
            final_dist = al*dist+bl*dist_b;
            D(i,k) = final_dist;
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
