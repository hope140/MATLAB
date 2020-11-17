clc;clear
format long

% 方案一
[precision_I,x_kI] = Iteration(@(x)(x+1)^(1/3),1.5,8);
for ii = 1:8
    fprintf('方案一 迭代法第%d次 方程的根x=%.5f;误差=%.5f\n',ii,x_kI(ii),precision_I(ii));
end

[k_NP,x_kNP] = Newton_pre(@(x)x*exp(x)-1,0.5,1.0e-5);
for np = 1:max(k_NP)
    fprintf('方案一 牛顿法第%d次 方程的根x=%.5f;\n',k_NP(np),x_kNP(np));
end

% 方案二
[precision_I,x_kI] = Iteration(@(x)2*x^3-1,0,10);
for ii = 1:10
    fprintf('方案二 (1)迭代10次 迭代法第%d次 方程的根x=%.5f;误差=%.5f\n',ii,x_kI(ii),precision_I(ii));
end

[precision_I,x_kI] = Iteration(@(x)2*x^3-1,0,20);
for ii = 1:20
    fprintf('方案二 (1)迭代20次 迭代法第%d次 方程的根x=%.5f;误差=%.5f\n',ii,x_kI(ii),precision_I(ii));
end

[precision_I,x_kI] = Iteration(@(x)((x+1)/2)^(1/3),0,10);
for ii = 1:10
    fprintf('方案二 (2)迭代10次 迭代法第%d次 方程的根x=%.5f;误差=%.5f\n',ii,x_kI(ii),precision_I(ii));
end

[precision_I,x_kI] = Iteration(@(x)((x+1)/2)^(1/3),0,20);
for ii = 1:10
    fprintf('方案二 (2)迭代20次 迭代法第%d次 方程的根x=%.5f;误差=%.5f\n',ii,x_kI(ii),precision_I(ii));
end

[precision_N,x_kN] = Newton(@(x)x^3-x-1,1.5,10);
for nn = 1:10
    fprintf('方案二 x0=1.5 牛顿法 第%d次 方程的根x=%.5f;误差=%.5f\n',nn,x_kN(nn),precision_N(nn));
end

[precision_N,x_kN] = Newton(@(x)x^3-x-1,0,10);
for nn = 1:10
    fprintf('方案二 x0=0 牛顿法 第%d次 方程的根x=%.5f;误差=%.5f\n',nn,x_kN(nn),precision_N(nn));
end