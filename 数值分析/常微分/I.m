function [yi] = I(fun_i,x0,xn,h)
% 此处为写成通用形式，所以麻烦许多，大可不必
n = (xn-x0)/h;    % 区间的个数
xi = zeros(1,n+1);
yi = zeros(1,n+1);
for k = 1:n
    xi(k+1) = xi(k)+h;
    yi(k+1) = fun_i(xi(k))
end
