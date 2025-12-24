t = 0:0.01:10;
acc_true = 0.5 * sin(0.5*t);
noise = 0.1 * randn(size(t));
acc_measured = acc_true + noise;

plot(t, acc_true, 'LineWidth',2)
hold on
plot(t, acc_measured)
legend('True Acceleration','Measured with Noise')
xlabel('Time (s)')
ylabel('Acceleration (m/s^2)')
title('IMU Noise Simulation')
