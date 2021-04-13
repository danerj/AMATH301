function [x,iter] = Newton(g,gprime,x0,tol)

% A function that performs Newton's method
% Input Variables:
%   g - the function that we wish to find the zeros of
%   x0 - the initial guess%   tol - the method will stop when g(x) < tol
% Output Variables:
%   x - the x value where g(x) = 0
%   iter - the number of iterations

iter = 0;
maxIter = 10000;
x = x0;

while abs(g(x)) > tol && iter < maxIter
    
    x= x - g(x)/gprime(x);
    iter = iter+1;
end

end