function [b] = randomise(Arr)
    [m,n] = size(Arr) ;
    idx = randperm(n) ;
    b = Arr ;
    b(1,idx) = Arr(1,:);
end
% https://uk.mathworks.com/matlabcentral/answers/324891-how-to-randomly-shuffle-the-row-elements-of-a-predefined-matrix