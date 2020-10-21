data = xlsread('.\第一次实验数据.xlsx');
t = data(:,1);
tem = data(:,2);
plot(t,tem);
xlabel('时间(t/s)');
ylabel('温度(tem/^oC)');


