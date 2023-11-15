// First order Electrical system
clc;
clear all;

V = input('Enter the value of input voltage:');  //V=1 V
R = input('Enter the value of resistance:');   //R=2000 ohm
C = input('Enter the value of capacitance:'); //C=0.01  F
s=poly(0,'s'); 
sys1_elec = V/((s*R*C)+1);
t=0:0.01:120;
y=csim('step',t,sys1_elec);
plot(t,y,'g');
disp(sys1_elec);
xlabel("t", "fontsize", 2, "color", "blue");
ylabel("y");
title('First order Electrical system','color','red');


