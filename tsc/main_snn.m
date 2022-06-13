clear
clc
filename = [cellstr('Dataset_1'),'Dataset_2','Dataset_3',...
    'Dataset_4','Dataset_5','Dataset_6',...
    'Dataset_7','Dataset_8','Dataset_9',...
    'Dataset_10','Dataset_11','Dataset_12',...
    'Dataset_13','Dataset_14'];
file_num = length(filename);
result = [];
for f = 12
    load(char(filename(f)));
    data = Data(:,2:end);
    class = Data(:,1);
    c=k;
    
    for times = 1:10
        
        k=ceil(size(data,1)^0.5);
        SimMatrix= SNN(data,k);
        SimMatrix=k-SimMatrix;
        Eps=10;
        MinPts=9;
        Tclass=Mdbscan(data,MinPts,Eps,SimMatrix)';
        tmp = length(Tclass);
        %     for i = 1:tmp
        %         if Tclass(i)==-1
        %             Tclass(i) = c+1-class(i);
        %         end
        %     end
        [RI,F1,kapa,nmi] = RI_F1_kapa_nmi(class,Tclass,c);
        result= [result,[RI,F1,kapa,nmi]'];
    end
end