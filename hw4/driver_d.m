function [t, count] = driver_d(A)
% A = hilb(4);
% A = diag(15 : -1 : 1) + ones(15, 15);
[m, ~] = size(A);
t = zeros(m, 1);
e_v = zeros(m, 1);
%% call tridiag
T = tridiag(A);
%% call qralg with Wilkinson shift and a smaller matrix to get another eigenvalue.
Tnew = T;
t = [];
count = 0;
for i = m : -1 : 2
    Tnew = Tnew(1 : i, 1 : i);
    [Tnew, t, count] = qralg_new(Tnew, t, count);
    e_v(i) = Tnew(i, i);
end
e_v(1) = Tnew(1);
display(e_v);
% % Semilogy plot
x = 1 : 1 : count;
y = t;
figure
semilogy(x, y);
title('Sawtooth plots with shift');
end
