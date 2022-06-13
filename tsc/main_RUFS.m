clear all
filename = [cellstr('Dataset_1'),'Dataset_2','Dataset_3',...
    'Dataset_4','Dataset_5','Dataset_6',...
    'Dataset_7','Dataset_8','Dataset_9',...
    'Dataset_10','Dataset_11','Dataset_12',...
    'Dataset_13','Dataset_14'];
file_num = length(filename);
output = zeros(5,14);

for f = 12
    
    load(char(filename(f)));
    dataset='ItalyPowerDemand_TRAIN';
    C=k;
    
    [mD,nD]=size(Data);
    Y_true=Data(:,1);
    index=find(Y_true==0);
    Y_true(index)=C;
    index2=find(Y_true==-1);
    Y_true(index2)=C;
    
    Y_true_matrix=reshape_y_ture(Y_true,C);
    
    DT=Data(:,2:end);
    DT=z_regularization(DT);% regularization
    
    
    %    X: NExample x NFea data matrix.
    %    L: NExample x NExample local learning regularization matrix.
    %    G0: Initial NExample x NClus encoding matrix.
    %    options: 1-by-1 structure for parameters.
    %        options.nu: graph regularization parameter.
    %        options.alpha: parameter on the regression term.
    %        options.beta: parameter to control the row-sparsity of the
    %                      projection matrix.
    %        options.MaxIter: maximal number of iterations, e.g., 10.
    %        options.epsilon: convergence precision, e.g., 1e-4.
    %        options.verbose: if verbose, 1 or 0.
    
    % Y0=Y_true;
    
    
    [Centroid,Y0]=EM(DT',C);
    % index=find(Y0==C);
    % Y0(index)=0;
    % Y0=Y0';
    %
    % G0=Y0/sqrt(Y0'*Y0);
    % G0=z_regularization(G0);
    %
    % G0=reshape_y_ture(G0,C);
    G0=Y0';
    % G0=rand(mD,C);%
    
    maxIter = 20;
    alfaCandi = [10^-6,10^-4,10^-2,1,10^2,10^4,10^6];
    betaCandi = [10^-6,10^-4,10^-2,1,10^2,10^4,10^6];
    nuCandi = [10^-6,10^-4,10^-2,1,10^2,10^4,10^6];
    
    options.MaxIter=maxIter;
    options.epsilon=10^(-4);
    options.verbose=1;
    
    
    sigma=1;
    [L_G G]=Spectral_timeseries_similarity(DT',sigma);
    times = 10;
    result = [];
    for i = 1:times
        RI=[];
        NMI=[];
        F1=[];
        kapa=[];
        Time=[];
        for alpha = alfaCandi
            for beta = betaCandi
                for nu = nuCandi
                    tic
                    options.nu=nu;
                    options.alpha=alpha;
                    options.beta=beta;
                    
                    [ W, F, G ] = RUFS(DT, L_G, G0, options);
                    G_reg=regular_G(G);
                    
                    %             [RI_1 Part] = RandIndex(G_reg',Y_true_matrix);
                    %              NMI_1=NMI_function(G_reg',Y_true_matrix);
                    %              RI=[RI;RI_1];
                    %              NMI=[NMI;NMI_1];
                    y_p = reshape_y_ture_reverse(G_reg');
                    [RI_1, F1_1, kapa_1,NMI_1] = RI_F1_kapa_nmi(Y_true,y_p,C);
                    RI=[RI;RI_1];
                    F1=[F1;F1_1];
                    kapa=[kapa;kapa_1];
                    NMI=[NMI;NMI_1];
                    time=toc;
                    Time=[Time;time];
                end
            end
        end
        result = [result;[max(RI) max(F1) max(kapa) max(NMI) mean(Time)]]
    end
    ave = mean(result)';
    output(:,f) = ave;
end
% save RUFS_Data4-14 output
