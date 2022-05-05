function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
[row,col]=size(A); 
L=eye(col);
P=L;
U=A;
if row~=col
    error('Matrix must be square')
end
for i=1:col %Begin finding max value in order to begin pivot process
    [maxval row]=max(abs(U(i:col,i))) 
    row=row+i-1
    if row~=i %pivoting process
        x=U(i,:); 
        U(i,:)=U(row,:);
        U(row,:)=x; 
        x=P(i,:); 
        P(i,:)=P(row,:);
        P(row,:)=x 
           if i>=1 || i>=col
            x=L(i,1:i-1);
            L(i,1:i-1)=L(row,1:i-1);
            L(row,1:i-1)=x;
        end 
    end
    for val=i+1:col  %Create L and U
        
        L(val,i)=U(val,i)/U(i,i);
      
        U(val,:)=U(val,:)-L(val,i)*U(i,:);
        
    end

   disp(L)
   disp(U)
   disp(P)
end