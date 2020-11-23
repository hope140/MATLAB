function n = Jacobi_k(A,b,x0,x_k)
    % Jacobi迭代法，已知解析解，求迭代次数
    % nargin在新版本中不支持
    % if nargin == 3
    %     eps = 1.0e-6;
    % elseif nargin < 3
    %     error
    %     return
    % end
    D = diag(diag(A));  % 对角矩阵
    L = -tril(A,-1);    % 下三角阵
    U = -triu(A,1);     % 上三角阵
    B = D\(L+U);
    R = max(abs(eig(B)));% 谱半径
    f = D\b;
    x = B*x0+f;
    n = 1;              % 迭代次数
    while x ~= x_k
        x0 = x;
        x = B*x0+f;
        n = n+1;
    end
    if R > 1
        n = inf;
        x = ('发散无结果')';
    end