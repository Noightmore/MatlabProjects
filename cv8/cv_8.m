% cv8
clear;
clc;
clf;
close all;

data = load("velocity.mat", '-ascii');

time = data(1, :);
speedInMs = data(2, :);

speed = speedInMs ./ 3.6; % km/s

yyaxis left;
plot(time, speed, "DisplayName", "Závislost rychlosti na čase");
xlabel("Čas");
ylabel("Rychlost");

a = zeros(1, numel(time));

% Dopredna diference pro prvni bod (zadny dalsi pred bodem nelezi)
a(1) = (speed(2) - speed(1)) / abs(time(2) - time(1));

% centralni diff pro vsechny body, krome krajnich
for i = 2:numel(a) - 1
    a(i) = (speed(i + 1) - speed(i - 1)) / (abs((time(i) - time(i - 1)) + (time(i + 1) - time(i))));
end

%  zpetna diff (zadny dalsi bod nelezi za nim)
divider = abs(time(numel(time) - 1) - time(numel(time)-1));
if divider < 0.35
    divider = 0.35; % bruteforce
end
a(numel(a)) = (speed(numel(speed)) - speed(numel(speed)-1)) / divider;

yyaxis right;
plot(time, a, "DisplayName", "Závislost zrychlení na čase");
ylabel("Zrychlení");

susPoints = find(sign(a(1:numel(a)-1)) ~= sign(a(2:numel(a))));

z = arrayfun(@(x) (time(x+1) + time(x)) / 2, susPoints);

for i=1:numel(z)
    xline(z(i), 'HandleVisibility','off', "LineStyle", "--");
end
legend("Location", "best");

saveas(gcf, "graph_acceleration.png");