clc;clear
format long
x0 = 0;
y0 = 1;
xn = 1;
h = 0.1;
f = Euler('fun',x0,y0,xn,h);
