data = xlsread('.\��һ��ʵ������.xlsx');
t = data(:,1);
tem = data(:,2);
plot(t,tem);
xlabel('ʱ��(t/s)');
ylabel('�¶�(tem/^oC)');


