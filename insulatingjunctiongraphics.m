% Parámetros
n = 1; 
phi_S = (1/3)*pi;
delta_phi = linspace(0, 4*pi, 200);

E1 = @(delta_phi) -cos(delta_phi / 2) .* (n - 1/2); %Energía de la juntura aislante H_I
I1 = @(delta_phi) sin(delta_phi / 2) .* (n - 1/2); %Corriente de la juntura aislante I_I

%Fases superconductoras
phi_R = 0; % Fase de referencia
phi_L = delta_phi + phi_R; % phi_L = delta_phi + phi_R (pero phi_R = 0)

E2 = @(delta_phi) -cos((phi_L + phi_R) / 2 - phi_S) .* (n - 1/2); %Energía de la juntura superconductora H_S

%Grafica para la energía de Josephson H_I de la juntura aislante
figure;
textSize = 18;

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

%Grafica para la corriente Josephson I_I de la juntura aislante
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

%Grafica para el termino efectivo superconductor vs. el termino efectivo
%aislante
figure;
textSize = 18;

plot(delta_phi, E2(delta_phi), 'r', 'LineWidth', 1); %Termino superconductor

hold on

plot(delta_phi, E1(delta_phi), 'b', 'LineWidth', 1); %Termino aislante

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