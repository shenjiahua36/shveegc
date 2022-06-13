
%% 输入数据
clear all
load Dataset_1
ol = Data(:,1)';%原始数据
Data = Data(:,2:end);%trial数据
[m,n] = size(Data);

%% km++
times = 10;
result = zeros(times,4);
for i = 1:times
    disp(['i am doing iter:',int2str(i)])
    pl  =  kmedoids(Data,k)
    pl = pl'; 
      [RI,F1,kapa,nmi] = RI_F1_kapa_nmi(ol,pl,k);
      result(i,:) = [RI,F1,kapa,nmi]
end
ave = mean(result);
ave = ave';
