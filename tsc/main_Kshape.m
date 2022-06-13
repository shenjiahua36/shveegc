%% 输入数据
clear all
filename = [cellstr('Dataset_1'),'Dataset_2','Dataset_3',...
    'Dataset_4','Dataset_5','Dataset_6',...
    'Dataset_7','Dataset_8','Dataset_9',...
    'Dataset_10','Dataset_11','Dataset_12',...
    'Dataset_13','Dataset_14'];
file_num = length(filename);
output = zeros(4,14);
time = [];
for f = 1:14
    load(char(filename(f)));
    ol = Data(:,1)';%原始数据 
    Data = Data(:,2:end);%trial数据
    [m,n] = size(Data);
    %% Kshape
    times = 10;
    result = zeros(times,4);
    tic;
    for i = 1:times
        disp(['i am doing  iter :',int2str(i)]);
        [mem,cent]   =  kShape(Data,k);
        pl = mem';
        [ri, f1, kapa,nmi] = RI_F1_kapa_nmi(ol,pl,k);
        result(i,:) =[ri,f1,kapa,nmi]
    end
    ave = mean(result);
    ave = ave';
    output(:,f) = ave;
    toc;
    time = [time,toc];
end
save kshapetime time