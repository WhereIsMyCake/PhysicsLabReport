% 光调制法测光速（纵轴 S2，横轴 Δt'（s），修正公式）
clear; clc;

% 实验数据（S1,S2 单位 m；dt 表中单位是 10^-9 s）
S1 = [0.0100 0.0100 0.0100 0.0100 0.0100 0.0100];
S2 = [0.0900 0.1700 0.2500 0.3300 0.4100 0.4900];
dt_ns = [117.6 216.3 328.5 449.7 561.9 692.1];   % 数值以 10^-9 s 为单位（ns）

% 常数
v = 100.0e6;      % Hz
vprime = 454.4e3; % Hz

% 单位转换
dt = dt_ns * 1e-9;   % 转为秒

% 线性拟合 S2 = k * dt + b
p = polyfit(dt, S2, 1);
k = p(1); b = p(2);

% 拟合值与残差
S2_fit = polyval(p, dt);
res = S2 - S2_fit;
n = length(dt);

% A类不确定度：斜率的不确定度 u(k)
u_k = sqrt( sum(res.^2) / ((n-2) * sum((dt - mean(dt)).^2)) );

% 根据正确关系计算光速及其不确定度（注意：c = 2*v*k / v'）
c = 2 * v * k / vprime;
u_c = 2 * v / vprime * u_k;

% R^2
S2_mean = mean(S2);
SS_res = sum(res.^2);
SS_tot = sum( (S2 - S2_mean).^2 );
R2 = 1 - SS_res / SS_tot;

% 输出
fprintf('拟合: S2 = %.6e * dt + %.6e\n', k, b);
fprintf('斜率 k = %.6e (m/s)\n', k);
fprintf('斜率不确定度 u(k) = %.6e\n', u_k);
fprintf('光速 c = %.6e m/s\n', c);
fprintf('光速 A类不确定度 u(c) = %.6e m/s\n', u_c);
fprintf('拟合优度 R^2 = %.6f\n', R2);

% 绘图（含残差图）
figure;
dt_fit = linspace(min(dt), max(dt), 200);
plot(dt, S2, 'o','MarkerFaceColor','b'); hold on;
plot(dt_fit, polyval(p, dt_fit), 'r-', 'LineWidth', 1.5);
xlabel('\Delta t'' (s)');
ylabel('S_2 (m)');
title('线性拟合');
legend('数据', '线性拟合', 'Location', 'best');
grid on;


