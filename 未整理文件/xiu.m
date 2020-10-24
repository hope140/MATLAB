clc
clear all
A=[1 2;
    3 5;
    6 9;
    -1 6;
    2 5.5;
    5 11;
  ];
v=size(A)
d=untitled(A,v)
max=find(d==max(d))
min=find(d==min(d))