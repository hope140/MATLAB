function [p,p_re] = ploy_fit(x,y,n)
% 多项式拟合函数，x为自变量，y为因变量，n为阶数

x = x-2000;   % 数据处理，此处年份太大影响拟合效果
dx = min(x):0.01:max(x);  % 步长

% 内置函数对比检验
p = polyfit(x,y,n);   
dy_1 = polyval(p,dx);          
plot(dx,dy_1,'g-');        
hold on;
plot(x,y,'ro')
legend('Training data','Linear regression');
xlabel('年份(2000+)');
ylabel('GDP(亿元)');

% 最小二乘法多项式拟合
F = zeros(n+1,length(x));
F(1,:) = 1;
for i = 2:n+1
   for j = 1:length(x) 
        F(i,j) = x(j)^(i-1);      
   end
end
F=F*F';

[m,~] = size(F);
Y = zeros(m,1);
Y(1) = sum(y);
for i = 2:m
    for j = 1:length(y)
        Y(i) = Y(i)+y(j)*x(j)^(i-1);
    end  
end

p_re = F\Y;
p_re = p_re(end:-1:1)';   %数组反序
figure;
plot(x,y,'ro')
hold on;
dy_2 = polyval(p_re,dx);
plot(dx,dy_2,'b-')
legend('Training data','Linear regression');
xlabel('年份(2000+)');
ylabel('GDP(亿元)');




