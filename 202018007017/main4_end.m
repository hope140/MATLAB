clc;clear;
length_all = 435.5;         %全长
T0 = 25;                    %各温区温度
area = [];
for T1 = 168:1:172
    for T2 = 185.5:1:187.5
        for T3 = 225.5:1:229.5
            for T4 = 263:1:267
                for v = 87.5:1:91.5
                    j = ceil(10 * (v-64.9));
                    v_s = v/60;
                    dt = 0.5;                   %时间步长
                    t_all = length_all/v_s;     %该速度下全程时间长度
                    m = floor(t_all/dt);         %时间步长数量
                    n = 3500;                    %速度步长数量
                    tem_num = ones(m,1);         %数值解
                    tem_abs = [];
                    for i = 1:m
                        x = i/2*v_s;
                        if x < 25
                            T = (T0+T1)/2;      %该阶段环境温度
                            tem_ini = 25;       %该阶段初始温度
                            lan_1 = -0.0143;    %该阶段lan值
                            t_1 = i/2;          %该阶段时间段
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
                        tem_fix = fix_err(tem_num,2);
                        if x < 375
                            M = length(find(tem_fix>150 & tem_fix<190));
                            K = length(find(tem_fix>217));
                        end
                    end
                    for line = 3:m
                        tem_abs(end+1) = abs(tem_fix(line,1)-tem_fix(line-2,1));
                    end
                    if sum(tem_abs > 3) == 0
                        if (M-1)/2 > 60 && (M-1)/2 < 119
                            if (K-1)/2 > 40 && (K-1)/2 < 90
                                if max(tem_fix) < 250 && max(tem_fix) > 240
                                    vec1 = [];
                                    vec2 = [];
                                    maxi = max(tem_fix);
                                    for ii = 1:length(tem_fix)
                                        if tem_fix(ii)>=217 && tem_fix(ii)<= maxi
                                            vec1 = [vec1; tem_fix(ii)];
                                        end
                                    end          
                                    for jj = 1:length(vec1)-1
                                        if vec1(jj+1)>=vec1(jj)
                                            vec2 = [vec2; vec1(jj)];
                                        end
                                    end
                                    S = 0;
                                    for kk = 1:length(vec2)-1
                                        S = S+(vec2(kk)+vec2(kk+1)-217*2)*dt*v_s/2;
                                    end
                                    inde = find(vec1==max(vec1));
                                    Err = 0;
                                    for mm = 1:min(inde-1, length(vec1)-inde)
                                        Err = Err +(vec1(inde-mm)-vec1(inde+mm))^2;
                                    end
                                    v_true = [T1,T2,T3,T4,v,S+Err];
                                    area = [area; v_true];
                                end
                            end
                        end
                    end
                    
                end
            end
        end
    end
end
index = find(area(:,6)==min(area(:,6)));
object = area(index,:)
tem_avg = avg(tem_fix);
csvwrite('.\4.csv',tem_avg);
% v = max(v_true1)
% csvwrite('.\result.csv',tem_fix)
% plot(tem_fix)
% xlabel('时间(t)0.5s')
% ylabel('温度(tem)^oC')