%%% Test: A = [-3 -2 1; -1 6 2; 1 2 4]
%%% Method 1:
% function [Q, L] = p2(A)
% [Qi Li] = qr(fliplr(A));
% L = fliplr(flipud(Li));
% Q = fliplr(Qi);
% display(L);
% display(Q);
% display(Q * L);
% end
%%% Method 2: QL decompostion accroding to Classical Gram-Schmidt
function [Q, L] = p2(A)
    [m, n] = size(A);
    L = zeros(n, n);
    Q = zeros(m, n);
    for j = n : -1 : 1
        v = A(:, j);
        for i = j + 1 : n
            L(i, j) = Q(:, i)' * A(:, j);
            v = v - L(i, j) * Q(:, i);
        end
        L(j, j) = norm(v);
        Q(:, j) = v / L(j, j);
    end
end

 