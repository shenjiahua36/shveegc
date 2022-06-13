function NMI=NMI_function(Y_star,Y_true_matrix)
[ms,ns]=size(Y_star);
[mt,nt]=size(Y_true_matrix);
up=0;
down1=0;
down2=0;
G=[];
A=[];
N=ns;
for i=1:ms
    index=find(Y_star(i,:)==1);
    G_i=length(index);
    G=[G; G_i];
    
    if G_i~=0
    down1=down1+G_i*log(G_i/N);
    end
end


for j=1:mt
    index=find(Y_true_matrix(j,:)==1);
    A_j=length(index);
    A=[A; A_j];
    
    if A_j~=0
    down2=down2+A_j*log(A_j/N);
    end
end

for i=1:ms    
    for j=1:mt
        Jst=Y_star(i,:)+Y_true_matrix(j,:);
        index=find(Jst(1,:)==2);
        N_ij=length(index);
       
        if N_ij~=0
            up=up+N_ij*log(N*N_ij/G(i)/A(j));
        end
        
    end
end

if down1*down2~=0
    NMI=up/sqrt(down1*down2);
else
    NMI=0;
end

 