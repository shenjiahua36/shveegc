close all
clear all
clc

load Case_4_5377data.mat;
tl=Data(:,1)';
Data=Data(1:3,2:end);



[mem cent] = KSC(Data, 1);
pl=mem';
% [zRand,SR,SAR,VI] = zrand(tl,pl);
% %% Test K-DBA
% tic;
% [mem cent] = KSC(F,2);
% pr=mem;

% [micro, macro] = micro_macro_PR(pr,te);
% %%kappa
% kk=kappaindex(pr,te,2)
% 
