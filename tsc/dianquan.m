function [f] = dianquan(sim_matix_ED,c,index,beta)
%sim_matri_ED  相似度矩阵
%c 目前簇集合 
%index 外来者
    [~,n]= size(c); %n个索引
    total = 0;
    target_vetor = sim_matix_ED(index,:);
    target_need = target_vetor(c);
    total = sum(target_need);
    m_max = max(target_need);
    
    
%     m_max = sim_matix_ED(c(1),index);
%     for i = 1:n
%         total = total + sim_matix_ED(c(i),index);
%         if sim_matix_ED(c(i),index) > m_max
%             m_max = sim_matix_ED(c(i),index);
%         end
%     end

    total = total/n;

    f = beta * total + (1-beta) * m_max;



end
