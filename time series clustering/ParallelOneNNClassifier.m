function acc = OneNNClassifier(DS)
    
    acc = 0;
    
    parfor id = 1 : DS.TestInstancesCount
        
        classify_this = DS.Test(id,:);
        
        best_so_far = inf;
        %best_so_far = 0;
        for i = 1 : DS.TrainInstancesCount
            
            compare_to_this = DS.Train(i,:);

            switch DS.DistanceMetric
                case 1
                    distance = ED(compare_to_this, classify_this);
                case 2
                    distance = 1-max( NCCc(compare_to_this,classify_this) );
                case 3
                    distance = 1-max( NCCc_fftnopower2(compare_to_this,classify_this) );
                case 4
                    distance = 1-max( NCCc_nofft(compare_to_this,classify_this) );
                case 5
                    distance = cDTW(compare_to_this,classify_this,DS.DTW_WindowPercentage);
                case 6
                    distance = cDTW(compare_to_this,classify_this,DS.DTW_WindowPercentage);
                case 7
                    distance = cDTW(compare_to_this,classify_this,DS.DTW_WindowPercentage);
                case 8
                    distance = cDTW(compare_to_this,classify_this,DS.DTW_WindowPercentage);
            end
            
           
            if distance < best_so_far
                class = DS.TrainClassLabels(i);
                best_so_far = distance;
            end
        end
        
        if (DS.TestClassLabels(id) == class)
            acc = acc + 1;
        end
    end
    
    acc = acc / DS.TestInstancesCount;
end
