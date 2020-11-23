function [x,n] = Gauss(A,b,x0,eps)
    % Gauss��������nargin���°汾�в�֧��
    % if nargin == 3
    %     eps = 1.0e-6;
    % elseif nargin < 3
    %     error
    %     return
    % end
    D = diag(diag(A));  % �ԽǾ���
    L = -tril(A,-1);    % ��������
    U = -triu(A,1);     % ��������
    G = (D-L)\U;
    f = (D-L)\b;
    R = max(abs(eig(G)));% �װ뾶
    x = G*x0+f;
    n = 1;              % ��������
    while norm(x-x0) >=  eps
        x0 = x;
        x = G*x0+f;
        n = n+1;
    end
    if R > 1
        n = inf;
        x = ('��ɢ�޽��')';
    end