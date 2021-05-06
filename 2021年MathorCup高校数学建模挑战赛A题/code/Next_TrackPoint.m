
function [NextTrackPointData, distance] = Next_TrackPoint(TrackPointData, speed, acceleration, dt, curvature_radius, distance)
% 用于计算下一时刻的轨迹点数据
% 参数包括最后一个轨迹点的数据，时间步长，车前轮转向角，转弯半径（曲率半径）、

    x_data = TrackPointData(1, 1);
    y_data = TrackPointData(1, 2);
    theta_data = TrackPointData(1, 3);
    curvature_data = TrackPointData(1, 4);
    curvature_variation_data = TrackPointData(1, 5);
    speed_data = speed;
    acceleration_data = TrackPointData(1, 7);
    t_data = TrackPointData(1, 8);

    distance = distance + speed * dt;

    t_next = t_data + dt; %dt 时间的步长

    if curvature_radius ~= 0
        curvature_next = 1 / curvature_radius;
        delta_theta = speed * dt / curvature_radius; 
        length = 2 * curvature_radius * sin(delta_theta / 2);
    else
        curvature_next = 0;
        delta_theta = 0;
        length = speed * dt;
    end

    theta_next = theta_data + delta_theta;
    x_next = x_data + length * cos((theta_data + theta_next) / 2);
    y_next = y_data + length * sin((theta_data + theta_next) / 2);

    curvature_variation_next = (curvature_next - curvature_data) / sqrt((x_next - x_data)^2 + (y_next - y_data)^2);
    speed_next = speed_data + acceleration * dt;
    acceleration_next = acceleration;

    NextTrackPointData = [x_next, y_next, theta_next, curvature_next, curvature_variation_next, speed_next, acceleration_next, t_next];
end
