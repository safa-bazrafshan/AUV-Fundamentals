%% Episode 6 — Forces in Underwater Operation
% Simple vertical motion (heave) model of an AUV

clc;
clear;
close all;

%% SECTION 1 — Physical Parameters

m = 50;                % Mass of AUV (kg)
g = 9.81;              % Gravity (m/s^2)
rho = 1000;            % Water density (kg/m^3)
V = 0.049;             % Displaced volume (m^3)

Cd = 0.8;              % Drag coefficient
A = 0.1;               % Reference area (m^2)

T = 30;                % Constant thrust force (N)

%% SECTION 2 — Force Definitions

Fg = m * g;            % Weight
Fb = rho * V * g;      % Buoyancy

%% SECTION 3 — Dynamic Equation (ODE)

ode = @(t, x) [
    x(2);  % x(1) = position (z), x(2) = velocity (v)
    
    (Fb - Fg ...
     - 0.5*rho*Cd*A*x(2)*abs(x(2)) ...
     + T) / m
];

%% SECTION 4 — Simulation

tspan = [0 20];        % 20 seconds simulation
x0 = [0; 0];           % Initial position and velocity

[t, x] = ode45(ode, tspan, x0);

z = x(:,1);
v = x(:,2);

%% SECTION 5 — Plot Results

figure;

subplot(2,1,1)
plot(t, z, 'LineWidth',2)
grid on
xlabel('Time (s)')
ylabel('Position (m)')
title('Vertical Position')

subplot(2,1,2)
plot(t, v, 'LineWidth',2)
grid on
xlabel('Time (s)')
ylabel('Velocity (m/s)')
title('Vertical Velocity')