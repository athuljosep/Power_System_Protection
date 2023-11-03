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

V_Fourier = Fourier(vs2,w,N);
V_LSM = LSM(vs2,w,N);

x_label = 'Time (s)'; % x axis label
y_label = 'V'; % y axis label
legend_name = {'Signal','Fourier Algorithm'}; % legend names
% legend_name = {'Signal','Samples'}; % legend names

figure('Renderer', 'painters', 'Position', [10 10 1000 400])
plot(t, v2, '-k', 'LineWidth',1.5)
hold on
% plot(Ts,vs2,'-k','LineWidth',1.5)
plot(T_plot,V_Fourier,'-b', 'LineWidth',1.5)
% plot(T_plot,V_LSM,'-b', 'LineWidth',1.5)
xlabel(x_label,'FontSize',18,'FontName','Times New Roman')
ylabel(y_label,'FontSize',18,'FontName','Times New Roman')
legend (legend_name,'Location','southwest')
set(gca,'fontsize',16,'Fontname','Times New Roman','GridAlpha',0.5)
ax = gca;

ax.XRuler.Axle.LineWidth = 1.5;
ax.YRuler.Axle.LineWidth = 1.5;
grid
grid minor
% legend (legend_name,'Location','southeast')
saveas(gca,'plot.png')