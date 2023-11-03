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

V_Mann = Mann_Morris(vs2,w,del_T);
V_Prod = Prodar(vs2,w,del_T);

x_label = 'Time (s)'; % x axis label
y_label = 'V'; % y axis label
% legend_name = {'Signal','Mann & Morrison Algorithm','Prodar Algorithm'}; % legend names
legend_name = {'Signal','Samples'}; % legend names

figure('Renderer', 'painters', 'Position', [10 10 1000 400])
plot(t, v2, '-b', 'LineWidth',1.5)
hold on
plot(Ts,vs2,'ok','LineWidth',1)
% plot(T_plot,V_Mann,'-b', 'LineWidth',1)
% plot(T_plot,V_Prod,'-r', 'LineWidth',1)
% plot(Data1.ans(1,:), Data1.ans(4,:),'-g', 'LineWidth',2)
% plot(Data1.ans(1,:), Data1.ans(4,:),'-r', 'LineWidth',2)
xlabel(x_label,'FontSize',18,'FontName','Times New Roman')
ylabel(y_label,'FontSize',18,'FontName','Times New Roman')
legend (legend_name,'Location','northeast')
set(gca,'fontsize',16,'Fontname','Times New Roman','GridAlpha',0.5)
ax = gca;

ax.XRuler.Axle.LineWidth = 1.5;
ax.YRuler.Axle.LineWidth = 1.5;
grid
grid minor
% legend (legend_name,'Location','southeast')
saveas(gca,'plot.png')


figure(2)
plot(t,v1)
hold on
V_Mann = Mann_Morris(vs2,w,del_T);
plot(T_plot,V_Mann)
V_Prod = Prodar(vs2,w,del_T);
plot(T_plot,V_Prod)
hold off