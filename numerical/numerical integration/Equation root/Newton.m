function[precision,x_k] = Newton(fun,x0,n)
% 牛顿法 已知函数，初值，迭代次数
syms x
y = fun(x);
dif = matlabFunction(diff(y));

x(1) = x0;
for i = 1:n  
    k(i) = i;   % 迭代次数
    f = fun(x(i));
    df = dif(x(i));    
    x_k(i) = x(i)-f/df;
    x(i+1) = x_k(i);
    precision(i) = abs(x_k(i)-x(i));
    while(precision(i)==0)
        printf('当前迭代次数k=%d;方程根x=%.6f',k(i),x_k(i));
        return;
    end
end
end
