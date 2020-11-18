function [x,n] = Jacobi(A,b,x0,eps)
% Jacobi��������nargin���°汾�в�֧��
% if nargin == 3
%     eps = 1.0e-6;
% elseif nargin < 3
%     error
%     return
% end
D = diag(diag(A));  % �ԽǾ���
L = -tril(A,-1);    % ��������
U = -triu(A,1);     % ��������
B = D\(L+U);
f = D\b;
x = B*x0+f;
n = 1;              % ��������
while norm(x-x0) >=  eps
    x0 = x;
    x = B*x0+f;
    n = n+1;
end