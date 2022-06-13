close all;
clear all;
clc;

load ex3_HS_data_class1;
load ex3_ALS_data_class1;
data=[traindata_HS_class1_ex3;traindata_ALS_class1_ex3];

[r1 c1]=size(data);
n=1:c1;

for i=1:r1-1
    for j=i:r1
        sum1=0;
        sum2=0;
        sum3=0;
        for t=1:c1-1
            sum1=sum1+(data(i,t+1)-data(i,t))*(data(j,t+1)-data(j,t));
            sum2=sum2+(data(i,t+1)-data(i,t))*(data(i,t+1)-data(i,t));
            sum3=sum3+(data(j,t+1)-data(j,t))*(data(j,t+1)-data(j,t));
        end
        cort(j,j)=1;
        cort(i,j)=sum1/(sqrt(sum2*sum3));
        cort(j,i)=cort(i,j);
    end
end

for i=1:r1-1
    for j=i:r1
        fre(j,j)=0;
        fre(i,j)=frechet(n',data(i,:)',n',data(j,:)');
        fre(j,i)=fre(i,j);
    end
end
ma=max(max(fre));
mi=min(min(fre));
for i=1:r1-1
    for j=i:r1
        re(j,j)=1;
        re(i,j)=1-(fre(i,j)-mi)/(ma-mi);
        re(j,i)=re(i,j);
    end
end

for i=1:r1
    for j=1:r1
        DisF(i,j)=(0.5*(1-re(i,j))+0.5*(1-cort(i,j))/2);
        HS_2_ALS_SimF_ex3_class1(i,j)=1-DisF(i,j);
    end
end