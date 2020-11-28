clc;clear
[num,txt] = xlsread('.\data.xlsx');
year = num(:,1);    
disposable = num(:,2);  % 可支配收入
per_capita = num(:,3);  % 人均收入
% 人均收入对可支配收入的影响
[coef,intercept] = LSM(per_capita,disposable);
set(gca, 'xticklabel', get(gca, 'xtick'), 'yticklabel', get(gca, 'ytick'));