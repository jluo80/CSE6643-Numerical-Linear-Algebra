function [Tnew, t, count] = qralg(T, t, count)
    [m, ~] = size(T); 
    while abs(T(m, m-1)) > 10^(-12)
        [Q, R] = qr(T);
        T = R * Q;
        t = [t; abs(T(m, m-1))];
        count = count + 1; % Number of QR factorization
    end
    Tnew = T;
end