function [coef,intercept]=LSM(x,y)
m = size(x,2);  % 赋值列数
x_avg = sum(x)/m;   % 样本均值
Bate_1 = sum(y.*(x-x_avg));
Bate_2 = sum(x.^2)-(sum(x)).^2/m;
coef = Bate_1/Bate_2;    % 决策边界的系数
intercept = sum(y-coef*x)/m;   % 截距
y_predict = coef*x+intercept;  % 预测值
plot(x,y,'ro',x,y_predict,'b--');
legend('Training data','Linear regression');
end

