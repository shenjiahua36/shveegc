clc;
close all;

folder_now = pwd;  addpath([folder_now, '\funs']);

load Dataset_12
X = Data(:,2:end);
y = Data(:,1);
n = length(y);
c = k;

% n=1000; [X, y] = face_gen(n, 0.1);c=4;   

m=floor(sqrt(n*c));k=3; fig = 1;       
result = [];
times = 10;
for i = 1:times
    % tic
    [laKMM,~,~,A,~,Ah,laKMMh ]= demo(X', c, m,k) ;
%     [RI,F1,kapa,nmi] =  RI_F1_kapa_nmi(y,laKMM,c);
%     result = [result;[RI,F1,kapa,nmi]]
end

% ave = mean(result);
% ave =ave';

% 
% result_KMM = ClusteringMeasure(y, laKMM);
% if ~fig
%     figure('name','KMM')
%     rl = randperm(c);
%     cm = colormap(jet(c+2));
%     for i=1:c
%         plot(X(laKMM==rl(i),1),X(laKMM==rl(i),2),'*', 'color', cm(i,:),'MarkerSize',4); hold on;
%     end
%     plot(A(1,:),A(2,:),'o','MarkerFaceColor', cm(c+2,:),'MarkerEdgeColor',0.3*cm(c+2,:),'MarkerSize',5); hold on;
% end
% % 
% rl = randperm(c);
% for j=1:(size(Ah,2)/m)
%     A2=Ah(:,(m*(j-1)+1):(m*j));
%         if fig
%         figure('name','KMM')
%         cm = colormap(jet(c+2));
%         la=laKMMh(:,j);
%         for i=1:c
%             plot(X(la==rl(i),1),X(la==rl(i),2),'*', 'color', cm(i,:),'MarkerSize',4); hold on;
%         end
%         plot(A2(1,:),A2(2,:),'o','MarkerFaceColor', 'r','MarkerEdgeColor',0.3*cm(c+2,:),'MarkerSize',5); hold on;
%         end
% end
