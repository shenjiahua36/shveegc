function RunOneNN(DataSetStartIndex, DataSetEndIndex, DistanceIndex)
    
    matlabpool close force local;
    matlabpool local 8;

    Distances = [cellstr('ED'),'NCCc','NCCc_fftnopower2','NCCc_nofft', 'DTW', 'cDTWOptimal','cDTW5','cDTW10'];
        
    % Datasets into consideration
    Datasets = [cellstr('ChlorineConcentration'), 'CinC_ECG_torso',  'DiatomSizeReduction', 'ECGFiveDays', 'FacesUCR', ... 
        'Haptics', 'InlineSkate', 'ItalyPowerDemand', 'MALLAT', 'MedicalImages', 'Motes', 'SonyAIBORobotSurface', ...
        'SonyAIBORobotSurfaceII', 'Symbols', 'TwoLeadECG', 'WordsSynonyms', 'Cricket_X', 'Cricket_Y', 'Cricket_Z',...
        'uWaveGestureLibrary_X', 'uWaveGestureLibrary_Y', 'uWaveGestureLibrary_Z', '50words', 'Adiac', 'Beef',    ...
        'CBF', 'Coffee', 'ECG200', 'FaceAll', 'FaceFour', 'Fish', 'Gun_Point', 'Lighting2', 'Lighting7', 'Plane', ...
        'OliveOil', 'OSULeaf', 'SwedishLeaf', 'Synthetic_control', 'Trace', 'Two_Patterns', 'Wafer', 'Yoga', 'Car'...
        'StarLightCurves', 'Insect','NonInvasiveFatalECG_Thorax1','NonInvasiveFatalECG_Thorax2'];
    
    % For cDTW which optimal parameters to use
    DTW_WindowPercentage = [0,1,0,0,12,2,14,0,0,20,1,0,0,8,5,8,10,17,5,4,4,6,9,0,0,11,0,0,3,2,4,0,6,5,6,0,7,4,6,4,5,1,7,1,16,2,1,0];
                          
    % Sort Datasets and their corresponding Windows (for cDTW)
    [Datasets, DSOrder] = sort(Datasets);    
    DTW_WindowPercentage = DTW_WindowPercentage(DSOrder);
    
    results = zeros(length(Datasets),2);
    
    for i = 1:length(Datasets)

            if (i>=DataSetStartIndex & i<=DataSetEndIndex)

                    display(['Dataset being processed: ', char(Datasets(i))]);
                    DS = LoadUCRdataset(char(Datasets(i)));
                                        
                    switch DistanceIndex
                        case 5
                            DS.DTW_WindowPercentage = round(100/100*length(DS.Data(1,:)));
                        case 6
                            DS.DTW_WindowPercentage = round(DTW_WindowPercentage(i)/100*length(DS.Data(1,:)));
                        case 7
                            DS.DTW_WindowPercentage = round(5/100*length(DS.Data(1,:)));
                        case 8 
                            DS.DTW_WindowPercentage = round(10/100*length(DS.Data(1,:)));
                    end
                    
                    DS.DistanceMetric = DistanceIndex;
                    
                    tic;
                    
                    acc = ParallelOneNNClassifier(DS);

                    results(i,2) = toc;
                    results(i,1) = acc;
           
            end
            
            dlmwrite( strcat( 'RESULTS_ParallelOneNNClassifier_', char(Distances(DistanceIndex)) ,'_', num2str(DataSetStartIndex), '_', num2str(DataSetEndIndex) ,'.results'), results, 'delimiter', '\t');
   
    end
    
    matlabpool close;
    
end
