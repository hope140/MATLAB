function [coef,intercept]=LSM(x,y)
n = size(x,2);  % 样本数量
x_avg = sum(x)/n;   % 样本均值
y_avg = sum(y)/n;   % 样本均值
B_1 = 0;
B_2 = 0;
for i = 1:n
    B_1 = B_1+(x(i)-x_avg)*(y(i)-y_avg);
    B_2 = B_2+(x(i)-x_avg)^2;
end
coef = B_1/B_2;    % 系数
intercept = y_avg-coef*x_avg;   % 截距
y_predict = coef*x+intercept;  % 预测值
plot(x,y,'ro',x,y_predict,'b-');
legend('Training data','Linear regression');
end