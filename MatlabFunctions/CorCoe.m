function [CCValue] = CorCoe(Arr1, Arr2)
    y = sumOf(Arr2);
    x = sumOf(Arr1);
    xy = sumOf(Arr1.*Arr2);
    x2 = sumOf(Arr1.^2);
    y2 = sumOf(Arr2.^2);
    len = length(Arr1);
    CCValue = (((len*xy-(x*y))/(sqrt(((len*x2)-(x*x))*((len*y2)-(y*y))))));

end