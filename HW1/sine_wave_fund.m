clc
clear all
% close all

f = 60;
w = 2*pi*f;
N = 12;
del_T = 1/(f*N);
t = [0:0.0001:0.2];
Ts = [0:del_T:0.2];

for i = 1:length(t)
    if t(i) < 0.1
        v1(i) = 6*sin((w*t(i))+(pi/3));
        v2(i) = 6*sin((w*t(i))+(pi/3)) + 3*sin((2*w*t(i) )+(pi/3));
    else
        v1(i) = 10*sin((w*t(i))+(pi/3));
        v2(i) = 10*sin((w*t(i))+(pi/3))+ 3*sin((2*w*t(i) )+(pi/3));
    end
end

for i = 1:length(Ts)
    if Ts(i) < 0.1
        vs1(i) = 6*sin((w*Ts(i))+(pi/3));
        vs2(i) = 6*sin((w*Ts(i))+(pi/3)) + 3*sin((2*w*Ts(i))+(pi/3));
    else
        vs1(i) = 10*sin((w*Ts(i))+(pi/3));
        vs2(i) = 10*sin((w*Ts(i))+(pi/3))+ 3*sin((2*w*Ts(i))+(pi/3));
    end
end
T_plot = Ts(2:length(Ts)-1);

% figure(1) 
% plot(t,v1)
% hold on
% V_Mann = Mann_Morris(vs1,w,del_T);
% plot(T_plot,V_Mann)
% V_Prod = Prodar(vs1,w,del_T);
% plot(T_plot,V_Prod)
% hold off
% 
% figure(2)
% plot(t,v2)
% hold on
% V_Mann = Mann_Morris(vs2,w,del_T);
% plot(T_plot,V_Mann)
% V_Prod = Prodar(vs2,w,del_T);
% plot(T_plot,V_Prod)
% hold off