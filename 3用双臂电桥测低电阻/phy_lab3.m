% ======================================
% 金属电阻温度系数实验 - 数据处理与作图
% ======================================

% 实验数据
t = [36.7 40.9 46.4 51.3 56.3 60.9 67.0 72.6 78.1 83.0];  % 温度(℃)
R = [4.590 4.671 4.760 4.849 4.935 5.010 5.120 5.217 5.312 5.401] * 1e-3; % 电阻(Ω)

% 一次线性拟合 R = a*t + b
p = polyfit(t, R, 1);   % p(1)=a, p(2)=b
R_fit = polyval(p, t);

% 拟合参数
a = p(1);  % 斜率
b = p(2);  % 截距

% 电阻温度系数 α = a / b
alpha = a / b;

% 输出结果（4位有效数字）
fprintf('线性拟合方程: R = %.6e * t + %.6e\n', a, b);
fprintf('电阻温度系数 α = %.4e /℃\n', alpha);

% 绘图
figure;
plot(t, R, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', '实验数据');
hold on;
plot(t, R_fit, 'b-', 'LineWidth', 1.5, 'DisplayName', '线性拟合');
xlabel('温度 t (℃)', 'FontSize', 12);
ylabel('电阻 R (Ω)', 'FontSize', 12);
title('导体电阻随温度变化特性曲线', 'FontSize', 13);
legend('Location', 'northwest');
grid on;

% 在图中添加拟合方程与α
text(40, max(R)*0.98, sprintf('R = %.3e t + %.3e', a, b), 'FontSize', 10, 'Color', 'b');
text(40, max(R)*0.96, sprintf('\\alpha = %.3e /℃', alpha), 'FontSize', 10, 'Color', 'b');
