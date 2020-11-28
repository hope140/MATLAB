function [B_0,B_1,B_2,B_3,SST,U,Q,F,R2,R] = MLR(x1,x2,x3,y)
X = [ones(19,1) x1 x2 x3];
n = size(X,1);      % 样本行数
m = size(X,2);      % 样本列数
y_avg = sum(y)/n;   % 样本均值
figure(2); 
plot(x1,y,'ro',x2,y,'bo',x3,y,'go');
legend('第一产业','第二产业','第三产业');

% 算法
b = (X'*X)\X'*y;
B_0 = b(1,:);   % 截距
B_1 = b(2,:);   % 系数
B_2 = b(3,:);
B_3 = b(4,:);
y_predict = B_1*x1+B_2*x2+B_3*x3+B_0;  % 预测值

% 检验
SST = sum((y-y_avg).^2);        % 原始数据y的总变异平方和
U = sum((y_predict-y_avg).^2);  % 用拟合直线可解释的变异平方和
Q = sum((y-y_predict).^2);      % 残差平方和
x = (U/m)/(Q/(n-m-1));
F = fpdf(x,m,n-m-1);
R2 = U/SST;                     % 判定系数
R = R2^(1/2);
