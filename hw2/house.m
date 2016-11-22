function [V, R] = house(A)
[m, n] = size(A); 
V = zeros(m, n); 
for k = 1 : n;                   %Householder algorithm 
    x = A(k : m, k); 
    e = zeros(m + 1 - k, 1); 
    e(1) = 1;
    V(k : m, k) = sign(x(1)) * norm(x, 2) * e + x; %lower triangular matrix V 
    V(k : m, k) = V(k : m, k) / norm(V(k : m, k), 2); 
    A(k : m, k : n) = A(k : m, k : n) - 2 * V(k : m, k) * (V(k : m, k)' * A(k : m, k : n)); 
end  
R = triu(A, 0);
end 