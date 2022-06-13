%% 输入数据
clear all
load Dataset_1.mat
load similartymatri_1_TED
class = Data(:,1)';%原始数据
data = Data(:,2:end);%trial数据
[m,n] = size(Data);

%% ReCon version
SimMatrix=1-sim_matri;
eps=0.02;
MinPts=3;
Tclass=Mdbscan(data,MinPts,eps,SimMatrix)';  
[ ~,~,~,~,~,~,~,~,DBSCAN_Fmeasure,~] = evaluate(class,Tclass) % the best performance
%%%%%%%%%%% DBSCAN
% Ratio=1.1;
% SimMatrix=1-sim_matri;
% eps=0.1523 ;
% threshold=  0.8950 ;
% eta=eps*Ratio;
%  Tclass=DRSCAN(data,threshold,eps,eta,SimMatrix)';
% [ ~,~,~,~,~,~,~,~,ReCon_DBSCAN_Fmeasure,~] = evaluate(class,Tclass) % the best performance
% 
% %%%%%%%%%%%%%% SNN
% Ratio=1.3; 
% k=ceil(size(data,1)^0.5);
% SimMatrix= SNN(data,k);
% SimMatrix=k-SimMatrix;
% eps=10;
% threshold= 0.5796;
% eta=eps*Ratio;
% Tclass=DRSCAN(data,threshold,eps,eta,SimMatrix)';
% [ ~,~,~,~,~,~,~,~,ReCon_SNN_Fmeasure,~] = evaluate(class,Tclass) % the best performance
% 
% %%%%%%%%%%%% OPTICS
% minpts=8;
% minpts2=28;
% epsilon=0.01;
% d=pdist2(data,data,'minkowski',2);
% [ SetOfClusters, RD, CD, order ] = ReConOPTICS(data, minpts,minpts2, epsilon, d);
% [ReCon_OPTICS_Fmeasure,~]=FmeasOPTICS( SetOfClusters,order,class) % the best performance