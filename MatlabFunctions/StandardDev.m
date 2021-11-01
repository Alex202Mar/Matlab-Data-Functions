function [stdResult] = StandardDev(Arr,Mean)
    stdResult = ((sumOf((Mean).^2/(length(Arr)-1)))^0.5);
end

