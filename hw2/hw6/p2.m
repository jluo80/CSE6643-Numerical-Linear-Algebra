clear;
clc;
% Dimension of matrix A
i=3;
j=3;
dim=[100 500 1000];
% Entry of matrix A
delta=[0.1 1 2];
beta=-rand(1);
alpha=(1+delta(j))*(-2)*beta;
% Construct matrix A
r=zeros(dim(i),1)';
r(1,1)=alpha;
r(1,2)=beta;
A=toeplitz(r);
% Preconditioned conjugate gradient inputs
x0=zeros(dim(i),1);
b=ones(dim(i),1);
% Preconditioner M
% (0) Identity matrix and matrix A
% M=A;
% M=eye(dim(i),dim(i));

% (1)Jacobi (or diagonal) preconditioner
D=diag(diag(A));
M=D;

% (2)Symmetric successive over-relaxation preconditioner
% w=1.7;
% D=diag(diag(A));
% L=tril(A,-1);
% M=1/w*(D+w*L);

% (3)Gauss-Seidel preconditioner
% L=tril(A,1);
% M=L;

[~,p] = chol(A);
if p==0
    [x1,it1,mu1]=PCG(A,b,x0,M);
    [x2,it2,mu2]=CG(A,b,x0);
else
    error('Matrix A is not positive-definite.');
end
x=[x1 x2];
