function [k_all,x_kall] = Iteration_pre(fun,x0,precision)
% 迭代法，已知函数，初值以及精度
k = 0;      % 迭代次数
x = x0;
x_k = fun(x);
while abs(x_k-x)>precision
    k_all(k) = k;
    x_kall(k) = x_k;
    k = k+1;
    x = x_k;
    x_k = fun(x);
    if k>99
        disp('没有找到根');
        return
    end    
end
end
