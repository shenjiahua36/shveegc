function DM = ParallelDM_NCCc(X)

[m, ncolumns]=size(X);

DM = zeros(m,m);

matlabpool close force local;
%matlabpool local 3; % # of cores
matlabpool local 12; % # of cores
%for i = 1:m
for i=1:m-1
    %disp(i);
    rowi = X(i,:);    
       %for j=i+1:m
       parfor j=i+1:m
            rowj = X(j,:); 
            DM(i,j) = 1-max( NCCc(rowi,rowj) );
       end    
end

matlabpool close;

for i=1:m-1
    %disp(i);
       for j=i+1:m
            DM(j,i) = DM(i,j);
       end    
end



end