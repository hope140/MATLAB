clc
clear
f=@cycle12;
f1=@(x)1.5;
f2=@(x)-0.5;
f3=@(x)0;
fplot(f,[0,4.25],'k')
hold on 
fplot(f1,[0,4.25],'--')
fplot(f2,[0,4.25],'--')
fplot(f3,[0,5],'k')
plot([0,0],[1.9,-0.7],'k')
plot([2,2],[-0.5,1.5],'k')
plot([4,4],[-0.5,1.5],'k')
axis([-1 6 -1 3]);
plot([0,-0.5],[1.5,1.5],'k')
plot([0,-0.5],[-0.5,-0.5],'k')
axis off;
box off;
set(gca,'Xtick',[]);
set(gca,'Ytick',[]);
set(gcf, 'Color', [1,1,1]);
text(0.8,0.8,'r')
text(0.15,1.9,'q')
text(5,-0.2,'t')
text(0.5,0.5,'A')
text(1.8,-0.1,'B')
text(-0.31,0.5,'R')
text(0.1,1.65,'Q')
text(-0.2,-0.1,'O')
text(1.25,-0.1,'T1')
text(2.1,-0.1,'T')
text(0.5,-1.2,'图二   允许缺货模型的贮存量q(t)')
grid off
annotation('arrow',[0.241 0.241],[0.3143 0.71]);
annotation('arrow',[0.28 0.81],[0.3143 0.3143]);
annotation('arrow',[0.214 0.214],[0.62 0.48]);
annotation('arrow',[0.214 0.214],[0.215 0.355]);


