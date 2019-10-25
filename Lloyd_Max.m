function [ newA, MSE ] = Lloyd_Max( X, A )
mapping = zeros(1, length(X));
newA = zeros(1, length(A));
j = 1;
edge = (A(1) + A(2))/2;
for i = 1:length(X(:))
    while X(i) > edge
        j = j + 1;
        if j == length(A)
            edge = X(length(X));
        else
            edge = (A(j) + A(j + 1))/2;
        end
    end
    mapping(i) = A(j);
end

MSE = dot(X-mapping, X-mapping);
j = 1;
for i = 1 : length(A)
    if j == length(X)
        newA(i) = 1;
        continue;
    end
    
    count = 0;
    sum = 0;
    while j <= length(X) && A(i) == mapping(j)
        sum = sum + X(j);
        j = j + 1;
        count = count + 1;
    end
    if count == 0
        if i == 1
            newA(i) = 0;
        elseif j == length(X)
            newA(i) = 1;
        else
            newA(i) = X(j);
        end
    else
        newA(i) = round(sum/count*1000)/1000;
        % newA(i) = sum/count;
    end
end
end

