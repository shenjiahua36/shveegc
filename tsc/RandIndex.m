function [RI Part] = RandIndex(Y_star,Y_true)

    [mY,nY]=size(Y_star);
    A=0;B=0;C=0;D=0;
    for i=1:nY
        for j=i+1:nY
            n1=sum(Y_star(:,i)==Y_star(:,j));
            n2=sum(Y_true(:,i)==Y_true(:,j));
            if ((n1==mY)&&(n2==mY))
                A=A+1;
            elseif((n1<mY)&&(n2<mY))
                B=B+1;
            elseif((n1==mY)&&(n2<mY))
                C=C+1;
            else
                D=D+1;
            end
        end
    end
    
    RI = (A+B)/(A+B+C+D);
    Part=[A B C D];
end
