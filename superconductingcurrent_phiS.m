% Parameter
n = 1; 
phi_S = linspace(-pi, pi, 50);

% Superconducting phases
phi_R = 0; % Reference phase
delta_phi_values = 0:pi/2:pi;

% Graphic for the Josephson current I_s of the superconducting junction as a function of phi_S for a given difference phase
figure;
textSize = 22;

num_curves = length(delta_phi_values);
colors = winter(num_curves);

for i = 1:num_curves
    delta_phi = delta_phi_values(i);
    phi_L = delta_phi + phi_R; % phi_L = delta_phi + phi_R (but phi_R = 0)
    
    I1 = @(phi_S) sin(delta_phi / 2) .* (n - 1/2); % Current of the insulating junction I_I
    I2 = @(phi_S) sin((phi_L + phi_R) / 2 - phi_S) .* (n - 1/2); % Current of the superconducting junction I_M

    I_S = I1(phi_S) + I2(phi_S);

    plot(phi_S, I_S, 'Color', colors(i, :), 'LineWidth', 1);
    hold on;
end

xlabel('$\phi_S$', 'Interpreter', 'latex', 'FontSize', textSize);
ylabel('$I_S/I_c$', 'Interpreter', 'latex', 'FontSize', textSize); 
xticks([-pi, 0, pi]); 
xticklabels({'$-\pi$', '0', '$\pi$'}); 
yticks([-1, 0, 1]);
set(gca, 'TickLabelInterpreter', 'latex', 'FontSize', textSize);
xlim([-pi pi]);
ylim([-1 1])
grid on;

set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on');
set(gca, 'Box', 'on', 'LineWidth', 1);

legend_labels = cell(1, num_curves);
for i = 1:num_curves
    if delta_phi_values(i) == 0
        legend_labels{i} = '$\Delta\phi = 0$';
    else
        legend_labels{i} = sprintf('$\\Delta\\phi = %.1f\\pi$', delta_phi_values(i)/pi);
    end
end
legend(legend_labels, 'Interpreter', 'latex', 'FontSize', textSize);

hold off;