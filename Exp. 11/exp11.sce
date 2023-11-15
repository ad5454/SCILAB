clc;
clear all;
clf;

// State space representation
A=[0 1 0; 0 0 1; 0 -2 -3];
B=[0 0 10]';
C=[0 0 1];
D=0;

// Desired poles
Pd=[-1+1*%i -1-1*%i -2];

// State feedback gain matrix
K=ppol(A,B,Pd)
disp (K)

//Closed loop system
sys=syslin('c',A-B*K,B,C,D)
disp (sys)

//Response of closed loop system
t=linspace(0,20,1001);
y=csim('step',t,sys) 
plot(t,y)
title('Response of the closed loop system','fontsize',4)
xlabel('Time t','fontsize',2)
ylabel('Response y(t)','fontsize',2)

