function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
es=.0001;
maxit=200;
check=func(xl).*func(xu);
fu=func(xu);
fl=func(xl);
nargin
if check>0
    error('no sign change, no roots found')

if fl==0
    root=xl;
    fx=f1;
    ea=0;
elseif fu==0
    root=xu;
    fx=fu;
    ea=0;
else
    error('bracketing error')
end
end
iter=0; xr=xl; ea=100;


while ea>es
    xrold=xr;
    xr=xu-((xl-xu).*func(xu))./(func(xl)-func(xu));
    iter=iter+1;
 
    if xr~0
        ea=abs(((xr-xrold)./(xr))).*100
        
    end
    
    check=func(xl).*func(xu);
        if check < 0
    xl = xr;
  elseif check > 0
    xu = xr;
  else
    ea = 0;
        end
if ea<=es | iter>=maxit;
root=xr
fx=func(xr)
ea=(xr-xrold)./(xr)
iter=1
break


end
end
