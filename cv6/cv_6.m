% cv_6
clc;clear;close all


% vektor x a y musi mit stejnou velikost
data = load('data1.mat', '-ascii');
x = data(:,1);
y = data(:,2);

xq = min(x):.0005:max(x);
%xq = linspace(0,1000);


yq = lagrange(x, y, xq);
yq2 = interp1(x,y,xq,'linear');

%plot(xq,yq,"bo");
hold on
plot(xq, yq2)

plot(x,y,'o',xq,yq,'.')
xlabel("X");
ylabel("Y");
title("Lagrangian interpolation");