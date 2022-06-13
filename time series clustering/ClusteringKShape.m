function ClusteringKShape(DataSetStartIndex, DataSetEndIndex, thisrun)  
        
    % Datasets into consideration
    Datasets = [cellstr('ChlorineConcentration'), 'CinC_ECG_torso',  'DiatomSizeReduction', 'ECGFiveDays', 'FacesUCR', ... 
        'Haptics', 'InlineSkate', 'ItalyPowerDemand', 'MALLAT', 'MedicalImages', 'Motes', 'SonyAIBORobotSurface', ...
        'SonyAIBORobotSurfaceII', 'Symbols', 'TwoLeadECG', 'WordsSynonyms', 'Cricket_X', 'Cricket_Y', 'Cricket_Z',...
        'uWaveGestureLibrary_X', 'uWaveGestureLibrary_Y', 'uWaveGestureLibrary_Z', '50words', 'Adiac', 'Beef',    ...
        'CBF', 'Coffee', 'ECG200', 'FaceAll', 'FaceFour', 'Fish', 'Gun_Point', 'Lighting2', 'Lighting7', 'Plane', ...
        'OliveOil', 'OSULeaf', 'SwedishLeaf', 'Synthetic_control', 'Trace', 'Two_Patterns', 'Wafer', 'Yoga', 'Car'...
        'StarLightCurves', 'Insect','NonInvasiveFatalECG_Thorax1','NonInvasiveFatalECG_Thorax2'];
                      
    % Sort Datasets
    [Datasets, DSOrder] = sort(Datasets);    

    rand_idxs = zeros(length(Datasets),1);
    timing_idxs = zeros(length(Datasets),1);

    results = zeros(length(Datasets),2);
    
    for i = 1:length(Datasets)

            if (i>=DataSetStartIndex & i<=DataSetEndIndex)
		    
                    disp(['Dataset being processed: ', char(Datasets(i))]);
                    DS = LoadUCRdataset(char(Datasets(i)));

                    for rep = 1 : 10
                        rep

                        tic;
                        [labels centroids] = kShape(DS.Data, length(DS.ClassNames));
                        timing_idxs(i) = timing_idxs(i) + toc
                        rand_idxs(i) = rand_idxs(i) + RandIndex(labels, DS.DataClassLabels)
                    end
                    results(i,1) = rand_idxs(i) / 10;
                    results(i,2) = timing_idxs(i) / 10;

            end
            
            dlmwrite( strcat( 'RESULTS_ClusteringKShape_', num2str(DataSetStartIndex), '_', num2str(DataSetEndIndex) ,'_', num2str(thisrun),'.results'), results, 'delimiter', '\t');
   
    end
    
end
