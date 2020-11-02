function [x,y_I] = I(fun_i,x0,y0,xn,h)
    % ��ȷ�⣬�˴�Ϊд��ͨ����ʽ
    n = (xn-x0)/h;    
    x = zeros(1,n+1);
    y_I = zeros(1,n+1);
    y_I(1) = y0;
    for k = 1:n
        x(k+1) = x(k)+h;    
        y_I(k+1) = fun_i(x(k+1));
    end
    