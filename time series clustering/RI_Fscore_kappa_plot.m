close all;
clear all;
clc;

%--------------------II_Ia--------------------------------------
ri=[0.5429 0.5515 0.5746 0.6045 0.6119 0.6194 0.6157 0.5828];
fscore=[0.5534 0.5872 0.625 0.6074 0.6030 0.575 0.5958 0.6028];
kappa=[0.1152 0.1208 0.1493 0.2089 0.2238 0.2388 0.2302 0.1721];

[n m]=size(ri);
t=1:m;
plot(t,ri,'r-o',t,fscore,'g-*',t,kappa,'b->','Linewidth',2);
legend('RI','F-score','kappa');
set(gca,'xticklabel',{'0.4','0.45','0.47','0.5','0.52','0.55','0.57','0.6'});
xlabel('\delta');
title('Impact of \delta on mwcEEGc with II\_Ia');