clc, clear

dt = 0.1;                                                                   % 时间的步长
car_length = 5;                                                             % 车长
car_width = 2;                                                              % 车宽
car_wheel_base = 2.8;                                                       % 轴距
safedistance = 0.3;                                                         % 最小安全距离
wheel_angle_max = 470/16;                                                   % 将方向盘最大转角转化为前轮最大转角
wheel_speed_max = 400/16;                                                   % 将方向盘最大转速转化为前轮最大转角速度
throttle_acc_max = 3;                                                       % 最大油门加速度
throttle_dec_max = -5;                                                      % 极限刹车减速度
wheel_angle = 0;                                                            % 前轮转角
x0 = 6.53023;                                                               % 无人车控制点在t0时刻的坐标
y0 = 3.970426;
theta = 0.5194235;                                                          % 初始车身朝向角theta，车身朝向为方向角，x轴正方向为0，逆时针为正方向，单位rad
cur = 0;                                                                    % 曲率
cur_max = 0.205;                                                            % 最大曲率
curR_min = 1 / cur_max;                                                     % 最小曲率半径4.8780
dcur = 0;                                                                   % 曲率变化率
speed = 0;                                                                  % 速度
acc = 0;                                                                    % 加速度
t = 0;                                                                      % 时间
ALLTrackPointData = [x0, y0, theta, cur, dcur, speed, acc, t];              % 初始化掉头轨迹点
                                                                            % 无人车轨迹点包含：位置坐标、方向角、曲率、曲率变化率、速度、加速度及运动到此点时的时间
A_x = [2.998806; 30.323206; 23.792806; -4.748594; 2.998806];                % 边框A的坐标
A_y = [0.220528; 15.844528; 29.414528; 12.996528; 0.220528];
B_x = [11.149906; -3.120794];                                               % 车道线B的坐标
B_y = [18.121528; 9.912528];
C_x = [12.777706; -1.492994];                                               % 车道线C的坐标
C_y = [15.037528; 6.828528];
D_x = [1.380606; 15.301006; 14.405506; 0.134806; 1.380606];                 % 隔离障碍物D的坐标
D_y = [2.756528; 10.696528; 11.953528; 3.744528; 2.756528];
E_x = [18.39721694; 20.73791694; 13.59911694; 11.25831694; 18.39721694];    % 人行道E的坐标
E_y = [9.025287575; 10.36928757; 23.54228757; 22.19828757; 9.025287575];
F_x = [6.783106; 2.529706; 5.012206; 9.265606; 6.783106];                   % 道路障碍物F的坐标
F_y = [19.744528; 17.311528; 12.971528; 15.404528; 19.744528];
G_x = [20.072206; 13.127906; 14.071306; 21.015606; 20.072206];              % 道路障碍物G的坐标
G_y = [18.822528; 14.850528; 13.201528; 17.173528; 18.822528];

figure(1)                                                                   %绘制调头区域
hold on
plot(A_x, A_y, '-')
plot(B_x, B_y, '-')
plot(C_x, C_y, '-')
plot(D_x, D_y, '-')
% plot(E_x,E_y,'-')
% plot(F_x,F_y,'-')
% plot(G_x,G_y,'-')
plot(x0, y0, '*')

acc = 2;                                                                    % 加速度

% plot(A_x(4),A_y(4),'o')                                                   % 边框A的左顶点
% 车道线B与A的交点
[Int_A_B_x, Int_A_B_y] = Int_Point([B_x(1), B_y(1)], [B_x(2), B_y(2)], [A_x(1), A_y(1)], [A_x(4), A_y(4)]);
% plot(Int_A_B_x,Int_A_B_y,'o')

 % 车道线C与A的交点
[Int_A_C_x, Int_A_C_y] = Int_Point([C_x(1), C_y(1)], [C_x(2), C_y(2)], [A_x(1), A_y(1)], [A_x(4), A_y(4)]);
% plot(Int_A_C_x,Int_A_C_y,'o')

% 隔离障碍物D与A的左交点
[Int_A_D_x, Int_A_D_y] = Int_Point([D_x(3), D_y(3)], [D_x(4), D_y(4)], [A_x(1), A_y(1)], [A_x(4), A_y(4)]);
% plot(Int_A_D_x,Int_A_D_y,'o')

turn_end1 = [(A_x(4) + Int_A_B_x) / 2, (A_y(4) + Int_A_B_y) / 2];           % 计算三条车道的中心（车道从边框A的左顶点到隔离障碍物D分别为1.2.3车道）,也是最佳的调头结束点
turn_end2 = [(Int_A_C_x + Int_A_B_x) / 2, (Int_A_C_y + Int_A_B_y) / 2];
turn_end3 = [(Int_A_C_x + Int_A_D_x) / 2, (Int_A_C_y + Int_A_D_y) / 2];
plot(turn_end1(1), turn_end1(2), '*');
plot(turn_end2(1), turn_end2(2), '*');
plot(turn_end3(1), turn_end3(2), '*');
% plot(D_x(3),D_y(3),'o');

