clc, clear

dt = 0.1;                                                                   
car_length = 5;                                                             
car_width = 2;                                                              
car_wheel_base = 2.8;                                                       
safedistance = 0.3;                                                         
wheel_angle_max = 470/16;                                                   
wheel_speed_max = 400/16;                                                   
throttle_acc_max = 3;                                                       
throttle_dec_max = -5;                                                      
wheel_angle = 0;                                                            
x0 = 6.53023;                                                               
y0 = 3.970426;
theta = 0.5194235;                                                          
cur = 0;                                                                    
cur_max = 0.205;                                                            
curR_min = 1 / cur_max;                                                     
dcur = 0;                                                                   
speed = 0;                                                                  
acc = 0;                                                                    
t = 0;                                                                      
ALLTrackPointData = [x0, y0, theta, cur, dcur, speed, acc, t];              
                                                                            
A_x = [2.998806; 30.323206; 23.792806; -4.748594; 2.998806];                
A_y = [0.220528; 15.844528; 29.414528; 12.996528; 0.220528];
B_x = [11.149906; -3.120794];                                               
B_y = [18.121528; 9.912528];
C_x = [12.777706; -1.492994];                                               
C_y = [15.037528; 6.828528];
D_x = [1.380606; 15.301006; 14.405506; 0.134806; 1.380606];                 
D_y = [2.756528; 10.696528; 11.953528; 3.744528; 2.756528];
E_x = [18.39721694; 20.73791694; 13.59911694; 11.25831694; 18.39721694];    
E_y = [9.025287575; 10.36928757; 23.54228757; 22.19828757; 9.025287575];
F_x = [6.783106; 2.529706; 5.012206; 9.265606; 6.783106];                   
F_y = [19.744528; 17.311528; 12.971528; 15.404528; 19.744528];
G_x = [20.072206; 13.127906; 14.071306; 21.015606; 20.072206];              
G_y = [18.822528; 14.850528; 13.201528; 17.173528; 18.822528];

figure(1)                                                                   
hold on
plot(A_x, A_y, '-')
plot(B_x, B_y, '-')
plot(C_x, C_y, '-')
plot(D_x, D_y, '-')

plot(F_x,F_y,'-')

plot(x0, y0, '*')

acc = 2;                                                                    


[Int_1(1), Int_1(2)] = Int_Point([x0, y0], [x0 + 20, y0 + 20 * ((D_y(4) - D_y(3)) / (D_x(4) - D_x(3)))], [D_x(2), D_y(2)], [D_x(3), D_y(3)]);
plot(Int_1(1), Int_1(2), '*');


k = (D_y(3) - D_y(2)) / (D_x(3) - D_x(2));                                  
Int_2(1) = Int_1(1) - sqrt((4.878 * 2)^2 / (1 + k^2));
Int_2(2) = Int_1(2) + sqrt((4.878 * 2)^2 / (1 + 1 / k^2));
plot(Int_2(1), Int_2(2), '*')


[Int_3(1), Int_3(2)] = Int_Point([Int_2(1), Int_2(2)], [Int_2(1) + 20, Int_2(2) + 20 * ((D_y(4) - D_y(3)) / (D_x(4) - D_x(3)))], [A_x(1), A_y(1)], [A_x(4), A_y(4)]);
plot(Int_3(1), Int_3(2), '*')

distance1 = pdist([Int_1; x0, y0], 'euclidean');                            
distance3 = pdist([Int_2; Int_3], 'euclidean');                             





curR1 = 4.878;                                                              

circle_center = [(Int_1(1) + Int_2(1)) / 2, (Int_1(2) + Int_2(2)) / 2];     
plot(circle_center(1), circle_center(2), 'o')

distance2 = Arc_Length(Int_2, Int_1, circle_center);                        



i = 1;
distance = 0;

while i == 1

    if distance <= distance1 + 5                                            
        curR = 0;
        speed = 2;
        acc = 0;
    elseif distance <= distance1 + 5 + distance2 + 5                        
        curR = curR1;
        speed = 2;
        acc = 0;
    elseif distance <= distance1 + 5 + distance2 + 10                       
        curR = -curR1;                                                      
        speed = 2;
        acc = 0;
    elseif distance <= distance1 + 5 + distance2 + 10 + distance3           
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
