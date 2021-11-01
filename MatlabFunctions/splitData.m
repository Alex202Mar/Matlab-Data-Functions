function [Train, Test] = splitData(Arr)
    Len = length(Arr);
    Tsize = Len * 0.7;
    i = 1;
    j = 1;
    while i <= Len
        if i <= Tsize
            Train(i) = Arr(i);
        elseif i > Tsize
            Test(j) = Arr(i);
            j = j + 1;
        end
        i = i + 1;
    end
end
