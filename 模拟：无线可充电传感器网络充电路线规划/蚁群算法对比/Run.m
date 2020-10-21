clc;
load('coords.mat','coords');  % ���س�����������
% plot(coords(:,1),coords(:,2),'linestyle','none','marker','.','markersize',15,...
% 'markerfaceColor','g','markerEdgeColor','r');
global HFig;
HFig=figure('name','��Ⱥ�㷨���TSP����');
scatter(coords(:,1),coords(:,2),20,'r','filled')   % ��ͼ�ϻ���25�����е�
% ��ע
for ii=1:size(coords,1)
    text(coords(ii,1)-0.5, coords(ii,2)-0.5,sprintf('%d',ii),'fontsize',7);
end
pause(1);
%%
% ������Ⱥ�㷨ʵ��
NC_max=50;  % ����������
Alpha=1.5;  % ������Ϣ����Ҫ�̶ȵĲ���
Beta=5;     % ��������ʽ������Ҫ�̶ȵĲ���
Rho=0.5;    % ��Ϣ������ϵ��
Q=10;       % ��Ϣ��ǿ��
m=3*size(coords,1); % ��������
[R_best,L_best,L_ave,Shortest_Route,Shortest_Length]=ACATSP(coords,NC_max,m,Alpha,Beta,Rho,Q);

