function tem_avg=avg(tem_fix)
H = numel(tem_fix); %����X��Ԫ�ظ���
a=find(tem_fix); 

%�����ֵ��������򵥵��ƶ�ƽ��������Ҫ��ֵ�ĵ��ֵ��Ϊ��ǰ�������������������4����Ԫ�ص�ƽ��ֵ��
%������ǰ����������������С��d���޷������淽����ֵ�����ڼ䣬����ԭֵ��

b=a(find(a>5&a<(H-5)));
tem_fix(b)=(tem_fix(b-5)+tem_fix(b-4)+tem_fix(b-3)+tem_fix(b-2)+tem_fix(b-1)+tem_fix(b)+tem_fix(b+1)+tem_fix(b+2)+tem_fix(b+3)+tem_fix(b+4)+tem_fix(b+5))/11; %��ֵ������Ҫ�滻��λ�ð�������ʽ��ֵ��
tem_avg=tem_fix;