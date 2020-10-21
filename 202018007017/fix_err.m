function tem_fix=fix_err(tem_num,d) %目标矩阵，需给定； d为小于的某值
N=numel(tem_num); %矩阵X的元素个数
a=find(tem_num<d); %找出X中小于d的元素的序号（具体可help find）

%下面插值，采用最简单的移动平均，即需要插值的点的值改为其前面两个与后面两个（共4个）元素的平均值；
%但是最前面与最后面两个如果小于d，无法按上面方法插值，简单期间，采用原值；

b=a(find(a>2&a<(N-1)));
tem_num(b)=(tem_num(b-1)+tem_num(b-2)+tem_num(b+1)+tem_num(b+2))/4; %插值，将需要替换的位置按上述方式插值。
tem_fix=tem_num;