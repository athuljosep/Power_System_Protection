clc
clear all
close all

t = [0:0.0001:0.3];
f = 60;
w = 2*pi*f;
N = 12;
dT = 

for i = 1:length(t)
    if t(i) < 0.1
        a(i) = 6*sin((w*t(i) )+(pi/3)) + 3*sin((2*w*t(i) )+(pi/3));
    else
        a(i) = 10*sin((w*t(i) )+(pi/3)) + 3*sin((2*w*t(i) )+(pi/3));
    end
end
plot(t,a)

Ts = 1/(f*N);
t1 = [0:Ts:0.3];
for i = 1:length(t1)
    if t1(i) < 0.1
        b(i) = 6*sin((w*t1(i) )+(pi/3)) + 3*sin((2*w*t1(i) )+(pi/3));
    else
        b(i) = 10*sin((w*t1(i) )+(pi/3)) + 3*sin((2*w*t1(i) )+(pi/3));
    end
end
hold on
plot(t1,b)

V_Mann = Mann_Morris(b);
T_Mann = t1(2:length(t1)-1);
plot(T_Mann,V_Mann)

V_Prod = Prodar(b);
T_Prod = t1(2:length(t1)-1);
plot(T_Prod,V_Prod)