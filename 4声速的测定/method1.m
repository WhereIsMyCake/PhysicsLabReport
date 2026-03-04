% --- 驻波法数据处理 (Standing Wave Method) ---

% 1. 输入数据 (单位: cm)
n = [1, 2, 3, 4, 5, 6, 7, 8]'; % 节点序号 (作为 x 轴)
Ln = [30.161, 34.272, 39.688, 42.900, 48.416, 52.197, 55.919, 61.121]'; % 接收器位置 (作为 y 轴)

% 2. 最小二乘法线性拟合 (使用 polyfit)
% 拟合多项式 y = p1*x + p2，其中 p1 即为斜率 B
p = polyfit(n, Ln, 1);
slope_half_lambda = p(1); % 斜率 B = p1 = lambda/2
intercept = p(2);      % 截距 = p2

% 3. 计算结果
half_lambda_cm = slope_half_lambda;
lambda_cm = 2 * half_lambda_cm;
lambda_m = lambda_cm / 100;
f = 40000; % 频率 (Hz)
v = f * lambda_m;

% 4. 绘图和可视化
figure(1);
scatter(n, Ln, 'filled', 'DisplayName', '测量数据点'); % 绘制数据点
hold on;
plot(n, polyval(p, n), 'r-', 'LineWidth', 1.5, 'DisplayName', ['拟合直线: y = ' num2str(p(1), '%.4f') 'x + ' num2str(p(2), '%.4f')]);
xlabel('节点 n');
ylabel('位置 L_n (mm)');
title('驻波法');
legend('show', 'Location', 'northwest');
grid on;
hold off;

% 5. 输出结果
disp('--- 驻波法结果 ---');
fprintf('拟合斜率 (λ/2) = %.4f cm\n', half_lambda_cm);
fprintf('波长 (λ) = %.4f cm = %.6f m\n', lambda_cm, lambda_m);
fprintf('声速 v = %.2f m/s\n', v);