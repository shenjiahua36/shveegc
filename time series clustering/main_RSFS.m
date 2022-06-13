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
load Case_1_5377data;
dataset='ItalyPowerDemand_TRAIN';
C=2;

[mD,nD]=size(Data);
Y_true=Data(:,1);
index=find(Y_true==0);
Y_true(index)=C;
index2=find(Y_true==-1);
Y_true(index2)=C;

DT=Data(:,2:end);
DT=z_regularization(DT);% regularization 


% Y_true_matrix=reshape_y_ture(Y_true,C);
tic;
f = RSFS_single(DT, Y_true,dataset,2);
toc;
