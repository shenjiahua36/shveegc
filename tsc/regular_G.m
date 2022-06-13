function G_reg=regular_G(G)
[mg,ng]=size(G);
 G_reg=zeros(mg,ng);
for i=1:mg
    index=find(G(i,:)==max(G(i,:)));
    G_reg(i,index(1))=1;
%     G_reg(i,1)=index(1);
end

