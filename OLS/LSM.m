function [coef,intercept,MSE,S_e,SST,SSR,SSE,R2] = LSM(x,y)
n = size(x,1);  % 样本数量
x_avg = sum(x)/n;   % 样本均值
y_avg = sum(y)/n;   % 样本均值

% 算法
B_1 = 0;
B_2 = 0;
for i = 1:n
    B_1 = B_1+(x(i)-x_avg)*(y(i)-y_avg);
    B_2 = B_2+(x(i)-x_avg)^2;
end
coef = B_1/B_2;    % 系数
intercept = y_avg-coef*x_avg;   % 截距
y_predict = coef*x+intercept;  % 预测值
figure(1); 
plot(x,y,'ro',x,y_predict,'b-');
legend('Training data','Linear regression');

% 检验
MSE = 1/(n-2)*sum((y-y_predict).^2);    % 残差的样本方差
S_e = MSE^(1/2);
SST = sum((y-y_avg).^2);                % 原始数据y的总变异平方和
SSR = sum((y_predict-y_avg).^2);        % 用拟合直线可解释的变异平方和
SSE = sum((y-y_predict).^2);            % 残差平方和
R2 = SSR/SST;                           % 判定系数
% MSE = 0;
% SST = 0;
% SSR = 0;
% SSE = 0;
% R2 = 0;
% for i = 1:n
%     MSE = MSE+1/(n-2)*((y(i)-y_predict(i))^2);
%     SST = SST+(y(i)-y_avg)^2;
%     SSR = SSR+(y_predict(i)-y_avg)^2;
%     SSE = SSE+(y(i)-y_predict(i))^2;
%     R2 = SSR/SST;
% end 
%     S_e = MSE^(1/2);
end