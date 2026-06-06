%% Episode 8 - Simple 1D Motion of an AUV

clc;
clear;
close all;

%% Parameters

m = 50;      % Mass (kg)
b = 10;      % Drag coefficient
T = 30;      % Thrust force (N)

%% Simulation settings

dt = 0.1;
t = 0:dt:30;

%% Preallocation

x = zeros(size(t));
v = zeros(size(t));

%% Numerical Simulation (Euler Method)

for k = 1:length(t)-1

    a = (T - b*v(k))/m;

    v(k+1) = v(k) + a*dt;

    x(k+1) = x(k) + v(k)*dt;

end

%% Plot Results

figure;

subplot(2,1,1)
plot(t,x,'LineWidth',2)
grid on
xlabel('Time (s)')
ylabel('Position (m)')
title('AUV Position')

subplot(2,1,2)
plot(t,v,'LineWidth',2)
grid on
xlabel('Time (s)')
ylabel('Velocity (m/s)')
title('AUV Velocity')