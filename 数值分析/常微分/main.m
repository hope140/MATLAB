clc;clear
% format long
x0 = 0;
y0 = 1;
xn = 1;
h = 0.1;
fun = @(x,y) -y+x+1;
fun_i = @(xi) xi+exp(-xi);
[x,y] = Euler(fun,x0,y0,xn,h);
[yi] = I(fun_i,x0,xn,h);
T = [x',y',yi']