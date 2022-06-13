function Y_true=reshape_y_ture_reverse(Y_true_matrix)
    [m,n] = size(Y_true_matrix);
    if m>n
        Y_true_matrix = Y_true_matrix';
    end
    [m,n] = size(Y_true_matrix);
    Y_true = zeros(1,n);
    c = m;
    for i = 1:n
        index = find(Y_true_matrix(:,i)==1);
        Y_true(i) = index;
    end

end