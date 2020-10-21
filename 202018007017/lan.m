clc;clear
[tem] = curve1a( );
T0 = 25;        %各温区温度
T1 = 175;
T2 = 195;
T3 = 235;
T4 = 255;
v = 70/60;

T = (T0+T1)/2;  %炉前区域环境温度
length_1 = 25;
t1 = ceil(length_1/v-19);
tem1 = tem(1:2*t1,1);
t = 2*t1;
b = ones(t,1);
tem_1 = ones(t,1);
for i = 1:t
    tem_1(i,1) = log((tem1(i,1)-T)/(25-T));
    b(i,1) = i/2;
end
lan_1 = polyfit(b,tem_1,1)

clear T b i 

T = T1;  %1-5小温区
length_2 = 197.5;
t2 = ceil(length_2/v-19);
tem2 = tem(2*t1:2*t2,1);
t = 2*t2 - 2*t1;
b = ones(t,1);
tem_2 = ones(t,1);
for i = 1:t
    tem_2(i,1) = log((tem2(i,1)-T)/(32.49-T));
    b(i,1) = i/2;
end
lan_2 = polyfit(b,tem_2,1)

clear T b i

T = (T1+T2)/2;    %5,6间隔
length_3 = 202.5;
t3 = ceil(length_3/v-19);
tem3 = tem(2*t2:2*t3,1);
t = 2*t3 - 2*t2;
b = ones(t,1);
tem_3 = ones(t,1);
for i = 1:t
    tem_3(i,1) = log((tem3(i,1)-T)/(166.74-T));
    b(i,1) = i/2;
end
lan_3 = polyfit(b,tem_3,1)

clear T b i

T = T2 ;    %6小温区
length_4 = 233;
t4 = ceil(length_4/v-19);
tem4 = tem(2*t3:2*t4,1);
t = 2*t4 - 2*t3;
b = ones(t,1);
tem_4 = ones(t,1);
for i = 1:t
    tem_4(i,1) = log((tem4(i,1)-T)/(167.59-T));
    b(i,1) = i/2;
end
lan_4 = polyfit(b,tem_4,1)

clear T b i

T = (T2+T3)/2;    %6,7间隔
length_5 = 238;
t5 = ceil(length_5/v-19);
tem5 = tem(2*t4:2*t5,1);
t = 2*t5 - 2*t4;
b = ones(t,1);
tem_5 = ones(t,1);
for i = 1:t
    tem_5(i,1) = log((tem5(i,1)-T)/(178.09-T));
    b(i,1) = i/2;
end
lan_5 = polyfit(b,tem_5,1)

clear T b i

T = T3;    %7小温区
length_6 = 268.5;
t6 = ceil(length_6/v-19);
tem6 = tem(2*t5:2*t6,1);
t = 2*t6 - 2*t5;
b = ones(t,1);
tem_6 = ones(t,1);
for i = 1:t
    tem_6(i,1) = log((tem6(i,1)-T)/(180.23-T));
    b(i,1) = i/2;
end
lan_6 = polyfit(b,tem_6,1)

clear T b i

T = (T3+T4)/2;    %7,8间隔
length_7 = 273.5;
t7 = ceil(length_7/v-19);
tem7 = tem(2*t6:2*t7,1);
t = 2*t7 - 2*t6;
b = ones(t,1);
tem_7 = ones(t,1);
for i = 1:t
    tem_7(i,1) = log((tem7(i,1)-T)/(207.92-T));
    b(i,1) = i/2;
end
lan_7 = polyfit(b,tem_7,1)

clear T b i

T = T4;    %8-9小温区
length_8 = 339.5;
t8 = ceil(length_8/v-19);
tem8 = tem(2*t7:2*t8,1);
t = 2*t8 - 2*t7;
b = ones(t,1);
tem_8 = ones(t,1);
for i = 1:t
    tem_8(i,1) = log((tem8(i,1)-T)/(210.91-T));
    b(i,1) = i/2;
end
lan_8 = polyfit(b,tem_8,1)


clear T b i

T = (T4+T0)/2;    %9,10间隔
length_9 = 344.5;
t9 = ceil(length_9/v-19);
tem9 = tem(2*t8:2*t9,1);
t = 2*t9 - 2*t8;
b = ones(t,1);
tem_9 = ones(t,1);
for i = 1:t
    tem_9(i,1) = log((tem9(i,1)-T)/(241.75-T));
    b(i,1) = i/2;
end
lan_9 = polyfit(b,tem_9,1)

clear T b i

T = T0;    %10,11,炉后区域
length_10 = 435.5;
t10 = floor(length_10/v-19);
tem10 = tem(2*t9:2*t10,1);
t = 2*t10 - 2*t9;
b = ones(t,1);
tem_10 = ones(t,1);
for i = 1:t
    tem_10(i,1) = log((tem10(i,1)-T)/(242.28-T));
    b(i,1) = i/2;
end
lan_10 = polyfit(b,tem_10,1)
