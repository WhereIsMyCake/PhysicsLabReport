% --------------------------------------------
% 原始数据
% --------------------------------------------
x = [5 10 15 20 25 30 35 40 45 50];   % mm
f = [726.7 726.3 725.4 724.8 724.3 724.0 NaN 723.9 723.9 724.1];  % Hz
L = 159.8;  % mm

% 去除 NaN
valid = ~isnan(f);
x = x(valid);
f = f(valid);

% 转换为 x/L
xL = x / L;

% --------------------------------------------
% 二次拟合
% --------------------------------------------
p = polyfit(xL, f, 2);  % 用 x/L 做横轴拟合
a = p(1); b = p(2); c = p(3);

% 极小值位置（在 x/L 的坐标中）
xL_min = -b / (2*a);
f_min = polyval(p, xL_min);

% --------------------------------------------
% 残差、标准差、3σ 不确定度
% --------------------------------------------
f_fit = polyval(p, xL);
residual = f - f_fit;
sigma = std(residual);     % 标准差
u_f = 3 * sigma;           % 3σ 不确定度

% --------------------------------------------
% 绘图
% --------------------------------------------
figure;
hold on;

% 原始数据点
scatter(xL, f, 60, 'filled');

% 拟合曲线（更平滑）
xL_fit = linspace(min(xL), max(xL), 200);
f_curve = polyval(p, xL_fit);
plot(xL_fit, f_curve, 'LineWidth', 2);

% 极小值点标注
plot(xL_min, f_min, 'ro', 'MarkerSize', 8, 'LineWidth', 1.5);

xlabel('悬挂位置 x / L');
ylabel('共振频率 f / Hz');
title('共振频率随与悬挂位置的变化（二次拟合）');
grid on;

legend('实验数据', '二次拟合曲线', '极小值点', 'Location', 'best');

hold off;

% --------------------------------------------
% 输出结果
% --------------------------------------------
fprintf('二次拟合系数: a = %.6f, b = %.6f, c = %.6f\n', a, b, c);
fprintf('极小值位置 x/L = %.6f\n', xL_min);
fprintf('极小值对应频率 f_min = %.6f Hz\n', f_min);
fprintf('频率标准差 sigma = %.6f Hz\n', sigma);
fprintf('3倍标准差估计不确定度 u_f = %.6f Hz\n', u_f);
