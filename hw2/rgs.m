function [Q, R] = rgs(A)

% Modified Gram-Schmidt orthogonalization of the
% matrix A = Q*R, where Q is orthogonal and R upper
% is triangular.

[m, n] = size(A);
R = zeros(n, n);
Q = zeros(m, n);
count = 0;

R(1, 1) = norm(A(:, 1));
Q(:, 1) = A(:, 1) / R(1, 1);

for i = 2 : n
   while(count < 1)
       h = Q(:, i - 1)' * A(:, i);
       A(:, i) = A(:, i) - Q(:, i - 1) * h;
       R(:, i) = R(:, i) + h;
       count = count + 1;
   end
   R(i, i) = norm(A(:, i));
   Q(:, i) = A(:, i) / R(i, i);
end