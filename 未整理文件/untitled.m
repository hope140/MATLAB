function [d] = untitled(A,v)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
a=ones(1,v(:,1));
X1=a.*A(:,1);
Y1=a.*A(:,2);
X2=X1.';
Y2=Y1.';
M=(X1-X2).*(X1-X2)+(Y1-Y2).*(Y1-Y2);
D=sqrt(M);
d=sum(D);
end
