clc;clear
% format long
% x0 = 0;
% y0 = 1;
% xn = 1;
% h = 0.1;
% fun = @(x,y) -y+x+1;
% fun_i = @(x) x+exp(-x);

x0 = input('x0 = ');
y0 = input('y0 = ');
xn = input('xn = ');
h = input('h = ');
fun = input('fun = ');
fun_i = input('fun_i = ');

[x,y_I] = I(fun_i,x0,y0,xn,h);    % 精确值
[y_E] = Euler(fun,x0,y0,xn,h);    % 欧拉法
[y_P] = Predictor(fun,x0,y0,xn,h);    % 预估校正法
[y_R] = Runge(fun,x0,y0,xn,h);    %龙格库塔法

T = [x',y_I',y_E',y_P',y_R']

plot(x,y_I,'k', x,y_E,'b-.',x,y_P,'r:',x,y_R,'y--')
title('各方法对比')
legend('精确值','欧拉法','预估校证法','龙格库塔法')
xlabel('x')
ylabel('y_I and y_E and y_P and y_R')
