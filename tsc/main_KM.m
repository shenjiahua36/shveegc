
%% 输入数据

clear all
load Dataset_1

ol = Data(:,1)';%原始数据
Data = Data(:,2:end);%trial数据
[m,n] = size(Data);
time = [];
%% 数据预处理
% 标准化
% a =  zscore(Data');
% Data = a';
%中心化
% for i =1:m
%     Data(i,:) = Data(i,:) - mean(Data(i,:));
% end

%% 小波
% [m,n] = size(Data);
% %小波分解
% for i = 1:m
%     [m_wave(i,:) ,l]= wavedec(Data(i,:),6,'db5');
% end
% %重构
% for i = 1:m
%     m_wave2(i,:)= wrcoef('a',m_wave(i,:),l,'db5',6);
% end
% Data = m_wave2;
% 
% m_fft = zeros(m,n/8);
% for i = 1:m
%     y_f = abs(fft(m_wave2(i,:)));
%     m_fft(i,:) = y_f(1:length(y_f)/8);
% end
% 
% %拼接
% Data = [Data m_fft];




%% FFT
% [m,n] = size(Data);
% m_fft = zeros(m,n);
% %傅里叶变化（取32hz）
% for i = 1:m
%     y_f = abs(fft(Data(i,:)));
%     m_fft(i,:) = y_f(1:length(y_f));
% end

% %标准化
% a =  zscore(m_fft');
% m_fft = a';

%中心化
% for i =1:m
%     m_fft(i,:) = m_fft(i,:) - mean(m_fft(i,:));
% end


%缩放
% D_max=max(max(Data));
% D_min=min(min(Data));
% [m_fft,~] = mapminmax(m_fft,D_min,D_max);

%% km
% times = 10;
% result = zeros(times,4);
% for i = 1:times
% 
%     [mem,cent]   =  kMeans(Data,k);
%     pl = mem';
% 
% %  [CENTS, MEM]  =  km_fun(Data, 2, 100);
% %  pl = MEM(:,3)';
%  
%     [ri, f1, kapa,nmi] = RI_F1_kapa_nmi(ol,pl,k);
%     result(i,:) =[ri,f1,kapa,nmi];
%     
% end
% ave = mean(result);
% ave = ave';
%% km++
times = 10;
result = zeros(times,4);

for i = 1:times

    disp(['i am doing iter:',int2str(i)])
    [mem,cent]   = kmeans(Data,k);
    pl = mem'; 
      [RI,F1,kapa,nmi] = RI_F1_kapa_nmi(ol,pl,k);
      result(i,:) = [RI,F1,kapa,nmi]

end
ave = mean(result);
ave = ave';


%% weight_km1
% times = 10;
% result = zeros(times,4,11);
% for al = 0:10
%     al2 = al/10;
%     for i = 1:times
%         [mem,cent]   =  weight_kMeans(Data,m_fft,k,al2,1-al2,ol);
%          pl = mem';
% 
%          %  [CENTS, MEM]  =  km_fun(Data, 2, 100);
%         %  pl = MEM(:,3)';
%  
%        [ri, f1, kapa,nmi] = RI_F1_kapa_nmi(ol,pl,k);
%         result(i,:,al+1) =[ri, f1, kapa,nmi];
%     end
% end
% mean(result)
%% weight_km2
% times = 10;
% result = zeros(times,4);
% 
% al2 = 0.7;
% for i = 1:times
%     [mem,cent]   =  weight_kMeans(Data,m_fft,k,al2,1-al2,ol);
%     pl = mem';
%     
%     %  [CENTS, MEM]  =  km_fun(Data, 2, 100);
%     %  pl = MEM(:,3)';
%     
%     [ri, f1, kapa,nmi] = RI_F1_kapa_nmi(ol,pl,k);
%     result(i,:) =[ri, f1, kapa,nmi]
% end
% ave = mean(result);
% ave = ave';
%% test
