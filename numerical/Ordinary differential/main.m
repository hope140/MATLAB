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

[x,y_I] = I(fun_i,x0,y0,xn,h);    % ��ȷֵ
[y_E] = Euler(fun,x0,y0,xn,h);    % ŷ����
[y_P] = Predictor(fun,x0,y0,xn,h);    % Ԥ��У����
[y_R] = Runge(fun,x0,y0,xn,h);    %���������

T = [x',y_I',y_E',y_P',y_R']

plot(x,y_I,'k', x,y_E,'b-.',x,y_P,'r:',x,y_R,'y--')
title('�������Ա�')
legend('��ȷֵ','ŷ����','Ԥ��У֤��','���������')
xlabel('x')
ylabel('y_I and y_E and y_P and y_R')
