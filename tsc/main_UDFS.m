clear all
filename = [cellstr('Dataset_1'),'Dataset_2','Dataset_3',...
    'Dataset_4','Dataset_5','Dataset_6',...
    'Dataset_7','Dataset_8','Dataset_9',...
    'Dataset_10','Dataset_11','Dataset_12',...
    'Dataset_13','Dataset_14'];
file_num = length(filename);
output = zeros(4,14);

for f = 7:file_num
    
    load(char(filename(f)));
    C=k;
    [mD,nD]=size(Data);
    Y_true=Data(:,1);
    index=find(Y_true==0);
    Y_true(index)=C;
    index2=find(Y_true==-1);
    Y_true(index2)=C;
    
    Y_true_matrix=reshape_y_ture(Y_true,C);
    
    DT=Data(:,2:end); %数据集
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
    
    
    X=DT;
    [mX, nX]=size(X);
    
    para.k=5;
    
    L = LocalDisAna(X', para);
    % unsupervised local discriminative analysis
    r=0.1;
    X0=rand(nD-1,C);
    
    A = X'*L*X;
    
    times = 10;
    result = [];
    for i = 1:times
        [W, obj]=LquadR21_reg(A, 5, r, X0);
        
        score= sum(W.*W,2);
        [res, idx] = sort(score,'descend');
        
        PL_min=[ 0.1  0.2 0.3];
        FeaNumCandi=ceil(PL_min*nX);
        
        RI=[];
        NMI=[];
        Time=[];
        %     time1=toc;
        
        for fea_num=FeaNumCandi
            tic;
            X_2 = X (:,idx(1:fea_num));
            [Y_hat cent] = kMeans(X_2, C);
            
            %     Y_hat_matrix=reshape_y_ture(Y_hat,C);
            %     [RI_1 Part] = RandIndex(Y_hat_matrix,Y_true_matrix);
            %     NMI_1=NMI_function(Y_hat_matrix,Y_true_matrix);
            %     RI=[RI;RI_1];
            %     NMI=[NMI;NMI_1];
            %     time2=toc;
            %     Time=[Time;time1+time2];
            
            [ri, f1, kapa,nmi] = RI_F1_kapa_nmi(Y_true,Y_hat,C);
            result = [result ; [ri, f1, kapa,nmi]]
        end
    end
    ave = mean(result)';
    output(:,f) = ave;
end
% save UDFS_data7-14 output
