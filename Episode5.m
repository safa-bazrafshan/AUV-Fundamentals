%% Episode 5 — Orientation in 3D
% Euler Angles: Roll (X-axis), Pitch (Y-axis), Yaw (Z-axis)

clc;
clear;
close all;

%% Section 1 — Define Original Vector
v_original = [1; 0; 0];   % Initial vector along X-axis

%% Section 2 — Roll (Rotation around X-axis)
theta_roll = pi/6;  % 30 degrees

Rx = [1 0 0;
      0 cos(theta_roll) -sin(theta_roll);
      0 sin(theta_roll)  cos(theta_roll)];

v_roll = Rx * v_original;

%% Section 3 — Pitch (Rotation around Y-axis)
theta_pitch = pi/6;  % 30 degrees

Ry = [cos(theta_pitch) 0 sin(theta_pitch);
      0 1 0;
     -sin(theta_pitch) 0 cos(theta_pitch)];

v_pitch = Ry * v_original;

%% Section 4 — Yaw (Rotation around Z-axis)
theta_yaw = pi/6;  % 30 degrees

Rz = [cos(theta_yaw) -sin(theta_yaw) 0;
      sin(theta_yaw)  cos(theta_yaw) 0;
      0 0 1];

v_yaw = Rz * v_original;

%% Section 5 — Combined Rotation (Roll → Pitch → Yaw)
R_combined = Rz * Ry * Rx;
v_combined = R_combined * v_original;

%% Section 6 — Visualization
figure;
hold on;
grid on;
axis equal;

% Plot vectors
quiver3(0,0,0,v_original(1),v_original(2),v_original(3),'b','LineWidth',2);
quiver3(0,0,0,v_roll(1),v_roll(2),v_roll(3),'r','LineWidth',2);
quiver3(0,0,0,v_pitch(1),v_pitch(2),v_pitch(3),'g','LineWidth',2);
quiver3(0,0,0,v_yaw(1),v_yaw(2),v_yaw(3),'m','LineWidth',2);
quiver3(0,0,0,v_combined(1),v_combined(2),v_combined(3),'k','LineWidth',2);

xlabel('X');
ylabel('Y');
zlabel('Z');

legend('Original','Roll','Pitch','Yaw','Combined');
title('AUV Orientation in 3D — Euler Angles');

% Improve 3D visualization
view(3);
rotate3d on;

%% Section 7 — Note on Gimbal Lock
% Gimbal lock occurs when two rotation axes align,
% reducing one degree of freedom.
% Euler angles are intuitive but have this limitation.