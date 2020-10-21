clc;clear
length_all = 435.5; %ȫ��
T0 = 25;            %�������¶�
T1 = 173;
T2 = 198;
T3 = 230;
T4 = 257;
v = 78/60;

dt = 0.5;           %ʱ�䲽��
t_all = length_all/v;%���ٶ���ȫ��ʱ�䳤��
m = t_all/dt;       %��������
tem_num = ones(m,1);%��ֵ��
for i = 1:m
    x = i/2*v;
    if x < 25
        T = (T0+T1)/2;      %�ý׶λ����¶�
        tem_ini = 25;       %�ý׶γ�ʼ�¶�
        lan_1 = -0.0143;    %�ý׶�lanֵ
        t_1 = i/2;          %�ý׶�ʱ���
        tem_num(i,1) = T + (tem_ini-T)*exp(lan_1*t_1);
        a_1 = i;
    elseif 25 < x && x < 197.5
        T = T1;
        tem_ini = tem_num(a_1,1);
        lan_2 = -0.0198;
        t_2 = i/2 - t_1;
        tem_num(i,1) = T + (tem_ini-T)*exp(lan_2*t_2);
        a_2 = i;
    elseif 197.5 < x && x < 202.5
        T = (T1+T2)/2;
        tem_ini = tem_num(a_2,1);
        lan_3 = -0.0102;
        t_3 = i/2 - t_2 - t_1;
        tem_num(i,1) = T + (tem_ini-T)*exp(lan_3*t_3);
        a_3 = i;
    elseif 202.5 < x && x < 233
        T = T2;
        tem_ini = tem_num(a_3,1);
        lan_4 = -0.0185;
        t_4 = i/2 - t_3 - t_2 - t_1;
        tem_num(i,1) = T + (tem_ini-T)*exp(lan_4*t_4);
        a_4 = i;
    elseif 233 < x && x < 238
        T = (T2+T3)/2;
        tem_ini = tem_num(a_4,1);
        lan_5 = -0.0140;
        t_5 = i/2 - t_4 - t_3 - t_2 - t_1;
        tem_num(i,1) = T + (tem_ini-T)*exp(lan_5*t_5);
        a_5 = i;
    elseif 238 < x && x < 268.5
        T = T3;
        tem_ini = tem_num(a_5,1);
        lan_6 = -0.0275;
        t_6 = i/2 - t_5 - t_4 - t_3 - t_2 - t_1;
        tem_num(i,1) = T + (tem_ini-T)*exp(lan_6*t_6);
        a_6 = i;
    elseif 268.5 < x && x < 273.5
        T = (T3+T4)/2;
        tem_ini = tem_num(a_6,1);
        lan_7 = -0.0210;
        t_7 = i/2 - t_6 - t_5 - t_4 - t_3 - t_2 - t_1;
        tem_num(i,1) = T + (tem_ini-T)*exp(lan_7*t_7);
        a_7 = i;
    elseif 273.5 < x && x < 339.5
        T = T4;
        tem_ini = tem_num(a_7,1);
        lan_8 = -0.022;
        t_8 = i/2 - t_7 - t_6 - t_5 - t_4 - t_3 - t_2 - t_1;
        tem_num(i,1) = T + (tem_ini-T)*exp(lan_8*t_8);
        a_8 = i;
    elseif 339.5 < x && x < 344.5
        T = (T4+T0)/2;
        tem_ini = tem_num(a_8,1);
        lan_9 = 0.0014;
        t_9 = i/2 - t_8 - t_7 - t_6 - t_5 - t_4 - t_3 - t_2 - t_1;
        tem_num(i,1) = T + (tem_ini-T)*exp(lan_9*t_9);
        a_9 = i;
    elseif 344.5 < x && x <= 435.5
        T = T0;
        tem_ini = tem_num(a_9,1);
        lan_10 = -0.0084;
        t_10 = i/2 - t_9 - t_8 - t_7 - t_6 - t_5 - t_4 - t_3 - t_2 - t_1;
        tem_num(i,1) = T + (tem_ini-T)*exp(lan_10*t_10);
        a_10 = i;
    end
end
tem_fix = fix_err(tem_num,2);
tem_avg = avg(tem_fix);
% csvwrite('.\result.csv',tem_fix)
% plot(tem_num)
% xlabel('ʱ��(t)0.5s')
% ylabel('�¶�(tem)^oC')