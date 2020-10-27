clc;clear
format long
fun = @(x) sin(x)/x;    %函数可更改
% fun = @(x) x/(4+x^2);
% fun = @(x) x^(1/2);
n = input('n= ');       %输入精度
a = 0;                  
b = 1;
% a = 1;
% b = 9;
h = (b-a)/n;
S_1 = 0;                %置空
S_2 = 0;

for k = 0:n-1
    x = a+k*h;
    x1 = x+1/2*h;        %不存在x1=0的情况
    S_1 = S_1+fun(x1);
end
clear k x
for k = 1:n-1
    x = a+k*h;           %不存在x=0的情况
    S_2 = S_2+fun(x);
end
S_3 = 1+fun(b);
% S_3 = fun(a)+fun(b);
S_n = h*(4*S_1+2*S_2+S_3)/6;
S_n
