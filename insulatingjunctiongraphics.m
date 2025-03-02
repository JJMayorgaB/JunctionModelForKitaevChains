% Parameters
n = 1; 
phi_S = (1/3)*pi;
delta_phi = linspace(0, 4*pi, 200);

E1 = @(delta_phi) -cos(delta_phi / 2) .* (n - 1/2); %Energy of the insulating junction H_I
I1 = @(delta_phi) sin(delta_phi / 2) .* (n - 1/2); %Current  of the insulating junction I_I

%Superconducting phases
phi_R = 0; % Phase reference
phi_L = delta_phi + phi_R; % phi_L = delta_phi + phi_R (but phi_R = 0)

E2 = @(delta_phi) -cos((phi_L + phi_R) / 2 - phi_S) .* (n - 1/2); %Energy of the superconducting junction H_S

%Graphic for the Josephson energy H_I of the insulating junction
figure;
textSize = 22;

plot(delta_phi, E1(delta_phi), 'b', 'LineWidth', 1);

hold on
plot(delta_phi, -E1(delta_phi), 'r', 'LineWidth', 1);
xlabel('$\Delta\phi$', 'Interpreter', 'latex', 'FontSize', textSize);
ylabel('$\langle H_{\textit{I}}\rangle/\Gamma$', 'Interpreter', 'latex', 'FontSize', textSize);
xticks([0, 2*pi, 4*pi]); % Establecer los xticks en 0, 2pi y 4pi
xticklabels({'0', '$2\pi$', '$4\pi$'}); % Etiquetas personalizadas
yticks([-0.5, 0, 0.5]);
yticklabels({'-$\frac{1}{2}$', '0', '$\frac{1}{2}$'});
set(gca, 'TickLabelInterpreter', 'latex', 'FontSize', textSize);
xlim([0 4*pi]);
grid on;

set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on');
set(gca, 'Box', 'on', 'LineWidth', 1);

x_pos_blue = 2 * pi-0.3; 
y_pos_blue = 0.4; 
text(x_pos_blue, y_pos_blue, '$n=1$', 'Interpreter', 'latex', 'Color', 'b', 'FontSize', textSize, 'HorizontalAlignment', 'left');


x_pos_red = 2 * pi-0.3; 
y_pos_red = -0.4; 
text(x_pos_red, y_pos_red, '$n=0$', 'Interpreter', 'latex', 'Color', 'r', 'FontSize', textSize, 'HorizontalAlignment', 'left');

hold off

%Graphic for the Josephson current I_I of the insulating junction
figure;
textSize = 18;

plot(delta_phi, I1(delta_phi), 'b', 'LineWidth', 1);

hold on

plot(delta_phi, -I1(delta_phi), 'r', 'LineWidth', 1);

xlabel('$\Delta\phi$', 'Interpreter', 'latex', 'FontSize', textSize);
ylabel('$I_{\textit{I}}/I_c$', 'Interpreter', 'latex', 'FontSize', textSize);
xticks([0, 2*pi, 4*pi]); 
xticklabels({'0', '$2\pi$', '$4\pi$'}); 
yticks([-0.5, 0, 0.5]);
yticklabels({'-$\frac{1}{2}$', '0', '$\frac{1}{2}$'});
set(gca, 'TickLabelInterpreter', 'latex', 'FontSize', textSize);
xlim([0 4*pi]);
grid on;

set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on');
set(gca, 'Box', 'on', 'LineWidth', 1);

x_pos_blue = pi-0.3; 
y_pos_blue = 0.4; 
text(x_pos_blue, y_pos_blue, '$n=1$', 'Interpreter', 'latex', 'Color', 'b', 'FontSize', textSize, 'HorizontalAlignment', 'left');


x_pos_red =  3*pi-0.3; 
y_pos_red = 0.4; 
text(x_pos_red, y_pos_red, '$n=0$', 'Interpreter', 'latex', 'Color', 'r', 'FontSize', textSize, 'HorizontalAlignment', 'left');

hold off

%Graphic for the effective superconducting term vs. the effective insulating term
figure;
textSize = 18;

plot(delta_phi, E2(delta_phi), 'r', 'LineWidth', 1); %Superconducting term

hold on

plot(delta_phi, E1(delta_phi), 'b', 'LineWidth', 1); %Insulating term

xlabel('$\Delta\phi$', 'Interpreter', 'latex', 'FontSize', textSize);
ylabel('$\langle H \rangle/\Delta$', 'Interpreter', 'latex', 'FontSize', textSize);
xticks([0, 2*pi, 4*pi]); 
xticklabels({'0', '$2\pi$', '$4\pi$'}); 
yticks([-0.5, 0, 0.5]);
yticklabels({'-$\frac{1}{2}$', '0', '$\frac{1}{2}$'});
set(gca, 'TickLabelInterpreter', 'latex', 'FontSize', textSize);
xlim([0 4*pi]);
grid on;

set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on');
set(gca, 'Box', 'on', 'LineWidth', 1);

x_pos_blue = 2.52-0.3; 
y_pos_blue = 0; 
text(x_pos_blue, y_pos_blue, '$\langle H_I \rangle$', 'Interpreter', 'latex', 'Color', 'b', 'FontSize', textSize, 'HorizontalAlignment', 'left');


x_pos_red = 2 *pi-0.3; 
y_pos_red = 0; 
text(x_pos_red, y_pos_red, '$\langle H_M \rangle$', 'Interpreter', 'latex', 'Color', 'r', 'FontSize', textSize, 'HorizontalAlignment', 'left');
