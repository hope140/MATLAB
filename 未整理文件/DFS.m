clear;
clc;
global State D SS;
m=3;
n=3; 
max=2; %最大容量

tic;
State=[];
numS=0;
for u=0:m
    for v=0:n
        if (((u>=v)&&((m-u)>=(n-v)))||(u==0)||(u==m))  
            numS=numS+1;
            State(numS,:)=[u,v];         
        end
    end
end
State=[State,ones(numS,1);State,zeros(numS,1)];
numS=numS*2;
disp('允许状态集合:');
State
fprintf('共%d种允许状态\n\n',numS);

D=[];
global numD;
numD=0;
for u=0:m
    for v=0:n
        if ((u+v)>=1)&&((u+v)<=max)
            numD=numD+1;
            D(numD,:)=[u,v];
        end
    end
end
disp('决策变量集合:');
D
fprintf('共%d个决策变量\n\n',numD);

SS=zeros(numS,1,'single');
global pos_end;
global pos_passed k count;

pos_begin=find(ismember(State,[3,3,1],'rows')==1);
pos_end=find(ismember(State,[0,0,0],'rows')==1);
count=0;          
SS(pos_begin)=1;         
pos_passed(1)=pos_begin;
k=1;

crossRiver(pos_begin);    
if count==0
    fprintf('No solution.\n');
end
time=toc