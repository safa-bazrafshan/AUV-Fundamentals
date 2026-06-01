%% AUV_Intro.m
% Episode 7 - MATLAB Basics for AUV Simulation
% Simple Vertical Motion Model of an AUV

clc;
clear;
close all;

%% Physical Parameters
m = 50;          % mass (kg)
b = 15;          % damping coefficient (N.s/m)
F = 20;          % constant upward force (N)

%% Time Span
tspan = [0 40];  % simulate 40 seconds

%% Initial Conditions
z0 = 0;          % initial vertical position (m)
v0 = 0;          % initial vertical velocity (m/s)
X0 = [z0; v0];

%% Solve ODE using ode45
[t, X] = ode45(@(t,X) auv_dynamics(t,X,m,b,F), tspan, X0);

z = X(:,1);   % position
v = X(:,2);   % velocity

%% Plot Results
figure;

subplot(2,1,1)
plot(t, z, 'LineWidth', 2)
grid on
xlabel('Time (s)')
ylabel('Vertical Position (m)')
title('AUV Vertical Position')

subplot(2,1,2)
plot(t, v, 'LineWidth', 2)
grid on
xlabel('Time (s)')
ylabel('Vertical Velocity (m/s)')
title('AUV Vertical Velocity')

%% ---- Function Definition ----
function dXdt = auv_dynamics(~, X, m, b, F)

z = X(1);
v = X(2);

dzdt = v;
dvdt = (F - b*v) / m;

dXdt = [dzdt; dvdt];

end