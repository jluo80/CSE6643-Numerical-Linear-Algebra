function [X, Y] = p1(A, B, C)
    [Q, T] = schur(A);
    [P, S] = schur(B);
    D = Q' * C * P;
    Y = zeros(size(C));
    [m, n] = size(C);
    for i = m : -1 : 1
        for j = 1 : n
            Y(i, j) = (D(i, j) + sum(Y(i, 1 : (j - 1)) * S(1 : (j - 1), j)) - sum(T(i, (i + 1) : m) * Y((i + 1) : m, j))) / (T(i, i) - S(j, j));
%             temp1 = (D(i, j) + sum(Y(i, 1 : (j - 1)) * S(1 : (j - 1), j)) - sum(T(i, (i + 1) : m) * Y((i + 1) : m, j)));
%             temp2 = (T(i, i) - S(j, j));
        end
    end
    X = inv(Q') * Y * inv(P);
end