% 计算第二段和第一段的交点
[Int_1(1), Int_1(2)] = Int_Point([x0, y0], [x0 + 20, y0 + 20 * ((D_y(4) - D_y(3)) / (D_x(4) - D_x(3)))], [D_x(2), D_y(2)], [D_x(3), D_y(3)]);
plot(Int_1(1), Int_1(2), '*');

delta_x = D_x(3) - Int_A_D_x;                                               % 计算第二段和第三段的交点（因为有三个车道，所以有三个交点）
delta_y = D_y(3) - Int_A_D_y;
Int_2 = [turn_end1(1) + delta_x, turn_end1(2) + delta_y];
Int_3 = [turn_end2(1) + delta_x, turn_end2(2) + delta_y];
Int_4 = [turn_end3(1) + delta_x, turn_end3(2) + delta_y];
plot(Int_2(1), Int_2(2), '*');
plot(Int_3(1), Int_3(2), '*');
plot(Int_4(1), Int_4(2), '*');

distance1 = pdist([Int_1; x0, y0], 'euclidean');                            % 计算第一、第三段的长度
distance3 = pdist([Int_3; turn_end2], 'euclidean');

line([x0, Int_1(1)], [y0, Int_1(2)], 'linestyle', '--', 'color', 'b')       % 画第一段和第三段的行车轨迹，line([起点横坐标，终点横坐标],[起点纵坐标，终点纵坐标])
line([turn_end1(1), Int_2(1)], [turn_end1(2), Int_2(2)], 'linestyle', '--', 'color', 'b')
line([turn_end2(1), Int_3(1)], [turn_end2(2), Int_3(2)], 'linestyle', '--', 'color', 'b')
line([turn_end3(1), Int_4(1)], [turn_end3(2), Int_4(2)], 'linestyle', '--', 'color', 'b')

curR1 = sqrt((Int_2(1) - Int_1(1))^2 + (Int_2(2) - Int_1(2))^2) / 2;        % 计算第二段的转弯半径
curR2 = sqrt((Int_3(1) - Int_1(1))^2 + (Int_3(2) - Int_1(2))^2) / 2;
curR3 = sqrt((Int_4(1) - Int_1(1))^2 + (Int_4(2) - Int_1(2))^2) / 2;

circle_center1 = [(Int_2(1) + Int_1(1)) / 2, (Int_2(2) + Int_1(2)) / 2];    % 计算第二段的转弯的圆心
circle_center2 = [(Int_3(1) + Int_1(1)) / 2, (Int_3(2) + Int_1(2)) / 2];
circle_center3 = [(Int_4(1) + Int_1(1)) / 2, (Int_4(2) + Int_1(2)) / 2];
% plot(circle_center1(1),circle_center1(2),'o');
% plot(circle_center2(1),circle_center2(2),'o');
% plot(circle_center3(1),circle_center3(2),'o');

distance2_1 = Arc_Length(Int_2, Int_1, circle_center1);                     % 计算第二段的弧长
distance2_2 = Arc_Length(Int_3, Int_1, circle_center2);
distance2_3 = Arc_Length(Int_4, Int_1, circle_center3);

drawArc(Int_2, Int_1, circle_center1)                              % 画第二段的行车轨迹
drawArc(Int_3, Int_1, circle_center2)                              % 因为在最近的车道转弯半径小于最小曲率半径，故不可取
drawArc(Int_4, Int_1, circle_center3)                              % 因为在最近的车道转弯半径小于最小曲率半径，故不可取
% 转弯半径,即曲率半径curR_min=4.878;

i = 1;
distance = 0;

while i == 1

    if distance <= distance1                                                % 行驶到第二段前
        curR = 0;
        speed = 2;
        acc = 0;
    elseif distance <= distance1 + distance2_1                              % 行驶到第三段前
        curR = curR1;
        speed = 2;
        acc = 0;
    elseif distance <= distance1 + distance2_1 + distance3 + 5              % 掉头结束前
        curR = 0;
        speed = 2;
        acc = 0;
    else
        break
    end

    [NextTrackPointData, distance] = Next_TrackPoint(ALLTrackPointData(end, :), speed, acc, dt, curR, distance);

    ALLTrackPointData = [ALLTrackPointData; NextTrackPointData];

    i = inpolygon(NextTrackPointData(1), NextTrackPointData(2), A_x, A_y); 
end

plot(ALLTrackPointData(:, 1), ALLTrackPointData(:, 2), 'linestyle', '-', 'linewidth', 2, 'color', 'b');
