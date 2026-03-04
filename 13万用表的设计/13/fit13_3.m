% =========================
% 改装欧姆表：曲线拟合
% =========================

% 实验数据
Ix = [5.00 4.60 4.20 3.80 3.40 3.00 2.60 2.20 1.80 1.40 1.00 0.60];  % mA
Rx = [0.0 29.6 61.0 99.7 147.5 206.9 281.3 385.5 529.7 759.9 1199.8 2019.7]; % Ohm

figure;
hold on;
grid on;

% 1. 红色实验数据点
plot(Ix, Rx, 'ro', 'MarkerSize', 7, 'MarkerFaceColor', 'r');

% 2. 曲线拟合（Rx = a*(1/Ix) + b 形式）
p = polyfit(1./Ix, Rx, 1);

Ix_fit = linspace(min(Ix), max(Ix), 300);
Rx_fit = polyval(p, 1./Ix_fit);

plot(Ix_fit, Rx_fit, 'b-', 'LineWidth', 1.5);

% 坐标轴
xlabel('I_x / mA');
ylabel('R_x / \Omega');
title('R_x ~ I_x 拟合曲线');


% 图例
legend({'实验数据', ...
        sprintf('拟合曲线：R_x = %.2f / I_x + %.2f', p(1), p(2))}, ...
       'Location', 'northwest');

hold off;
