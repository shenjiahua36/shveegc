%%参数解释
%   C：类别数目
%   mD：数据数量
%   nD：数据维度
%   Y_true：真实标签
%   DT：数据集
%% 数据处理
close all;
clear all;

% load Mix_HS_ALS_data_class0.mat;
% load Mix_HS_ALS_label_class0.mat;
% Data=ItalyPowerDemand_TRAIN;
% Data=[Mix_HS_ALS_label_class0,Mix_HS_ALS_data_class0];
% load Mix_HS_ALS_data_class0.mat;
% load Mix_HS_ALS_label_class0.mat;
% la=Mix_HS_ALS_label_class0+1;
% Data=[la,Mix_HS_ALS_data_class0];
% dataset='ItalyPowerDemand_TRAIN';
load Dataset_1;
dataset = '666'
C=2;

[mD,nD]=size(Data);
ol=Data(:,1);
index=find(ol==0);
ol(index)=C;
index2=find(ol==-1);
ol(index2)=C;

Data=Data(:,2:end);
Data=z_regularization(DT);% regularization 


% Y_true_matrix=reshape_y_ture(Y_true,C);
tic;
f = RSFS_single(Data, ol,dataset);
toc;
