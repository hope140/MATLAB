function [y_E] = Euler(fun,x0,y0,xn,h)
    % ŷ���� �Ҷ˺���fun����ֵx0,y0,�˵�xn,����h
    n = (xn-x0)/h;    % ����ĸ���
    x = zeros(1,n+1);
    y_E = zeros(1,n+1);
    x(1) = x0;
    y_E(1) = y0;
    
    for i = 1:n
        x(i+1) = x(i)+h;
        y_E(i+1) = y_E(i)+h*fun(x(i),y_E(i));
    end