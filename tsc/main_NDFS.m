%%数据说明
%   C:类别数目
%   mD：数据数量
%   nD：数据维度
%   Y_true：真实标签
%   Y_true_matrix：真实标签（编码）
%   DT：数据集
%
%% 数据处理
clear all
filename = [cellstr('Dataset_1'),'Dataset_2','Dataset_3',...
    'Dataset_4','Dataset_5','Dataset_6',...
    'Dataset_7','Dataset_8','Dataset_9',...
    'Dataset_10','Dataset_11','Dataset_12',...
    'Dataset_13','Dataset_14'];
file_num = length(filename);
output = zeros(5,14);

for f = 8:file_num
    load(char(filename(f)));
    
    C=k;
    
    [mD,nD]=size(Data); %mD：数据数量，nD：数据维度
    Y_true=Data(:,1);   %真实标签
    % index=find(Y_true==0);
    % Y_true(index)=C;
    % index2=find(Y_true==-1);
    % Y_true(index2)=C;
    
    
    Y_true_matrix=reshape_y_ture(Y_true,C); %编码标签
    
    DT=Data(:,2:end);   %DT：数据集
    DT=z_regularization(DT);    %归一化
    
    
    
    %% The UDFS feature selection algorithm
    %
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
%     PL_min=[ 0.1 ];
    FeaNumCandi=ceil(PL_min*nX);
    alfaCandi = [10^-6,10^-4,10^-2,1,10^2,10^4,10^6];
    betaCandi = [10^-6,10^-4,10^-2,1,10^2,10^4,10^6];
    nuCandi = [10^-6,10^-4,10^-2,1,10^2,10^4,10^6];
    maxIter = 20;
    
    
    result = [];
    times = 10;
    
    for i = 1:times
        RI=[];
        NMI=[];
        F1=[];
        kapa=[];
        Time=[];
        time1=toc;
        for fea_num=FeaNumCandi
            for alpha = alfaCandi
                for beta = betaCandi
                    for gamma = nuCandi
                        tic
                        [F,W,obj]=AAAI2012(X',L,F0',W0',maxIter,alpha,beta,gamma);
                        %                 [RI_1 Part] = RandIndex(F',Y_true_matrix);
                        %                 NMI_1=NMI_function(F',Y_true_matrix);
                        y_p = reshape_y_ture_reverse(F');
                        [RI_1, F1_1, kapa_1,NMI_1] = RI_F1_kapa_nmi(Y_true,y_p,C);
                        RI=[RI;RI_1];
                        F1=[F1;F1_1];
                        kapa=[kapa;kapa_1];
                        NMI=[NMI;NMI_1];
                        time2=toc;
                        Time=[Time;time1+time2];
                    end
                end
            end
        end
        result=[result;[max(RI) max(F1) max(kapa) max(NMI) mean(Time)]]
    end
    ave = mean(result)';
    output(:,f) = ave;
end
% save NDFS_data8-14 output