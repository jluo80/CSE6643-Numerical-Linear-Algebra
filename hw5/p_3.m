delta=10^6;
% alpha=[1 10 100];
alpha=100;
% n=[100 1000];
n=1000;
h=1/n;
A=gallery('tridiag',n-1,-1,2+h^2*alpha,-1);
b=zeros(n-1,1);

for i=1:n-2
    b(i)=h^2*sin(i*h);
end
b(n-1)=h^2*sin((n-1)*h)+1;

U=zeros(n-1,3);
it=zeros(3,1);
[U(:,1),it(1)]=method(A,b,delta,'Jacobi');
[U(:,2),it(2)]=method(A,b,delta,'Gauss-Seidel');
[U(:,3),it(3)]=method(A,b,delta,'SOR');