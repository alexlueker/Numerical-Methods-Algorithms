function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice


if nargin~=2
    error('Function must have two inputs')
end
A=zeros(n,m);
x=1:n;
y=1:m;
A(:,1)=x;
A(1,:)=y;
col=2;
% Now the real challenge is to fill in the correct values of A
for row=2:n
    while col<=m
        A(row,col)=A(row-1,col)+A(row,col-1);
        col=col+1;
    end
    col=2;
end

% Things beyond here are outside of your function

% Now the real challenge is to fill in the correct values of A


end
% Things beyond here are outside of your function
