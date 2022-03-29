clear ; clc ; close all
n=4;
b = ones(1,n);
A = pascal(n)
e = gauss_elim(A,b)
ee = A\b'
[L U] = lu(A)