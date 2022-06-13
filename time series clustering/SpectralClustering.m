function Label = SpectralClustering(Dist,Num_Cluster)
	affinity = zeros(size(Dist));
	NL1 = zeros(size(Dist));
	D = zeros(size(Dist, 1), 1);
	
	sigma = 1;

	for i=1:size(Dist,1)    
		for j=1:size(Dist,1)
			affinity(i,j) = exp(-Dist(i,j).^2/(2*sigma^2));
		end
	end

	for i=1:size(affinity,1)
		D(i) = sum(affinity(i,:));
	end

	for i=1:size(affinity,1)
		for j=1:size(affinity,2)
			NL1(i,j) = affinity(i,j) / (sqrt(D(i)) * sqrt(D(j)));  
		end
	end
	OPTS.disp = 0;
	OPTS.tol = 1e-3; 
	[nEigVec, dummy] = eigs(NL1, Num_Cluster, 'LM', OPTS);
	
	[eigVectors,eigValues] = eig(NL1);

	nEigVec = eigVectors(:,(size(eigVectors,1)-(Num_Cluster-1)): size(eigVectors,1));

	for i=1:size(nEigVec,1)
		n = sqrt(sum(nEigVec(i,:).^2))+1e-20;    
		U(i,:) = nEigVec(i,:) ./ n;
	end

	[Label,C] = kmeans(U,Num_Cluster,'EmptyAction','singleton'); 
end