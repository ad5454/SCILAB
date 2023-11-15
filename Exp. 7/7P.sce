clc;
clear all;
clf;

frq = 0.01:0.02:64
s=poly(0,'s'); 
sys= 100/((s+1)*(s+2)*(s+10))

h = syslin ('c', sys)
bode(h) //bode plot of OLTF without controller

sys_cl=sys /. 1
t=0:0.05:10;

// calculate the values of kp, ki and kd from the given data in the worksheet

kp=input("Enter kp value:")


cntr = kp  //creates the TF of PID controller
disp(cntr)

sys_cntr = cntr * sys //OLTF with controller
disp(sys_cntr)

scf;
sys_cntr_cl= sys_cntr/(1+sys_cntr) //CLTF with controller
sys_cntr = syslin ('c', sys_cntr)
bode(sys_cntr) //bode plot of OLTF with controller

scf
plot2d(t,csim ('step', t, sys_cl),-1) //step response of CLTF without controller
plot2d(t,csim ('step', t, sys_cntr_cl),3) //step response of CLTF with controller

