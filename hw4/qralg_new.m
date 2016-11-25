function [Tnew, t, count] = qralg_new(T, t, count)
    [m, ~] = size(T);
    while abs(T(m, m-1)) > 10^(-12)
        mu = wsft(T); % Pick a shift mu
        [Q, R] = qr(T - mu * eye(m, m));
        T = R * Q + mu * eye(m, m);
        t = [t; abs(T(m, m-1))];
        count = count + 1; % Number of QR factorization
    end
    Tnew = T;
end