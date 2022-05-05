function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
xl=length(x)
yl=length(y)
if xl~=yl;
    error('Inputs must be the same length')
end
%c=ones(1:xl);
Intcheck= diff(x);
n=x(2)-x(1)
%if Intcheck~=c
 %   error('Intervals must be equally spaced')
%end
for i=3:xl
    if x(i)-x(i-1)~=n
        error('Intervals must be equally spaced')
    end
end

ynew=y(1)
 for iter=2:(xl-2);
      if rem(iter,2)==0
            ynew=ynew+(4.*y(iter))
      end
      if rem(iter,2)~=0
            ynew=ynew+(2.*y(iter))
      end  
 end
 
if rem(yl,2)~=0;
    ynew=ynew+4.*(y(yl-1))+y(yl)
    Isimp=(n./3).*ynew
    I=Isimp
end

if rem(yl,2)==0
    warning('Trapezoidal Rule must be used in last interval')
    ynew=ynew+y(yl-1)
    Isimp=((n./3).*ynew)
    Itrap= ((n./2).*(y(yl)-y(yl-1)))
    I=Isimp+Itrap
end

end