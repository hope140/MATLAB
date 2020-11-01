function [x,y] = Euler(fun,x0,y0,xn,h)
% �Ҷ˺���fun����ֵx0,y0,�˵�xn,����h
n = (xn-x0)/h;    % ����ĸ���
x = zeros(1,n+1);
y = zeros(1,n+1);
x(1) = x0;
y(1) = y0;

for i = 1:n
    x(i+1) = x(i)+h;
    y(i+1) = y(i)+h*fun(x(i),y(i));
end

