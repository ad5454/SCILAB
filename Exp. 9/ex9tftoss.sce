// TRANSFER FUNCTION TO STATE SPACE SPACE MODEL
clc;
clear;

//system 1
s=poly(0,'s');
h=1/(s^2 + 3*s + 2);
disp('Transfer function is:');
disp(h);
[s1]=tf2ss(h); //converts transfer function to state space parameters
disp(s1);
s2 = ss2tf(s1)
disp(s2);
scf;
t=0:0.1:150;
plot2d(t,csim ('step', t, s1),5)

//system 2
h1=(5*s + 10)/(s^4 + 2*s^3 + s^2 + 5*s + 10);
disp('Transfer function is:');
disp(h1);
[s11]=tf2ss(h1) //converts transfer function to state space parameters
disp(s11);
s12 = clean(ss2tf(s11));
disp(s12);
scf;
t=0:0.1:150;
plot2d(t,csim ('step', t, s11),5)
