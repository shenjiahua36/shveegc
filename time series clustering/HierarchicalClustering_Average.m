function label = HierarchicalClustering_Average(D, Num_Cluster)
	D2 = squareform(D);
	L = linkage(D2, 'average');
	label = cluster(L, 'maxclust', Num_Cluster);
end