% cv_4
clc; clear;close all
% A = 1, B = 2, C = 3, D = 4, E = 5

M = [
    0, 1/2, 1/4, 1, 1/3;
    1/3, 0, 1/4, 0, 0;
    1/3, 1/2, 0, 0, 1/3;
    1/3, 0, 1/4, 0, 1/3;
    0, 0, 1/4, 0, 0;
 ];
% 
% webs = ['A', 'B', 'C', 'D', 'E'];
% [vec lambda] = mocninna_metoda(M, [1 1 1 1 1]', 0.001, 30);
% 
% [vec,sortIdx] = sort(vec,'ascend');
% webs = webs(sortIdx);

y = [1 1 1]';
A = [
    1.5000, -6.5000, 6.5000;
    1.0000, -6.0000, 6.5000;
    1.0000, -1.0000, 1.5000; 
    ];

[a lambda] = mocninna_metoda(A, y, 0.2, 20)
%b = eig(A)
