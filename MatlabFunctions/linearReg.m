function [a, b] = linearReg(Arr1, Arr2)
    len = length(Arr1);
    y = sumOf(Arr2);
    x = sumOf(Arr1);
    xy = sumOf(Arr1.*Arr2);
    x2 = sumOf(Arr1.^2);
    c = ((len * x2) - (x * x));
    a = ((y * x2) - (x * xy)) / c;
    b = ((len * xy-(x * y)) / c);
end