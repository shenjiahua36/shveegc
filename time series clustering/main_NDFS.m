close all;
clear all;
clc

% load ItalyPowerDemand_TRAIN;
% Data=ItalyPowerDemand_TRAIN;
load Case_1_5377data;
% label=Data(:,1);
% Data=Data(:,2:end);
% Data=[label,Data];
C=2;

[mD,nD]=size(Data);
Y_true=Data(:,1);
index=find(Y_true==0);
Y_true(index)=C;
index2=find(Y_true==-1);
Y_true(index2)=C;

Y_true_matrix=reshape_y_ture(Y_true,C);

DT=Data(:,2:end);
DT=z_regularization(DT);% regularization 

% The UDFS feature selection algorithm
% Ref: 
% L21-Norm Regularized Discriminative Feature Selection for Unsupervised Learning. 
% Yi Yang, Heng Tao Shen, Zhigang Ma, Zi Huang and Xiaofang Zhou. 
% International Joint Conferences on Artificial Intelligence 2011, (IJCAI-2011).
% contact: yiyang@cs.cmu.edu
%
% X: the input data matrix;
% X_2: the output selected feature matrix;
% fea_num: the number of selected features
% para.k: the number of knn for local discriminative analysis
% regu: the regularization parameter 

tic;
X=DT;
[mX, nX]=size(X);


para.k=5;
L = LocalDisAna(X', para);
% unsupervised local discriminative analysis 

    [F0 W0] = kMeans(X, C);
F0=reshape_y_ture(F0,C);

% A = X'*L*X;
% [W, obj]=LquadR21_reg(A, 5, r, X0);
% 
% score= sum(W.*W,2);
% [res, idx] = sort(score,'descend');

PL_min=[ 0.1  0.2 0.3];
FeaNumCandi=ceil(PL_min*nX);
alfaCandi = [10^-6,10^-4,10^-2,1,10^2,10^4,10^6];
betaCandi = [10^-6,10^-4,10^-2,1,10^2,10^4,10^6];
nuCandi = [10^-6,10^-4,10^-2,1,10^2,10^4,10^6];
maxIter = 20;

RI=[];
NMI=[];
Time=[];
 time1=toc;
for fea_num=FeaNumCandi
    for alpha = alfaCandi
        for beta = betaCandi
            for gamma = nuCandi
            tic
            [F,W,obj]=AAAI2012(X',L,F0',W0',maxIter,alpha,beta,gamma); 
%             [RI_1 Part] = RandIndex(F',Y_true_matrix);
%             NMI_1=NMI_function(F',Y_true_matrix);
%             RI=[RI;RI_1];
%             NMI=[NMI;NMI_1];
            time2=toc;
            Time=[Time;time1+time2];
            end
        end
    end
end
   result=[max(RI) max(NMI) mean(Time)]
save NDFS_test RI NMI Time