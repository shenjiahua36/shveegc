close all;
clear all;
clc;

load Mix_HS_ALS_data_class0.mat;
load Mix_HS_ALS_label_class0.mat;
load Mix_HS_ALS_data_class1.mat;
load Mix_HS_ALS_label_class1.mat;
label=[Mix_HS_ALS_label_class0+1;Mix_HS_ALS_label_class1+3];
data=[Mix_HS_ALS_data_class0;Mix_HS_ALS_data_class1];
Data=[label,data];