clc;clear
A = [10,-1,0;
     -1,10,-2;
     0,-2,10];
b = [9,7,6]';
[x_J,n] = Jacobi(A,b,[0,0,0]',1.0e-6)
[x_G,n] = Gauss(A,b,[0,0,0]',1.0e-6)