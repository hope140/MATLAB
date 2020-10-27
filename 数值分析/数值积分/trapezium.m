clc;clear
format long
fun = @(x) sin(x)/x;
% fun = @(x) x/(4+x^2);
% fun = @(x) x^(1/2);
n = input('n= ');
a = 0;
b = 1;
% a = 1;
% b = 9;
% fun表示函数，n表示精度，a，b表示区间两端点
h = (b-a)/n;     
T_1 = 0;

for k = 1:n-1
    x = a+k*h;
    if x == 0       % x=0时，fun=1
        T_1 = T_1+1;
    else
        T_1 = T_1+fun(x);
    end
end

T_2 = 1+fun(b);    % 此题a=0，所以sinx/x=1，此处本应为fun(a)
% T_2 = fun(a)+fun(b);    
T_n = h/2*(2*T_1+T_2);
T_n
