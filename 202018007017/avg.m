function tem_avg=avg(tem_fix)
H = numel(tem_fix); %矩阵X的元素个数
a=find(tem_fix); 

%下面插值，采用最简单的移动平均，即需要插值的点的值改为其前面两个与后面两个（共4个）元素的平均值；
%但是最前面与最后面两个如果小于d，无法按上面方法插值，简单期间，采用原值；

b=a(find(a>5&a<(H-5)));
tem_fix(b)=(tem_fix(b-5)+tem_fix(b-4)+tem_fix(b-3)+tem_fix(b-2)+tem_fix(b-1)+tem_fix(b)+tem_fix(b+1)+tem_fix(b+2)+tem_fix(b+3)+tem_fix(b+4)+tem_fix(b+5))/11; %插值，将需要替换的位置按上述方式插值。
tem_avg=tem_fix;