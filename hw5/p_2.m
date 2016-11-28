function [X]=p_2(A,B)
A=[1 2 3 4; 5 6 7 8; 2 4 6 8];
B=[7 8 5 2; 3 6 9 12];
C=[A;B];
[m, n]=size(C);
k=rank(C);
[U,S,V]=svd(C);
X=V(:,k+1:n);
display(C*X);
display(null(C));
display(X);
end