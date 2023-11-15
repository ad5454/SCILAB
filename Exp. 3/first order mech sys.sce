//First order mechanical system
clc;
clear all;
clf;
F = input('Enter the value of input force:');  //F=500 N
M = input('Enter the value of mass:');  //M=1000 kg
B = input('Enter the value of friction coefficient:'); //B=50 Ns/m
t=0:0.01:150;
num = poly([F], 's', 'c');
den = poly([B M], 's', 'c');
sys1_mech = syslin('c', num/den)
disp(sys1_mech)

y=csim('step',t,sys1_mech);
plot(t,y)
xlabel("t", "fontsize", 2, "color", "blue");
ylabel("y");
title('First order mechanical system','color','red');
