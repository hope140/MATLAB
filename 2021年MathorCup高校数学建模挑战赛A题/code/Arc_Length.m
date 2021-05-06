function Arc_Length = Arc_Length(P1, P2, O)
% 求圆弧的长度 
% 输入所求弧的起点P1，终点P2，圆心O 

    r = sqrt((P1(1) - O(1))^2 + (P1(2) - O(2))^2);
    [alpha] = cart2pol(P1(1) - O(1), P1(2) - O(2));
    [beta] = cart2pol(P2(1) - O(1), P2(2) - O(2));
    Arc_Length = r * (abs(alpha - beta));
end
%% [theta,rho] = cart2pol(x,y) 
% 可将笛卡尔坐标转换为极坐标
% theta 是从 x 轴的正向测量的在 x-y 平面中的逆时针角度，以弧度为单位
% 此处我们正需要的是弧度制