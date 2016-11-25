% A = hilb(4);
A = diag(100 : -1 : 1) + ones(100, 100);
[m, ~] = size(A);
[y1, count1] = driver_c(A);
[y2, count2] = driver_d(A);
% Semilogy plot
x1 = 1 : 1 : count1;
x2 = 1 : 1 : count2;
figure
hold on;
semilogy(x1, y1, 'b--*');
semilogy(x2, y2, 'r-o');
title('Sawtooth plots corresponding to shift and no shift');
legend('No shift','Shift');