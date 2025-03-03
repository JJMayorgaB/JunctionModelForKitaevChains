% Parameters
n = 1; 
delta_phi = linspace(0, 4*pi, 50);

phi_S_values = 0:pi/2:2*pi;

%Superconducting phases
phi_R = 0; % Reference phase
phi_L = delta_phi + phi_R; % phi_L = delta_phi + phi_R (pero phi_R = 0)

figure;
textSize = 22;

num_curves = length(phi_S_values)-1;
colors = winter(num_curves);

%Graphic for the Josephson energy H_S of the superconducting junction as a function of phi_S
for i = 1:num_curves
    phi_S = phi_S_values(i);
    
    E1 = @(delta_phi) -cos(delta_phi / 2) .* (n - 1/2); %Energy of the insulating junction H_I
    E2 = @(delta_phi) -cos((delta_phi + 0) / 2 - phi_S) .* (n - 1/2); %Energy of the superconducting junction H_M

    E_total = E1(delta_phi) + E2(delta_phi);

    plot(delta_phi, E_total, 'Color', colors(i, :), 'LineWidth', 1);
    hold on;
end

xlabel('$\Delta\phi$', 'Interpreter', 'latex', 'FontSize', textSize);
ylabel('$\langle H_S \rangle/\Delta$', 'Interpreter', 'latex', 'FontSize', textSize); 
xticks([0, 2*pi, 4*pi]); 
xticklabels({'0', '$2\pi$', '$4\pi$'}); 
yticks([-1, 0, 1]);
set(gca, 'TickLabelInterpreter', 'latex', 'FontSize', textSize);
xlim([0 4*pi]);
ylim([-1 1])
grid on;

set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on');
set(gca, 'Box', 'on', 'LineWidth', 1);

legend_labels = cell(1, num_curves);
for i = 1:num_curves
    if phi_S_values(i) == 0
        legend_labels{i} = '$\phi_S = 0$';
    else
        legend_labels{i} = sprintf('$\\phi_S = %.1f\\pi$', phi_S_values(i)/pi);
    end
end
legend(legend_labels, 'Interpreter', 'latex', 'FontSize', textSize);

hold off;


%Graphic for the Josephson current I_S of the superconducting junction as a function of phi_S
figure;
textSize = 18;

num_curves = length(phi_S_values)-1;
colors = winter(num_curves);

for i = 1:num_curves
    phi_S = phi_S_values(i);
    
    I1 = @(delta_phi) sin(delta_phi / 2) .* (n - 1/2); %Current  of the insulating junction I_I
    I2 = @(delta_phi) sin((phi_L + phi_R) / 2 - phi_S) .* (n - 1/2); %Current  of the superconducting junction I_M

    I_S = I1(delta_phi) + I2(delta_phi);

    plot(delta_phi, I_S, 'Color', colors(i, :), 'LineWidth', 1);
    hold on;
end

xlabel('$\Delta\phi$', 'Interpreter', 'latex', 'FontSize', textSize);
ylabel('$I_S/I_c$', 'Interpreter', 'latex', 'FontSize', textSize); 
xticks([0, 2*pi, 4*pi]); 
xticklabels({'0', '$2\pi$', '$4\pi$'}); 
yticks([-1, 0, 1]);
set(gca, 'TickLabelInterpreter', 'latex', 'FontSize', textSize);
xlim([0 4*pi]);
ylim([-1 1])
grid on;

set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on');
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on');
set(gca, 'Box', 'on', 'LineWidth', 1);

legend_labels = cell(1, num_curves);
for i = 1:num_curves
    if phi_S_values(i) == 0
        legend_labels{i} = '$\phi_S = 0$';
    else
        legend_labels{i} = sprintf('$\\phi_S = %.1f\\pi$', phi_S_values(i)/pi);
    end
end
legend(legend_labels, 'Interpreter', 'latex', 'FontSize', textSize);

hold off;
