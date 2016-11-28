function [u_old, iteration]=method(A,b,delta,method)
% Input  - A is an (n-1) x (n-1) matrix
%        - u is an (n-1) vector
%        - b is an (n-1) vector
%        - a is the coefficient alpha
%        - method name should choose from 'Jacobi', 'Gauss-Seidel' and 'SOR'
%        - delta is the difference between real solution and guess
% Output - u is an (n-1) vector: The Jacobi approximation
%           to the solution of Au=b

[m,n]=size(A);
u_new=zeros(m,1);
u_old=zeros(m,1);
iteration=0;
tol=10^-12;
%%% Jacobi Approximation Iteration Method%%%
if strcmp(method,'Jacobi')
    D=diag(diag(A));
    R=A-D;
    while delta>tol
        u_new=D\(b-R*u_old);
        delta=norm(u_new-u_old,1)/norm(u_new,1);
        u_old=u_new;
        iteration=iteration+1;
    end
    display('Solved by Jacobi method');
end

%%% Gauss-Seidel %%%
if strcmp(method,'Gauss-Seidel')
    L=tril(A);
    U=triu(A,1);
    while delta>tol
        u_new=L\(b-U*u_old);
        delta=norm(u_new-u_old,1)/norm(u_new,1);
        u_old=u_new;
        iteration=iteration+1;
    end
   display('Solved by Gauss-Seidel method');
end

%%% Successive over-relaxation %%%
% w=[0.5, 1.1, 1.7];
w=1.7;
if strcmp(method,'SOR')
    D=diag(diag(A));
    L=tril(A,-1);
    U=triu(A,1);
    while delta>tol
        u_new=(D+w*L)\(w*b-(w*U+(w-1)*D)*u_old);
        delta=norm(u_new-u_old,1)/norm(u_new,1);
        u_old=u_new;
        iteration=iteration+1;
    end
    display('Solved by SOR method');
end
end
