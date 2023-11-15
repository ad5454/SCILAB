clc;
clear all;

num1=[1];
den1=poly([0 13 4 1], 's', 'c');
sys1=syslin('c', num1/den1); //open loop transfer function
disp(sys1);

evans(sys1); //root locus of open loop transfer function

z=input('Enter the value of zeta:'); //For 5 % overshoot, z=0.69
w=input('Enter the value of omega :'); //w=1
sgrid(z,w);

scf;
t=0:1:150;
y1=csim('step',t,sys1); //step response of open loop system
plot(t,y1);

[Ki,s]=kpure(sys1);
//K=kpure(sys) computes the gains K such that the system tf = sys feedback tf = K
//(sys/.K) = sys/1+ sys.K. has poles on imaginary axis

disp(Ki,s);
sys2=sys1/.Ki
disp(sys2);

scf;
y2=csim('step',t,sys2); //step response of closed loop system with pure imaginary poles
plot(t,y2);

