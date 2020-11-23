function [k_all,x_kall] = Newton_pre(fun,x0,precision)
% ţ�ٷ� ��֪��������ֵ������
syms x
y = fun(x);
dif = matlabFunction(diff(y));

k = 0;
x = x0;
f = fun(x);
df = dif(x);
x_k = x-f/df;
while abs(x_k-x)>precision
    k = k+1;
    k_all(k) = k;
    x_kall(k) = x_k;
    x = x_k;
    f = fun(x);
    df = dif(x);
    x_k = x-f/df;
    if k>999
        disp('û���ҵ���');
        return
    end    
end
end