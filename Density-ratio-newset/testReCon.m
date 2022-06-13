%% test ReCon approach
% this script compares the performance of original clustering algorithms
% with the performance of their ReCon versions. Parameters for each
% algorithm are tuned to the best. The results are the same as Table 6 of
% the original paper.

clear
clc
load('Dataset_12'); % load a dataset
% Data=III_V_s1_data;
class=Data(:,1);
data=Data(:,2:end);
kk = k;

%% Original version
% %%%%%%%% DBSCAN
% tic;
% SimMatrix=pdist2(data,data,'minkowski',2);
% eps=0.02;
% MinPts=3;
% Tclass=Mdbscan(data,MinPts,eps,SimMatrix)';  
% Tclass = my_reshape(Tclass,k);
% [RI,F1,kapa,nmi] = RI_F1_kapa_nmi(class,Tclass,k);
% result = [RI,F1,kapa,nmi]

% [ ~,~,~,~,~,~,~,~,DBSCAN_Fmeasure,~] = evaluate(class,Tclass) % the best performance
%DBSCAN_kappa=kappaindex(class,abs(Tclass),3)
% [DB_zRand,DB_SR,DB_SAR,VI] = zrand(class,abs(Tclass));
% DB_SAR
% t_DB=toc;

% %%%%%%%%% SNN
% k=ceil(size(data,1)^0.5);
% SimMatrix= SNN(data,k);
% SimMatrix=k-SimMatrix;
% Eps=10;
% MinPts=9;
% Tclass=Mdbscan(data,MinPts,Eps,SimMatrix)'; 
% [ ~,~,~,~,~,~,~,~,SNN_Fmeasure,~] = evaluate(class,Tclass) % the best performance
% %SNN_kappa=kappaindex(class,abs(Tclass),3)
% [SNN_zRand,SNN_SR,SNN_SAR,VI] = zrand(class,abs(Tclass));
% SNN_SAR
% 
% %%%%%%%%%% OPTICS
% MinPts=3;
% eps=0.01;
% d=pdist2(data,data,'minkowski',2);
% [ SetOfClusters, RD, CD, order ] = cluster_optics(data,MinPts,eps,d);
% [OPTICS_Fmeasure,~]=FmeasOPTICS( SetOfClusters,order,class) % the best performance
% %OPTICS_kappa=kappaindex(class,abs(Tclass),3)
% [OPTICS_zRand,OPTICS_SR,OPTICS_SAR,VI] = zrand(class,abs(Tclass));
% OPTICS_SAR
% 
% 
%% ReCon version
%%%%%%%%%%% DBSCAN
for time = 1:10
tic;
Ratio=1.1;
SimMatrix=pdist2(data,data,'minkowski',2);
eps=0.1523 ;
threshold=  0.8950 ;
eta=eps*Ratio;
 Tclass=DRSCAN(data,threshold,eps,eta,SimMatrix)';
Tclass = my_reshape(Tclass,kk);
[RI,F1,kapa,nmi] = RI_F1_kapa_nmi(class,Tclass,kk);
result1 = [RI,F1,kapa,nmi]';
end
% [ ~,~,~,~,~,~,~,~,ReCon_DBSCAN_Fmeasure,~] = evaluate(class,Tclass) % the best performance
% %ReC_DBSCAN_kappa=kappaindex(class,abs(Tclass),3)
% [ReC_DB_zRand,ReC_DB_SR,ReC_DB_SAR,VI] = zrand(class,abs(Tclass));
% ReC_DB_SAR
% t_DBSCAN=toc;
% 
%%%%%%%%%%%%%% SNN
% for times = 1:10
% tic;
% Ratio=1.3; 
% k=ceil(size(data,1)^0.5);
% SimMatrix= SNN(data,k);
% SimMatrix=k-SimMatrix;
% eps=10;
% threshold= 0.5796;
% eta=eps*Ratio;
% Tclass=DRSCAN(data,threshold,eps,eta,SimMatrix)';
% Tclass = my_reshape(Tclass,kk);
% [RI,F1,kapa,nmi] = RI_F1_kapa_nmi(class,Tclass,kk);
% result2 = [RI,F1,kapa,nmi]';
% % [ ~,~,~,~,~,~,~,~,ReCon_SNN_Fmeasure,~] = evaluate(class,Tclass) % the best performance
% % %ReC_SNN_kappa=kappaindex(class,abs(Tclass),4)
% % [ReC_SNN_zRand,ReC_SNN_SR,ReC_SNN_SAR,VI] = zrand(class,abs(Tclass));
% % ReC_SNN_SAR
% t_SNN=toc;
% end
% 
%%%%%%%%%%%% OPTICS
% tic;
% minpts=8;
% minpts2=28;
% epsilon=0.01;
% d=pdist2(data,data,'minkowski',2);
% [ SetOfClusters, RD, CD, order ] = ReConOPTICS(data, minpts,minpts2, epsilon, d);
% [ReCon_OPTICS_Fmeasure,~]=FmeasOPTICS( SetOfClusters,order,class) % the best performance
% %ReC_OPTICS_kappa=kappaindex(class,abs(Tclass),4)
% [ReC_OPTICS_zRand,ReC_OPTICS_SR,ReC_OPTICS_SAR,VI] = zrand(class,abs(Tclass));
% ReC_OPTICS_SAR
% t_OPTICS=toc;
