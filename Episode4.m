% Episode 4: Coordinate Frames Example
% Rotate a 2D vector from body frame to inertial frame

theta = pi/6; % 30 degrees
v_body = [1; 0]; % column vector

% 2D rotation matrix
R = [cos(theta) -sin(theta);
     sin(theta)  cos(theta)];

% rotate vector
v_inertial = R * v_body;

% display
disp('Body frame vector:')
disp(v_body)

disp('Inertial frame vector:')
disp(v_inertial)