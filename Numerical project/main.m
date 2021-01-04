clc;clear
% format rat
[num,txt] = xlsread('.\GDP_data.xlsx');

year = num(:,1); 
GDP = num(:,2);         % 国内生产总值
industry_1 = num(:,3);  % 第一产业
industry_2 = num(:,4);  % 第二产业
industry_3 = num(:,5);  % 第三产业
per_capita = num(:,6);  % 人均收入

[p,p_re] = ploy_fit(year,industry_1,4);
p
p_re