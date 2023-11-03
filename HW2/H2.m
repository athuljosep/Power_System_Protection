clc
clear all; close all

f = 60;
w = 2*pi*f;
N = 12;
del_T = 1/(f*N);
t = [0:0.0001:0.2];
Ts = [0:del_T:0.2];

for i = 1:length(t)
    if t(i) < 0.1
        v1(i) = 5*sin((w*t(i))+(pi/6));
        v2(i) = 5*sin((w*t(i))+(pi/6)) + 3*sin((2*w*t(i))+(pi/6));
    else
        v1(i) = 10*sin((w*t(i))+(pi/6));
        v2(i) = 10*sin((w*t(i))+(pi/6))+ 3*sin((2*w*t(i))+(pi/6));
    end
end

for i = 1:length(Ts)
    if Ts(i) < 0.1
        vs1(i) = 5*sin((w*Ts(i))+(pi/6));
        vs2(i) = 5*sin((w*Ts(i))+(pi/6)) + 3*sin((2*w*Ts(i))+(pi/6));
    else
        vs1(i) = 10*sin((w*Ts(i))+(pi/6));
        vs2(i) = 10*sin((w*Ts(i))+(pi/6))+ 3*sin((2*w*Ts(i))+(pi/6));
    end
end
T_plot = Ts(N:length(Ts));

figure(1)
plot(t,v1)
hold on
V_Fourier = Fourier(vs1,w,N);
plot(T_plot,V_Fourier)
hold off

figure(2)
plot(t,v2)
hold on
V_Fourier = Fourier(vs2,w,N);
plot(T_plot,V_Fourier)
hold off

figure(3)
plot(t,v1)
hold on
V_LSM = LSM(vs1,w,N);
plot(T_plot,V_LSM)
hold off

figure(4)
plot(t,v2)
hold on
V_LSM = LSM(vs2,w,N);
plot(T_plot,V_LSM)
hold off