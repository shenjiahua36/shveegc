%% 输入数据
clear all
filename = [cellstr('Dataset_1'),'Dataset_2','Dataset_3',...
    'Dataset_4','Dataset_5','Dataset_6',...
    'Dataset_7','Dataset_8','Dataset_9',...
    'Dataset_10','Dataset_11','Dataset_12',...
    'Dataset_13','Dataset_14'];
file_num = length(filename);
output = zeros(4,14);

for f = 12
    load(char(filename(f)));
    ol = Data(:,1)';%原始数据
    Data = Data(:,2:end);%trial数据
    [m,n] = size(Data);
    times = 10;
    result = [];
    for i = 1:times
        disp(['_____round______ ',num2str(i)])
        [mem, cent] = KSC(Data, k);
        pl=mem';    %预测label
        [RI,F1,kapa,nmi] = RI_F1_kapa_nmi(ol,pl,k);
        result = [result;[RI,F1,kapa,nmi]];
    end
    ave = mean(result);
    ave = ave';
    output(:,f) = ave;
end
% save KSC_data8-14 output
