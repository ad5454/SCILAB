// Lag compensator design using Root Locus
clc;
clear;
clf;
K1=1; //Assign K=1
s=poly(0,'s'); 
G=K1/(s*(s+2)*(s+8));  //OLTF

evans(G);  //Root locus of OLTF

M=input("Enter Percentage Overshoot:"); 
zeta=sqrt(log(M)^2/(%pi^2 +log(M)^2)); //compute damping ratio
sgrid(zeta,0); //select the dominant pole at line cos^(-1) of zeta

p=locate(1);
 K=-1/real(horner(G,[1,%i]*p));
 gl=1+K*G;
K
disp(K);
disp(gl);
disp(p);

Kvu=input("Enter velocity error constant of uncompensated system:"); 
ess=input("Enter the value of required steady state error:"); 
Kvd=1/ess //velocity error constant of desired system
A=Kvd/Kvu //compute the improvement factor in velocity error constants
beta=1.2*A

[z, p, k] = tf2zp(G);
m=length(p);
poles(2) = p(m-1);
T=1/(-0.1*poles(2)); //takes the values of second pole of the OL system
Zc=1/T //Zero of the lag compensator
Pc=1/(beta*T); // Pole of the lag compensator
Gc=((s+Zc)/(s+Pc)); //TF of lag compensator
sys=Gc*K*G //OLTF of compensated system
disp(Gc);
disp(sys);

scf;
evans(sys);

G_cl=G /. 1;
sys_cl = sys /. 1;

scf;
t=0:0.1:150;
plot2d(t,csim ('step', t, G_cl),5); //step response of CLTF without controller
plot2d(t,csim ('step', t, sys_cl),2); //step response of CLTF with controller
legends(['uncompensated','compensated'],[5,2],opt=1);

