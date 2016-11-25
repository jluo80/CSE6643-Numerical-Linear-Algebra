function [mu] = wsft(T)
    [m, ~] = size(T);
    mu = T(m, m);
    if m > 1
        delta = (T(m-1, m-1) - mu) / 2;
        if delta ~= 0
            s = sign(delta);
        else
            s = 1;
        end
        b = T(m, m-1);
        mu = mu - s * b^2 / (abs(delta) + sqrt(delta^2 + b^2));
    end
end