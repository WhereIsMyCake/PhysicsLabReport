% =========================
% 万用表设计实验：Ug ~ UB 曲线
% =========================

% 实验数据（单位：V）
Ug = [1.00, 2.00, 3.00, 4.00, 5.00];   % 改装电压表读数
UB = [1.01, 2.01, 3.05, 4.00, 5.00];   % 标准伏特表读数

figure;
hold on;
grid on;

% 1. 实验数据连线（黑色虚线）
%plot(UB, Ug, 'k--', 'LineWidth', 1.2);

% 2. 实验数据点（红色圆点）
%plot(UB, Ug, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r');

% 3. 线性拟合（蓝色实线）
p = polyfit(UB, Ug, 1);
UB_fit = linspace(min(UB), max(UB), 100);
Ug_fit = polyval(p, UB_fit);
%plot(UB_fit, Ug_fit, 'b-', 'LineWidth', 1.5);

% 坐标轴与标题
xlabel('U_B / V');
ylabel('U_g / V');
title('U_g ~ U_B 拟合曲线');

h1 = plot(UB, Ug, 'k--', 'LineWidth', 1.2);  % 连线
h2 = plot(UB, Ug, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r'); % 数据点
h3 = plot(UB_fit, Ug_fit, 'b-', 'LineWidth', 1.5); % 拟合

legend([h2, h3], ...
       {'实验数据', sprintf('线性拟合：U_g = %.3f U_B + %.3f', p(1), p(2))}, ...
       'Location', 'northwest');

% 图例（只保留关键项）
%legend({'实验数据', ...
 %       sprintf('线性拟合：U_g = %.3f U_B + %.3f', p(1), p(2))}, ...
  %     'Location', 'northwest');

hold off;
