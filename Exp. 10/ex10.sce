//Clean the environment
clc;
clear all;
//clf;

// State space representation
A=[-5 1 0; 0 -2 1; 0 0 -1];
B=[6; 0; 1];
C=[1 0 0];
D=0;
sys=syslin('c',A,B,C,D)

// Controllability test
n=cont_mat(sys)
mprintf('Controllability matrix is')
disp(n)

if rank(n)==3 then
    disp('System is controllable')
else
    disp('System is uncontrollable')
end

// Observability test
m=obsv_mat(sys)
mprintf('Observability matrix is')
disp(m)

if rank(m)==3 then
    disp('System is observable')
else
    disp('System is unobservable')
end

