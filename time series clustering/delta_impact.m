close all;
clear all;
clc;


ri = [0.0171 	0.0533 	0.0456 	0.0290 	0.1008 


  ;
      0 0 0 0 0;
      0 0 0 0 0 ;];

fscore = [0 0 0 0 0;
          0 0 0 0 0;
          0 0 0 0 0;];
            



bar(ri);

axis([0.6 1.4 0.01 0.11]);
colormap(jet);
% set(gca,'XTickLabel',{'RI'});
% set(gca,'XTickLabel',{'F-score'});
% set(gca,'XTickLabel',{'kappa'});
set(gca,'XTickLabel',{'NMI'});
% legend('ED','NCCc','DTW','CCOS','ICOS');
set(gca,'YGrid','on');
set(gca,'XGrid','on');
set(gca,'position',[0.2,0.1,0.2,0.8]) 
set(gca,'FontName','Times New Roman','FontSize',13)
% title('CoGEEGc with different distance measures on #15 dataset');

