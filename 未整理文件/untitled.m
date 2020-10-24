function [d] = untitled(A,v)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
a=ones(1,v(:,1));
X1=a.*A(:,1);
Y1=a.*A(:,2);
X2=X1.';
Y2=Y1.';
M=(X1-X2).*(X1-X2)+(Y1-Y2).*(Y1-Y2);
D=sqrt(M);
d=sum(D);
end
