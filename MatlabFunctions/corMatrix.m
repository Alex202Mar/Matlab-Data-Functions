function [matrix] = corMatrix(Arr1, Arr2, Arr3, Arr4)
    i = 1;
    j = 1;
    columns = 4;
    rows = 4;
    matrix = zeros(4);
    Arrs = zeros(4,406);
    Arrs(1,:) =Arr1;
    Arrs(2,:) =Arr2;
    Arrs(3,:) =Arr3;
    Arrs(4,:) =Arr4;
    while i <= columns
        while j <= rows
            if i == j
                matrix(i,j) = 1;
            else
                matrix(i,j) = CorCoe((Arrs(i,:)),(Arrs(j,:)));
            end
            j = j +1;
        end
        j = 1;
        i = i + 1;
    end
end