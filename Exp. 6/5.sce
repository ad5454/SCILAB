clc;
clear all;

frq = 1000;

disp('new system');
s = poly(0, 's'); 
sys = 1 / (s^3 + 6 * s^2 + 5 * s);
h = syslin('c', sys);
disp(h);

[frq1, rep] = repfreq(h, frq);
[db, phi] = dbphi(rep);
[phm, fr] = p_margin(h);
[gm, fr] = g_margin(h);

scf;
bode(h);

for k = 0:10:80
    sys = (1 * k) / (s^3 + 6 * s^2 + 5 * s);
    h = syslin('c', sys);
    [phm, fr] = p_margin(h);
    [gm, fr] = g_margin(h);
    disp(k);
    disp(h);
    disp(phm);
    disp(gm);
    
    if (phm > gm)
        scf;
        bode(h);
        title('Stable System', "fontsize", 6, 'color', 'red');
    elseif (abs(phm - gm) < 0.01)
        scf;
        bode(h);
        title('Marginally Stable System', "fontsize", 6, 'color', 'red');
    elseif (phm < gm)
        scf;
        bode(h);
        title('Unstable System', "fontsize", 6, 'color', 'red');
    end
    
    
    sys_cl = feedback(h, 1);
    t = 0:0.01:10; 
    scf;
    plot2d(t, csim('step', t, sys_cl), -1); 
    title('Step Response without Controller');
    xlabel('Time');
    ylabel('Output');
    
    
    sys_cntr_cl = feedback(h, k * h);
    scf;
    plot2d(t, csim('step', t, sys_cntr_cl), 3); 
    title('Step Response with Controller');
    xlabel('Time');
    ylabel('Output');
end

