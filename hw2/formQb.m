function Qb = formQb(W,b)
[m,n] = size(W);

for k = 1 : n
    b(k : m) = b(k : m) - 2 * W(k : m, k) * (W(k : m, k)' * b(k : m));
end
Qb = b; 