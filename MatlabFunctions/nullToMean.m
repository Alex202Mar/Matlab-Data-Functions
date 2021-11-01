function [ReturnArr] = nullToMean(Arr, Mean, Len)
    Cnt = 1;
    while Cnt ~= Len+1
        if Arr(Cnt) == 0
            Arr(Cnt) = Mean;
        end
        Cnt = Cnt + 1;
    end
    ReturnArr = Arr;
end