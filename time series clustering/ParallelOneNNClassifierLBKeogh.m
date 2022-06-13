function acc = OneNNClassifierLBKeogh(DS)
    
    acc = 0;
    
    parfor id = 1 : DS.TestInstancesCount
        
        best_so_far = inf;
        
		distance_lb = zeros(1, DS.TrainInstancesCount);
		u = upper_b(DS.Test(id,:), DS.DTW_WindowPercentage);
		l = lower_b(DS.Test(id,:), DS.DTW_WindowPercentage);
		
        for i = 1 : DS.TrainInstancesCount
			distance_lb(i) = lb_keogh(DS.Train(i,:),DS.Test(id,:), u, l);
        end
        
        [distance_lb, ordering] = sort(distance_lb);
        
		traindata = DS.Train(ordering,:);
        
		trainclasses = DS.TrainClassLabels(ordering);
        
		for i = 1 : DS.TrainInstancesCount
			if distance_lb(i) < best_so_far
				
                switch DS.DistanceMetric
                    case 1
                        distance = cDTW(traindata(i,:),DS.Test(id,:),DS.DTW_WindowPercentage);
                    case 2
                        distance = cDTW(traindata(i,:),DS.Test(id,:),DS.DTW_WindowPercentage);
                    case 3
                        distance = cDTW(traindata(i,:),DS.Test(id,:),DS.DTW_WindowPercentage);
                    case 4
                        distance = cDTW(traindata(i,:),DS.Test(id,:),DS.DTW_WindowPercentage);
                end
                
				
                if distance < best_so_far
					class = trainclasses(i);
					best_so_far = distance;
				end
			else
				break;
			end
        end
        
        if (DS.TestClassLabels(id) == class)
            acc = acc + 1;
        end
   end
    acc = acc / DS.TestInstancesCount;
end

function lb = lb_keogh(T, Q, U, L)
	T = T.';
	Q = Q.';
	lb = sqrt(sum([[T > U].* [T-U]; [T < L].* [L-T]].^2));
end

function b = lower_b(t, w)
	l = length(t);
	b = zeros(1,l).';
	for i = 1 : l
		b(i) = min(t(max(1,i-w):min(l,i+w)));
	end
end

function b = upper_b(t, w)
	l = length(t);
	b = zeros(1,l).';
	for i = 1 : l
		b(i) = max(t(max(1,i-w):min(l,i+w)));
	end
end
