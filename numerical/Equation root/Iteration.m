function[precision,x_k] = Iteration(fun,x0,n)
% ������ ��֪��������ֵ����������
x(1) = x0;
for i = 1:n    
    k(i) = i;   % ��������
    x_k(i) = fun(x(i));
    x(i+1) = x_k(i);
    precision(i) = abs(x_k(i)-x(i));
    while(precision(i)==0)
        printf('��ǰ��������k=%d;���̸�x=%.6f',k(i),x_k(i));
        return;
    end
end
end
