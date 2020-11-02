clc;clear
format long
fun = @(x) sin(x)/x;
a = 0;
b = 1; 
F = (b-a)/2*(1+fun(b));
F