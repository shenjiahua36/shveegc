function pl = my_reshape(pl,k)
    pl = abs(pl);
    len = length(pl);
    for i = 1:len
        if pl(i)>k
            pl(i) = mod(pl(i),k)+1;
        end
    end
end