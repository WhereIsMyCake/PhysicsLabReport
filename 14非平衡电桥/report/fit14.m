% ================================
% Cu50 电阻-温度特性曲线
% ================================

% 1. 实验数据
t = [25 30 35 40 45 50 55 60];          % 温度 / ℃
R = [55.95 56.91 57.99 59.14 ...
     60.20 61.22 62.31 63.42];          % 电阻 / Ω

% 2. 线性拟合 R = a*t + b
p = polyfit(t, R, 1);   % 一次多项式拟合
a = p(1);               % 斜率
b = p(2);               % 截距

% 3. 生成拟合曲线
t_fit = linspace(min(t), max(t), 200);
R_fit = polyval(p, t_fit);

% 4. 绘图
figure;
plot(t, R, 'ko', 'MarkerFaceColor', 'k');  % 实验数据点
hold on;
plot(t_fit, R_fit, 'r-', 'LineWidth', 1.5); % 拟合直线
grid on;

% 5. 图像标注
xlabel('t / ℃');
ylabel('R_t / \Omega');

legend('测量数据', '拟合直线 R = 0.2144 t + 50.5313 (Ω)', 'Location', 'northwest');

% 6. 在图中显示拟合公式
%eqn = sprintf('R = %.4f t + %.4f', a, b);
%text(30, 62, eqn, 'FontSize', 10, 'BackgroundColor', 'w');


% 7. 显示拟合结果
fprintf('线性拟合结果：R = %.4f t + %.4f (Ω)\n', a, b);
