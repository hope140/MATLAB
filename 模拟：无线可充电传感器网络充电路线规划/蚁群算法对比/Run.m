clc;
load('coords.mat','coords');  % 加载城市坐标数据
% plot(coords(:,1),coords(:,2),'linestyle','none','marker','.','markersize',15,...
% 'markerfaceColor','g','markerEdgeColor','r');
global HFig;
HFig=figure('name','蚁群算法解决TSP问题');
scatter(coords(:,1),coords(:,2),20,'r','filled')   % 在图上绘制25个城市点
% 标注
for ii=1:size(coords,1)
    text(coords(ii,1)-0.5, coords(ii,2)-0.5,sprintf('%d',ii),'fontsize',7);
end
pause(1);
%%
% 带入蚁群算法实现
NC_max=50;  % 最大迭代次数
Alpha=1.5;  % 表征信息素重要程度的参数
Beta=5;     % 表征启发式因子重要程度的参数
Rho=0.5;    % 信息素蒸发系数
Q=10;       % 信息素强度
m=3*size(coords,1); % 蚂蚁数量
[R_best,L_best,L_ave,Shortest_Route,Shortest_Length]=ACATSP(coords,NC_max,m,Alpha,Beta,Rho,Q);

