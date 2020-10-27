clc;clear
format long
fun = @(x) sin(x)/x;
a = 0;
b = 1;
F = (b-a)/6*(1+4*fun((a+b)/2)+fun(b));
F