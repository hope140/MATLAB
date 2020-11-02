function [y_P] = Predictor(fun,x0,y0,xn,h)
% 预估校正法 右端函数fun，初值x0,y0,端点xn,步长h
n = (xn-x0)/h;    % 区间的个数
x = zeros(1,n+1);
y_P = zeros(1,n+1);
x(1) = x0;
y_P(1) = y0;

for i = 1:n
    x(i+1) = x(i)+h;
    y_p = y_P(i)+h*fun(x(i),y_P(i));
    y_c = y_P(i)+h*fun(x(i+1),y_p);
    y_P(i+1) = 1/2*(y_p+y_c);
end
