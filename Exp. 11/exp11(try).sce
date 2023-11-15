clc;
clear all;
clf;

// State space representation
A = [0 1 0; 0 0 1; 0 -2 -3];
B = [0 0 10]';
C = [0 0 1];
D = 0;

// Open-loop system
sys_open = syslin('c', A, B, C, D);

// Response of open-loop system
t = linspace(0, 20, 1001);
y_open = csim('step', t, sys_open);

plot(t, y_open);
title('Response of the open-loop system', 'fontsize', 4);
xlabel('Time t', 'fontsize', 2);
ylabel('Response y(t)', 'fontsize', 2);
