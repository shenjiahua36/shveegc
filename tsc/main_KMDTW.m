%% 输入数据
clear all
load Dataset_1.mat
ol = Data(:,1)';%原始数据
Data = Data(:,2:end);%trial数据
k =2; %几分类
[m,n] = size(Data);
DTW_Window = round(length(Data(1,:)));
%% 小波

%小波分解
% for i = 1:m
%     [m_wave(i,:) ,l]= wavedec(Data(i,:),6,'db5');
% end
% %重构
% for i = 1:m
%     m_wave2(i,:)= wrcoef('a',m_wave(i,:),l,'db5',6);
% end
% Data = m_wave2;
%% KMDTW
times = 10;
result = zeros(times,4);
for i = 1:times
    [mem,cent]   =  kMeansDTW(Data,k,DTW_Window);
    pl = mem';
    [ri, f1, kapa,nmi] = RI_F1_kapa_nmi(ol,pl,k);
    result(i,:) = [ri,f1,kapa,nmi]
    
end
ave = mean(result);
ave = ave';
save KMDTW_data1 results ave