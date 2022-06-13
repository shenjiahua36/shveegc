
%% 输入数据
clear all
load Dataset_14
ol = Data(:,1)';%原始数据
Data = Data(:,2:end);%trial数据
[m,n] = size(Data);

sim_matix_ED = zeros(m,m);
for i = 1 :m
    for j = 1:m
        if(j>i)
            sim_matix_ED(i,j) = ED(Data(i,:),Data(j,:));
        end
        if j==i
            sim_matix_ED(i,j) = 0;
        end
        if(j<i)
            sim_matix_ED(i,j) = sim_matix_ED(j,i);
        end
    end
end
sim_matix_ED = z_regularization(sim_matix_ED);

%%
times = 10;
result = zeros(times,4);
for i = 1:times
    
    C  =  SpectralClustering(sim_matix_ED,k);
    pl = C;
    [RI,F1,kapa,nmi] = RI_F1_kapa_nmi(ol,pl,k);
    result(i,:) = [RI,F1,kapa,nmi] ;
end
ave = mean(result);
ave = ave';
