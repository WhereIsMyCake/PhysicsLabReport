% =========================
% 万用表设计实验：Ig ~ IB 曲线
% =========================

% 实验数据（单位：mA）
Ig = [1.00, 2.00, 3.00, 4.00, 5.00];      % 改装电流表读数
IB = [0.99, 1.94, 2.90, 3.86, 5.00];      % 标准安培表读数

figure;
hold on;
grid on;

% 1. 实验数据连线（黑色虚线）
%plot(IB, Ig, 'k--', 'LineWidth', 1.2);

% 2. 实验数据点（红色圆点）
%plot(IB, Ig, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r');

% 3. 线性拟合（蓝色实线）
p = polyfit(IB, Ig, 1);
IB_fit = linspace(min(IB), max(IB), 100);
Ig_fit = polyval(p, IB_fit);
%plot(IB_fit, Ig_fit, 'b-', 'LineWidth', 1.5);

% 坐标轴与标题
xlabel('I_B / mA');
ylabel('I_g / mA');
title('I_g ~ I_B 拟合曲线');


h1 = plot(IB, Ig, 'k--', 'LineWidth', 1.2);  % 连线
h2 = plot(IB, Ig, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r'); % 数据点
h3 = plot(IB_fit, Ig_fit, 'b-', 'LineWidth', 1.5); % 拟合

legend([h2, h3], ...
       {'实验数据', sprintf('线性拟合：I_g = %.3f I_B + %.3f', p(1), p(2))}, ...
       'Location', 'northwest');


% 图例
%legend( '实验数据', ...
 %      sprintf('线性拟合：I_g = %.3f I_B + %.3f', p(1), p(2)), ...
  %     'Location', 'northwest');

hold off;
