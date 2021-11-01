function [LeastSqrErrorAVG, estimatedY] = avgLSE(Arr1, Arr2, a, b)
   i = 1;
   estimatedY = zeros (1, length(Arr1));
   yError = zeros (1, length(Arr1));
   while i <= length(Arr1)
       estimatedY(1,i) = (a + (b*Arr1(i)));
       yError(1,i) = (Arr2(i) - estimatedY(1,i))^2;
       i = i + 1;
   end
   LeastSqrErrorAVG = sumOf(yError)/length(yError);
end