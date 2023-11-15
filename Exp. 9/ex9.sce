
// STATE SPACE SPACE MODEL TO TRANSFER FUNCTION
clc;
clear;
//system 1
A=input('Enter the System Matrix,A:'); 
B=input('Enter the Input Matrix,B:'); 
C=input('Enter the Output Matrix,C:'); 
D=input('Enter the Feedforward Matrix,D:'); 
s1 = syslin('c', A, B, C, D);
s2 = ss2tf(s1);
disp(s2);
[z, p, k] =ss2zp(s1);
eig_val = spec ( A );
[a1,a2] = spec(A);
mprintf('Eigen values of the system matrix are')
disp(eig_val)
scf;
t=0:0.1:150;
plot2d(t,csim ('step', t, s2),5) 
//system 2
A=input('Enter the System Matrix,A:'); 
B=input('Enter the Input Matrix,B:'); 
C=input('Enter the Output Matrix,C:'); 
D=input('Enter the Feedforward Matrix,D:'); 
s1 = syslin('c', A, B, C, D);
s2 = ss2tf(s1);
disp(s2);
s2 = clean(ss2tf(s1));
disp(s2);
[z, p, k] =ss2zp(s1);
eig_val = spec ( A );
[a1,a2] = spec(A);
mprintf('Eigen values of the system matrix are')
disp(eig_val)
scf;
t=0:0.1:150;
plot2d(t,csim ('step', t, s2),5) 
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
scf;
t=0:0.1:150;
plot2d(t,csim ('step', t, s1),5)

//s2 = ss2tf(s1)
//disp(s2)
//system 2
h1=(5*s + 10)/(s^4 + 2*s^3 + s^2 + 5*s + 10)
disp('Transfer function is:');
disp(h1);
[s11]=tf2ss(h1); //converts transfer function to state space parameters
disp(s11);
s12 = clean(ss2tf(s11));
disp(s12)
scf;
t=0:0.1:150;
plot2d(t,csim ('step', t, s1),5)
