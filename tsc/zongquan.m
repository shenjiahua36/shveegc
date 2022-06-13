function c_w = zongquan(sim_matri,c)

%生成小矩阵
matri_new1 = sim_matri(c,c);
tri = triu(matri_new1);
% tri(logical(eye(size(tri))))=0;
c_w = sum(sum(tri));
end