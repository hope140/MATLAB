clc;clear
% format rat
[num,txt] = xlsread('.\data.xlsx');

% 问题一
year = num(:,1);    
disposable = num(:,2);  % 可支配收入
per_capita = num(:,3);  % 人均收入

% 人均收入对可支配收入的影响
[coef,intercept,MSE,S_e,SST,SSR,SSE,R2] = LSM(per_capita,disposable);
fprintf('一元线性回归方程为：Y=%g+%gx\n残差的样本方差为%g\nS_e为%g\n原始数据y的总变异平方和SST为%g\n用拟合直线可解释的变异平方和SSR为%g\n残差平方和SSE为%g\n判定系数R2为%g\n',intercept,coef,MSE,S_e,SST,SSR,SSE,R2)
% set(gca, 'xticklabel', get(gca, 'xtick'), 'yticklabel', get(gca, 'ytick'));
% P=polyfit(per_capita,disposable,1);

% 问题二
GDP = num(:,4);         % 国内生产总值
industry_1 = num(:,5);  % 第一产业
industry_2 = num(:,6);  % 第二产业
industry_3 = num(:,7);  % 第三产业

%三产业对GDP影响
[intercept,coef_1,coef_2,coef_3,SST,U,Q,F,R2,R] = MLR(industry_1,industry_2,industry_3,GDP);
fprintf('\n多元线性回归方程为：Y=%g+%gx1+%gx2+%gx3\n原始数据y的总变异平方和SST为%g\nF为%g\n用拟合直线可解释的变异平方和U为%g\n残差平方和Q为%g\n判定系数R2为%g\nR为%g',intercept,coef_1,coef_2,coef_3,SST,U,Q,F,R2,R)
% set(gca, 'xticklabel', get(gca, 'xtick'), 'yticklabel', get(gca, 'ytick'));
% X = [ones(19,1) industry_1,industry_2,industry_3;
% [b,bint,r,rint,stats]=regress(GDP,X);