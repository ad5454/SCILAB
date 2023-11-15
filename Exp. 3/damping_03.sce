//effect of damping ratio
clc;
clear;

s=poly(0,'s'); 
t=0:0.01:150;
w = input('Enter the value of natural frequency of oscillation:'); //w=1
for i=1:5 //z=0.1, 0.4, 0.7, 1.0, 2.0
    z(i)=input('Enter the value of damping coefficient:');
    sys=(w*w)/(s^2 + (2*w*z(i)*s)+ w*w);
    plot2d(t,csim ('step', t, sys));
end
xlabel("t", "fontsize", 2, "color", "blue");
ylabel("y");
title('effect of damping ratio','color','red');
