function [T] = tridiag(A)
[m, ~] = size(A); 
V = zeros(m, m); 
for k = 1 : m -2;
    x = A(k+1 : m, k); 
    e = zeros(m - k, 1); 
    e(1) = 1;
    V(k+1 : m, k) = sign(x(1)) * norm(x, 2) * e + x;
    V(k+1 : m, k) = V(k+1 : m, k) / norm(V(k+1 : m, k), 2); 
    A(k+1 : m, k : m) = A(k+1 : m, k : m) - 2 * V(k+1 : m, k) * (V(k+1 : m, k)' * A(k+1 : m, k : m)); 
    A(1 : m, k+1 : m) = A(1 : m, k+1 : m) - 2 * A(1 : m, k+1 : m) * V(k+1 : m, k) * V(k+1 : m, k)';
end
T = A;
end