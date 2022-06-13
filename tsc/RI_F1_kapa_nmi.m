function [RI,F1,kapa,nmi] = RI_F1_kapa_nmi(ol,pl,c)
%RI_F1_KAPA 此处显示有关此函数的摘要
%   此处显示详细说明
%   ol:原始标签
%   pl：预测标签
%   c：类别数目

[ micro, macro ] = micro_macro_PR( pl , ol);
F1 = micro.fscore;
kapa = kappaindex(pl,ol,c);
RI = RandIndex2(pl,ol);
ol2 = reshape_y_ture(ol,c);
pl2 = reshape_y_ture(pl,c);
nmi = NMI_function(pl2,ol2);
result = [RI,F1,kapa,nmi];


end

