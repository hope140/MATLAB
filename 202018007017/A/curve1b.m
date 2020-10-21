function [tem,t] = curve1a( )
data = xlsread('.\第一次实验数据.xlsx');
t = data(:,1);
tem = data(:,2);
ta = [197.5 202.5 233 238 268.5 273.5 339.5 344.5 410.5];
ta = ta./7*6;
plot(t,tem);
hold on;
for i = 1:9
plot([ta(1,i) ta(1,i)],[0 250],'--');
hold on;
end
xlabel('时间(t/s)');
ylabel('温度(tem/^oC)');

