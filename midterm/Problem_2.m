b = [1, 1, 1]';
e = 10^(-10);
A = [1, 1; e, 0; 0, e];
B = A' * A;
C = inv(B);
D = C * A';
E = D * b;
x = inv((A' * A)) * A' * b;
% x = A \ b;

