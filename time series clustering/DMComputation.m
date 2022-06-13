function DMComputation(DataSetStartIndex, DataSetEndIndex, DistanceIndex)

    % Distance Measures into consideration
    % ED = 1
    % NCCc = 2
    % cDTW with defined window = 3
    Distances = [cellstr('ED'), 'NCCc', 'cDTWX'];
    
    % Datasets into consideration
    Datasets = [cellstr('ChlorineConcentration'), 'CinC_ECG_torso',  'DiatomSizeReduction', 'ECGFiveDays', 'FacesUCR', ... 
        'Haptics', 'InlineSkate', 'ItalyPowerDemand', 'MALLAT', 'MedicalImages', 'Motes', 'SonyAIBORobotSurface', ...
        'SonyAIBORobotSurfaceII', 'Symbols', 'TwoLeadECG', 'WordsSynonyms', 'Cricket_X', 'Cricket_Y', 'Cricket_Z',...
        'uWaveGestureLibrary_X', 'uWaveGestureLibrary_Y', 'uWaveGestureLibrary_Z', '50words', 'Adiac', 'Beef',    ...
        'CBF', 'Coffee', 'ECG200', 'FaceAll', 'FaceFour', 'Fish', 'Gun_Point', 'Lighting2', 'Lighting7', 'Plane', ...
        'OliveOil', 'OSULeaf', 'SwedishLeaf', 'Synthetic_control', 'Trace', 'Two_Patterns', 'Wafer', 'Yoga', 'Car'...
        'StarLightCurves', 'Insect','NonInvasiveFatalECG_Thorax1','NonInvasiveFatalECG_Thorax2'];
                              
    % Sort Datasets and their corresponding Windows (for cDTW)
    [Datasets, DSOrder] = sort(Datasets);    
    	
    for i = 1:length(Datasets)
        
        if (i>=DataSetStartIndex & i<=DataSetEndIndex)
            
            display(['Dataset being processed: ', char(Datasets(i))]);

            DS = LoadUCRdataset(char(Datasets(i)));

            % For cDTW
            DS.DTW_WindowPercentage = round(5/100 * length(DS.Data(1,:)));

            DM = [];

            switch DistanceIndex            
                case 1
                    DM = ParallelDM_ED(DS.Data);
                case 2
                    DM = ParallelDM_NCCc(DS.Data);
                case 3
                    DM = ParallelDM_DTW(DS.Data,DS.DTW_WindowPercentage);
            end

            dlmwrite( strcat( 'DATASETS/',char(Datasets(i)),'/', char(Datasets(i)), '_', char(Distances(DistanceIndex)) ,'.distmatrix'), DM, 'delimiter', '\t');
            
        end
        
    end

end