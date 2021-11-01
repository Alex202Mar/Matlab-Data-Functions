function [sum] = sumOf(Arr)
    i = 1;    
    sum = 0;
    while i <= length(Arr)
        sum = sum + Arr(i);
        i = i + 1;
    end
end