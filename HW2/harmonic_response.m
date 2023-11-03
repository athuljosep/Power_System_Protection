clc
clear all; close all;

f = 60; % base frequency
w0 = 2 * pi * f; % base angular frequency
x = [0:0.01:6]; 
w = x * w0; % angular frequency
N = 12; % number of samples
dT = 1 / (f * N); % sampling period
Hc = 0;
Hs = 0;
for k=1:N % calculating response
    j = (2*k-N-1)/2;
    Hc = Hc+(2/N)*cos(j*w0*dT)*exp(1i*w*dT*j);
    Hs = Hs+(2/N)*sin(j*w0*dT)*exp(1i*w*dT*j);
end
plot(x,abs(Hc),x,abs(Hs)) %plotting response

% x_label = '\omega / \omega_0'; % x axis label
% y_label = 'output / input'; % y axis label
% legend_name = {'Cosine Filter',' Sine Filter'}; % legend names
% 
% 
% figure('Renderer', 'painters', 'Position', [10 10 1000 400])
% plot(x, abs(Hc), '-k', 'LineWidth',1.5)
% hold on
% plot(x, abs(Hs), '-r', 'LineWidth',1.5)
% xlabel(x_label,'FontSize',18,'FontName','Times New Roman')
% ylabel(y_label,'FontSize',18,'FontName','Times New Roman')
% legend (legend_name,'Location','northeast')
% set(gca,'fontsize',16,'Fontname','Times New Roman','GridAlpha',0.5)
% ax = gca;
% 
% ax.XRuler.Axle.LineWidth = 1.5;
% ax.YRuler.Axle.LineWidth = 1.5;
% grid
% grid minor
% saveas(gca,'Cosine_resp.png')