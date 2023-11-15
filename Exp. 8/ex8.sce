//Lead compesator using bode plot
clc;
clear;

ess=input("Enter required steady state error:"); 
Kv=1/ess //computes velocity error constant
K=input("Enter the value of gain for required steady state error:");
//in this case K = Kv --> compute manually and enter
e=5; //additional phase angle

s=poly(0,'s'); 
G= K/(s*(s+1))// %OLTF
G = syslin ('c', G);
bode(G,0.01,100) //Plots bode graph with GM and PM

frq = 0.01:0.02:64
[phm,fr_phm]=p_margin(G)
[gm,fr_gm]= g_margin(G)
disp(phm)
//phm is the phase margin of uncompensated system

PM_des=input("Enter desired phase margin:"); 
phi_req=PM_des-phm+e //compute required phase margin from lead compensator
alpha=(1-sind(phi_req))/(1+sind(phi_req)) //computes alpha of lead compensator
//sind command computes sine value of arguments in degree

mag=-20*log10(1/sqrt(alpha)) //computes dB magnitude corresponding to 1/sqrt(alpha)
disp(mag)
//read the freq corresponding to 'mag' and enter below
fm=input("Enter the freq of mag:"); 
wm=2*%pi*fm;
T=1/(wm*sqrt(alpha)) //computes time constant of lead compensator
zc=1/T //computes zero of lead compensator
pc=1/(alpha*T) //computes pole of lead compensator
Gc=(s+zc)/(s+pc) //TF of lead compensator
sys=(1/alpha)*Gc*G //OLTF of compensated system
scf;

bode(sys,.001,100) //bode plot and GM, PM of compensated system

frq = 0.01:0.02:64
[phm_GGc,fr]=p_margin(sys)
[gm,fr]= g_margin(sys)

disp(phm_GGc)
disp(sys)

G_cl=G /. 1;
sys_cl = sys /. 1;

scf;
t=0:0.1:150;
plot2d(t,csim ('step', t, G_cl),5) //step response of CLTF without controller
plot2d(t,csim ('step', t, sys_cl),2) //step response of CLTF with controller
legends(['uncompensated','compensated'],[5,2],opt=1);
