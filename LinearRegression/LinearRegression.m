function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%Alex Lueker 
%Date Due: April 27, 2022
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
m=length(x)
n=length(y)
if m~=n
    error('x and y must be same length')
end
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder)


Q1= median(y(find(y<median(y))))
Q3= median(y(find(y>median(y))))

Q3sort=sort(Q3);
Q1sort=sort(Q1);
IQR=Q3sort-Q1sort

fX=sortedX
fY=sortedY
i=1
while i<=n
   
    if fY(i)<(Q1-(1.5.*IQR))
        fY(i)=[];
        fX(i)=[];
        n=n-1
        i=i-1
    end
    i=i+1
end
j=1
while j<=n
 
    if fY(j)> (Q3+1.5.*IQR)
        fY(j)=[]
        fX(j)=[]
        n=n-1
        j=j-1
    end
    j=j+1
end



fX
fY
%Calculate basic sums
sumx=sum(fX)
sumy=sum(fY)
sumxy=sum(fX.*fY)
x_sumsquared=(sum(fX)).^2
nl=length(fX)
sumsquarexvals=sum((fX).^2)

%Calculate a1
a1=((nl.*sumxy)-(sumx.*sumy))./((nl.*sumsquarexvals)-(x_sumsquared))

%Averages for fX and fY
avgx=mean(fX)
avgy=mean(fY)

%Calculate a0
a0=avgy-(a1.*avgx)

%Calculate sr and ss to find R^2
sr=sum((fY-((a1.*fX)+a0)).^2)
ss=sum((fY-avgy).^2)
Rsquared=1-(sr./ss)
intercept=a0
slope=a1

%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

end