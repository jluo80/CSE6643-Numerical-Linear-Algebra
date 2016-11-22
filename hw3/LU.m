function [L, U, P] = LU(A)
    m = size(A, 1);
    U = A;
    L = eye(m);
    P = eye(m);
    for k = 1 : (m - 1)
        [~, index] = max(abs(U(k : m, k)), [], 1);
        i = index + k -1;
        % Exchange U row
        U_row = U(k, k : m); 
        U(k, k : m) = U(i, k : m);
        U(i, k : m) = U_row;
        % Exchange L row
        L_row = L(k, 1 : k - 1);
        L(k, 1 : k - 1) = L(i, 1 : k - 1);
        L(i, 1 : k - 1) = L_row;
        % Exchange P row
        P_row = P(k, :);
        P(k, :) = P(i, :);
        P(i, :) = P_row;
        for j = k + 1 : m
            L(j, k) = U(j, k) / U(k, k);
            U(j, k : m) = U(j, k : m) - L(j, k) * U(k, k : m); 
        end
    end
end