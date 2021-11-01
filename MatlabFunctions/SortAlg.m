function [returnArr] = SortAlg(Arr, Len)
    for j = 1:Len
         k = j:Len;
         [~,I] = min(Arr(1,k));
         Arr(:,[j k(I)]) = Arr(:,[k(I) j]);
    end
    returnArr = Arr;
end


% for j = 1:Len
%       k = j:Len;
%       [~,I] = min(x(1,k));
%       x(:,[j k(I)]) = x(:,[k(I) j]);
% end