function [min, max, median, stdResult] = variableCalc(Arr, mean)
    min = Arr(1);
    max = Arr(length(Arr));
    median = Arr((length(Arr)/2));
    stdResult = StandardDev(Arr,mean);
end