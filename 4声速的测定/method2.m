% --- 相位差法数据处理 (Phase Difference Method) ---

% 1. 输入数据 (单位: cm)
n = [0, 1, 2, 3, 4, 5, 6, 7]'; % 同相/反相位置序号 (作为 x 轴)
L_prime_n = [60.693, 65.338, 69.309, 74.101, 77.932, 82.519, 87.113, 90.910]'; % 接收器位置 (作为 y 轴)

% 2. 最小二乘法线性拟合 (使用 polyfit)
% 拟合多项式 y = p1*x + p2，其中 p1 即为斜率 B'
p_prime = polyfit(n, L_prime_n, 1);
slope_half_lambda_prime = p_prime(1); % 斜率 B' = p1 = lambda/2
intercept_prime = p_prime(2);      % 截距 = p2

% 3. 计算结果
half_lambda_cm_prime = slope_half_lambda_prime;
lambda_cm_prime = 2 * half_lambda_cm_prime;
lambda_m_prime = lambda_cm_prime / 100;
f = 40000; % 频率 (Hz)
v_prime = f * lambda_m_prime;

% 4. 绘图和可视化
figure(2); % 使用第二个图窗
scatter(n, L_prime_n, 'filled', 'DisplayName', '测量数据点'); % 绘制数据点
hold on;
plot(n, polyval(p_prime, n), 'r-', 'LineWidth', 1.5, 'DisplayName', ['拟合直线: y = ' num2str(p_prime(1), '%.4f') 'x + ' num2str(p_prime(2), '%.4f')]);
xlabel('相位 n(π)');
ylabel('位置 L_n (cm)');
title('相位差法');
legend('show', 'Location', 'northwest');
grid on;
hold off;

% 5. 输出结果
disp('--- 相位差法结果 ---');
fprintf('拟合斜率 (λ/2) = %.4f cm\n', half_lambda_cm_prime);
fprintf('波长 (λ) = %.4f cm = %.6f m\n', lambda_cm_prime, lambda_m_prime);
fprintf('声速 v = %.2f m/s\n', v_prime);