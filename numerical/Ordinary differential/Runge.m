function [y_R] = Runge(fun,x0,y0,xn,h)
    % 龙格库塔法 右端函数fun，初值x0,y0,端点xn,步长h
    n = (xn-x0)/h;    % 区间的个数
    x = zeros(1,n+1);
    y_R = zeros(1,n+1);
    x(1) = x0;
    y_R(1) = y0;
    
    for i = 1:n
        x(i+1) = x(i)+h;
        k_1 = fun(x(i),y_R(i));
        k_2 = fun(x(i)+h/2,y_R(i)+h/2*k_1);
        k_3 = fun(x(i)+h/2,y_R(i)+h/2*k_2);
        k_4 = fun(x(i)+h,y_R(i)+h*k_3);
        y_R(i+1) = y_R(i)+h/6*(k_1+2*k_2+2*k_3+k_4);
    end
    