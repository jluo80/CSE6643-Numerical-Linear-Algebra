clear;
close all;
% sixteen-digit precision
format long eng;

m = 50; 
n = 12;

% m-vector evenly spaced from 0 to 1
t = linspace(0, 1, m);

% vandermonde matrix and flip
A = fliplr(vander(t));
% A: 50-by-12 (for m > n)
A = A(:, 1:n);

% b: 50-by-1 column vector
b = cos(4 * t');

% x: 7-by-1
x = zeros(n, 7);

%%%%(a) normal equations
temp_1 = A' * A;
temp_2 = A' * b;
R = chol(temp_1);

%R' * w = A'*b
w = R' \ (A' * b);
% R * x = w
x(:, 1) = R \ w;
clear R;

%%%%(b) QR factorization by mgs

[Q, R] = mgs(A);
temp_3 = Q' * b;
x(:, 2) = R \ temp_3;
clear Q R;

%%%%(c) QR factorization by house
[W, R] = house(A);
Qb = formQb(W, b);
x(:,3) = R \ Qb;
clear W R;

%%%%(d) QR factorization by MATLAB's qr
[Q, R] = qr(A);
temp_4 = Q' * b;
x(:, 4) = R \ temp_4;
clear Q R;

%%%%(d')
[Q, R] = rgs(A);
temp_5 = Q' * b;
x(:, 5) = R \ temp_5;
clear Q R;

%%%%(e) x = A \ b in MATLAB
x(:, 6) = A \ b;

%%%%(f) SVD using MATLAB's svd
[U, S, V] = svd(A, 0);
temp_7 = U' * b;
for i = 1 : n       
    temp_7(i) = temp_7(i) / S(i,i); % Solve the diagonal system for w
end 
x(:, 7) = V * temp_7;         
clear U S V; 

% print x
display(x);




