function [L_G G]=Spectral_timeseries_similarity(X,sigma)
[mX,nX]=size(X);
D_G=zeros(nX,nX);
for j=1:nX
    for h=j:nX
        g=norm(X(:,j)-X(:,h));
        G(j,h)=exp(- g^2/sigma^2); 
        G(h,j)=G(j,h);
    end
    D_G(j,j)=sum(G(j,:));
end
L_G=D_G-G; 
