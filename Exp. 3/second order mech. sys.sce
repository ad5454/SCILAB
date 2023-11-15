// Second order mechanical system
clc;
clear all;
F = input('Enter the value of input force:');  //F=300 N
M = input('Enter the value of mass:');  //M=750 kg
B = input('Enter the value of friction coefficient:'); //B=30 Ns/m
K = input('Enter the value of spring constant:');  //K=1 N/m
num = poly([F], 's', 'c');
den = poly([K B M], 's', 'c');
sys2_mech = syslin('c', num/den);
disp(sys2_mech)
t=0:0.01:350;
y=csim('step',t,sys2_mech);
plot(t,y,'r')
xlabel("t", "fontsize", 2, "color", "blue");
ylabel("y");
title('Second order mechanical system','color','red');
