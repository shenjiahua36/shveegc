function [RI,F1,kapa,nmi] = RI_F1_kapa_nmi(ol,pl,c)
%RI_F1_KAPA �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%   ol:ԭʼ��ǩ
%   pl��Ԥ���ǩ
%   c�������Ŀ

[ micro, macro ] = micro_macro_PR( pl , ol);
F1 = micro.fscore;
kapa = kappaindex(pl,ol,c);
RI = RandIndex2(pl,ol);
ol2 = reshape_y_ture(ol,c);
pl2 = reshape_y_ture(pl,c);
nmi = NMI_function(pl2,ol2);
result = [RI,F1,kapa,nmi];


end

