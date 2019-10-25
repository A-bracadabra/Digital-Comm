clear all;
close all;
clc;
N = 10;
X = round(rand(1, 100)*1000)/1000;
X = sort(X);
MSEs = zeros(N, 1);
As = zeros(N, 10);
for i = 1:N
    A = round(rand(1, 10)*1000)/1000;
    A = sort(A);
    MSE = (X(length(X)) - A(1)) ^2 * 100;
    [ newA, newMSE ] = Lloyd_Max( X, A );
    count = 1;
    while newMSE < MSE
        count = count + 1;
        MSE = newMSE;
        A = newA;
        [ newA, newMSE ] = Lloyd_Max( X, A );
    end
    MSEs(i,:) = newMSE;
    As(i,:) = newA;
end
MSEs
As