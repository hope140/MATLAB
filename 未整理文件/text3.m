clc
clear
Q=input('��ʼ������=')
r=input('��λʱ��������=')
q=@text1;
f1=@(x)(Q);
fplot(f1,[0,100],'--')
hold on
fplot(q,[0,100*(Q/r)])
box off;
text(Q/r,Q/2,'r');
text(0,Q,'Q');
text(0,0,'O');
text(Q/r,0,'T');

