function label = HierarchicalClustering_Single(D, Num_Cluster)
	D2 = squareform(D);
	L = linkage(D2, 'single');
	label = cluster(L, 'maxclust', Num_Cluster);
end