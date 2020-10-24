clc
clear
f=@cycle1;
f1=@(x)2;
fplot(f,[0,4.5])
hold on 
fplot(f1,[0,4.5],'--')
axis([0 5 0 3]);
axis equal;
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
set(gcf, 'Color', [1,1,1])
box off;
xlabel('图一   不允许缺货模型的贮存量q(t)','position',[2.5 -0.5])
text(1,1.2,'r')
text(0.65,0.9,'A')
text(0.1,2.55,'q')
text(5,-0.15,'t')
text(-0.2,2,'Q')
text(-0.15,-0.15,'O')
text(1.95,-0.15,'T')
grid off
annotation('arrow',[0.13 0.13],[0.31 0.85]);
annotation('arrow',[0.13 0.92],[0.31 0.31]);