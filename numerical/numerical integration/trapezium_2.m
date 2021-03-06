clc;clear
format long
fun = @(x) x^(1/2);
n = input('n= ');
a = 1;
b = 9;
%fun表示函数，n表示精度，a，b表示区间两端点
h = (b-a)/n;     
T_1 = 0;

for k = 1:n-1
    x = a+k*h;
    if x == 0
        T_1 = T_1+1;
    else
        T_1 = T_1+fun(x);
    end
end

T_2 = fun(a)+fun(b);    
T_n = h/2*(2*T_1+T_2)
