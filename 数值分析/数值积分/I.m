clc;clear
syms x
fun1 = x/(4+x^2);
fun2 = x^(1/2);
I1 = vpa(int(fun1,0,1),8)
I2 = vpa(int(fun2,1,9),10)        %保留八位小数
