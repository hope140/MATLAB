clc;clear
format short
x = 0:0.1:1;
y = x+exp(-x);
T = [x',y']
plot(x,y)