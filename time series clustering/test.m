% Datasets into consideration
Datasets = [cellstr('Case_1_5377data'),];

% Sort Datasets and their corresponding Windows (for cDTW)
% DSOrder：第i个原来的位置的记录
[Datasets, DSOrder] = sort(Datasets);

rand_idxs = zeros(length(Datasets),1);
timing_idxs = zeros(length(Datasets),1);

results = zeros(length(Datasets),2);

for i = 1:length(Datasets)
    display(['Dataset being processed: ', char(Datasets(i))]);
%     DS = LoadUCRdataset(char(Datasets(i)));
    DS = load(char(Datasets(i)));
    DS.DataClassLabels = DS.Data(:,1);
    DS.Data = DS.Data(:,2:end);
    DS.DTW_WindowPercentage = round(length(DS.Data(1,:)/12));
    for rep = 1 : 10
        rep
        tic;
        [labels centroids] = kMeansDTW(DS.Data, 2, DS.DTW_WindowPercentage);
        timing_idxs(i) = timing_idxs(i) + toc
        rand_idxs(i) = rand_idxs(i) + RandIndex(labels, DS.DataClassLabels)
    end
    results(i,1) = rand_idxs(i) / 10;
    results(i,2) = timing_idxs(i) / 10;
    dlmwrite( strcat( 'RESULTS_ClusteringKMeansDTW_', num2str(DataSetStartIndex), '_', num2str(DataSetEndIndex) ,'.results'), results, 'delimiter', '\t');
    
end

