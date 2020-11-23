clc;clear
format long

% ����һ
[precision_I,x_kI] = Iteration(@(x)(x+1)^(1/3),1.5,8);
for ii = 1:8
    fprintf('����һ ��������%d�� ���̵ĸ�x=%.5f;���=%.5f\n',ii,x_kI(ii),precision_I(ii));
end

[k_NP,x_kNP] = Newton_pre(@(x)x*exp(x)-1,0.5,1.0e-5);
for np = 1:max(k_NP)
    fprintf('����һ ţ�ٷ���%d�� ���̵ĸ�x=%.5f;\n',k_NP(np),x_kNP(np));
end

% ������
[precision_I,x_kI] = Iteration(@(x)2*x^3-1,0,10);
for ii = 1:10
    fprintf('������ (1)����10�� ��������%d�� ���̵ĸ�x=%.5f;���=%.5f\n',ii,x_kI(ii),precision_I(ii));
end

[precision_I,x_kI] = Iteration(@(x)2*x^3-1,0,20);
for ii = 1:20
    fprintf('������ (1)����20�� ��������%d�� ���̵ĸ�x=%.5f;���=%.5f\n',ii,x_kI(ii),precision_I(ii));
end

[precision_I,x_kI] = Iteration(@(x)((x+1)/2)^(1/3),0,10);
for ii = 1:10
    fprintf('������ (2)����10�� ��������%d�� ���̵ĸ�x=%.5f;���=%.5f\n',ii,x_kI(ii),precision_I(ii));
end

[precision_I,x_kI] = Iteration(@(x)((x+1)/2)^(1/3),0,20);
for ii = 1:20
    fprintf('������ (2)����20�� ��������%d�� ���̵ĸ�x=%.5f;���=%.5f\n',ii,x_kI(ii),precision_I(ii));
end

[precision_N,x_kN] = Newton(@(x)x^3-x-1,1.5,10);
for nn = 1:10
    fprintf('������ x0=1.5 ţ�ٷ� ��%d�� ���̵ĸ�x=%.5f;���=%.5f\n',nn,x_kN(nn),precision_N(nn));
end

[precision_N,x_kN] = Newton(@(x)x^3-x-1,0,10);
for nn = 1:10
    fprintf('������ x0=0 ţ�ٷ� ��%d�� ���̵ĸ�x=%.5f;���=%.5f\n',nn,x_kN(nn),precision_N(nn));
end