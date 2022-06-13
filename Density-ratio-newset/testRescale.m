%% test ReScale
% this script compares the performance of original clustering algorithms
% with the performance of their ReScale versions. Parameters for each
% algorithm are tuned to the best. The results are the same as Table 6 of
% the original paper.

clear
clc
load('Case_1_data'); % load a dataset
class=Data(:,1);
data=Data(:,2:end);

%% Original version
%%%%%%%%% DBSCAN
 
SimMatrix=pdist2(data,data,'minkowski',2);
eps=0.02;
MinPts=3;
Tclass=Mdbscan(data,MinPts,eps,SimMatrix)';  
[ ~,~,~,~,~,~,~,~,DBSCAN_Fmeasure,~] = evaluate(class,Tclass) % the best performance
% DBSCAN_kappa=kappaindex(class,abs(Tclass),2)
[DB_zRand,DB_SR,DB_SAR,VI] = zrand(class,abs(Tclass));
DB_SAR

%%%%%%%%% SNN
k=ceil(size(data,1)^0.5);
SimMatrix= SNN(data,k);
SimMatrix=k-SimMatrix;
Eps=10;
MinPts=9;
Tclass=Mdbscan(data,MinPts,Eps,SimMatrix)'; 
[ ~,~,~,~,~,~,~,~,SNN_Fmeasure,~] = evaluate(class,Tclass) % the best performance
% SNN_kappa=kappaindex(class,abs(Tclass),2)
[SNN_zRand,SNN_SR,SNN_SAR,VI] = zrand(class,abs(Tclass));
SNN_SAR

%%%%%%%%%% OPTICS
MinPts=3;
eps=0.01;
d=pdist2(data,data,'minkowski',2);
[ SetOfClusters, RD, CD, order ] = cluster_optics(data,MinPts,eps,d);
[OPTICS_Fmeasure,~]=FmeasOPTICS( SetOfClusters,order,class) % the best performance
% OPTICS_kappa=kappaindex(class,abs(Tclass),2)
[OPTICS_zRand,OPTICS_SR,OPTICS_SAR,VI] = zrand(class,abs(Tclass));
OPTICS_SAR

%% ReScale version
%%%%%%%%%%% DBSCAN
psi=10;
eta=0.1;
[ ndata ] = Rescale( psi,eta,data);
 
SimMatrix=pdist2(ndata,ndata,'minkowski',2);
eps=0.218;
MinPts=10;
Tclass=Mdbscan(ndata,MinPts,eps,SimMatrix)'; 
[ ~,~,~,~,~,~,~,~,ReScale_DBSCAN_Fmeasure,~] = evaluate(class,Tclass) % the best performance
% ReC_DBSCAN_kappa=kappaindex(class,abs(Tclass),2)
[ReC_DB_zRand,ReC_DB_SR,ReC_DB_SAR,VI] = zrand(class,abs(Tclass));
ReC_DB_SAR

%%%%%%%%%%%%%% SNN
psi=1000;
eta=0.5;
[ ndata ] = Rescale( psi,eta,data);

k=ceil(size(ndata,1)^0.5);
SimMatrix= SNN(ndata,k);
SimMatrix=k-SimMatrix;
Eps=11;
MinPts=10;
Tclass=Mdbscan(ndata,MinPts,Eps,SimMatrix)'; % SNN
[ ~,~,~,~,~,~,~,~,ReScale_SNN_Fmeasure,~] = evaluate(class,Tclass) % the best performance
% ReC_SNN_kappa=kappaindex(class,abs(Tclass),2)
[ReC_SNN_zRand,ReC_SNN_SR,ReC_SNN_SAR,VI] = zrand(class,abs(Tclass));
ReC_SNN_SAR

%%%%%%%%%%%% OPTICS
psi=100;
eta=0.1;
[ ndata ] = Rescale( psi,eta,data);

MinPts=2;
eps=0.01;
d=pdist2(ndata,ndata,'minkowski',2);
[ SetOfClusters, RD, CD, order ] = cluster_optics(ndata,MinPts,eps,d);
[ReScale_OPTICS_Fmeasure,~]=FmeasOPTICS( SetOfClusters,order,class) % the best performance
% ReC_OPTICS_kappa=kappaindex(class,abs(Tclass),2)
[ReC_OPTICS_zRand,ReC_OPTICS_SR,ReC_OPTICS_SAR,VI] = zrand(class,abs(Tclass));
ReC_OPTICS_SAR
