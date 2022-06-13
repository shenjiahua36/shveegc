clear all;
clc
load Case1_600.mat;
load Case1_predictlabel_kDBA.mat;
te=Data(:,1);
%pr=predictlabel;
[r c]=size(pr)
tp=0;
fn=0;
fp=0;
tn=0;

for i=1:r
    if pr(i)==1 & te(i)==1
        tp=tp+1;
    end
    if pr(i)==1 & te(i)==2
        fn=fn+1;
    end
    if pr(i)==2 & te(i)==1
        fp=fp+1;
    end
    if pr(i)==2 & te(i)==2
        tn=tn+1;
    end
end
c=(tp+tn)/(tp+tn+fp+fn);%RI

p=tp/(tp+fp);%查准率
r=tp/(tp+fn);%查全率
f=2*p*r/(p+r)%F1
[micro, macro] = micro_macro_PR(pr,te);%f1

kk=kappaindex(pr,te,2)