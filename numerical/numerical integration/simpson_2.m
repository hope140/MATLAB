clc;clear
format long
fun = @(x) x^(1/2);
n = input('n= ');
a = 1;
b = 9;
h = (b-a)/n;
S_1 = 0;
S_2 = 0;

for k = 0:n-1
    x = a+k*h;
    x1 = x+1/2*h;        %������x1=0�����
    S_1 = S_1+fun(x1);
end
clear k x
for k = 1:n-1
    x = a+k*h;           %������x=0�����
    S_2 = S_2+fun(x);
end
S_3 = fun(a)+fun(b);
S_n = h*(4*S_1+2*S_2+S_3)/6
