function [Centroid,Cluster]=EM(Data,C)
X=Data;
[mX,nX]=size(X);
epsilon=0.1;

%Initialize centroids
Xmax=max(max(X));
C_t=Xmax*rand(mX,C);
v=2*epsilon;

Y_vector=zeros(1,nX);
while v>epsilon
    Y=zeros(C,nX);
    for i=1:nX
        for j=1:C
            Distance(j)=norm(X(:,i)-C_t(:,j));
        end
        index=find(Distance==min(Distance));
        Y(index,i)=1;
        Y_vector(1,i)=index;
    end
    
    for i=1:C
        index2=find(Y(i,:)==1);
        if length(index2)==0
            index2=ceil(nX*rand(1,1));
        end
        C_tp1(:,i)=mean(X(:,index2),2);
    end
    v=trace((C_tp1-C_t)'*(C_tp1-C_t));
    C_t=C_tp1;
end

Centroid=C_tp1;
Cluster=Y;




