clc, clear, close all;
% different step size
x3 = [-9*10^-16:10^-16:-10^-16, 10^-16:10^-16:9*10^-16];
x2 = x3 * 10;
x1 = x3 * 1000;
x4 = [-9*10^-17:10^-17:-10^-17, 10^-17:10^-17:9*10^-17];

% opens new figure window
figure 
subplot(2,2,1);
plot(x1,g(x1),'r--*',x1,h(x1),'b-o');
title('Step size 10^{-13}');
legend('g(x)','h(x)');

subplot(2,2,2);
plot(x2,g(x2),'r--*',x2,h(x2),'b-o');
title('Step size 10^{-15}');
legend('g(x)','h(x)');

subplot(2,2,3);
plot(x3,g(x3),'r--*',x3,h(x3),'b-o');
title('Step size 10^{-16}');
legend('g(x)','h(x)');

subplot(2,2,4);
plot(x4,g(x4),'r--*',x4,h(x4),'b-o');
title('Step size 10^{-17}');
legend('g(x)','h(x)');