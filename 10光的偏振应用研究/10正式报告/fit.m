% 数据输入
beta = [68.0 78.0 88.0 98.0 108.0 118.0 128.0 138.0];
i = [307 297 273 231 186 130.9 81.8 38.7];

% 偏振片零偏
beta0 = 69.2;

% 计算φ与cos^2φ
phi = beta - beta0;
cos2phi = cosd(phi).^2;

% 做线性拟合 i = a * cos^2φ + b
p = polyfit(cos2phi, i, 1);

% 拟合直线
x_fit = linspace(min(cos2phi), max(cos2phi), 200);
y_fit = polyval(p, x_fit);

% 绘图
figure;
scatter(cos2phi, i, 70, 'filled'); hold on;
plot(x_fit, y_fit, 'LineWidth', 2);

% 图形美化
xlabel('cos^2 \phi ');
ylabel('光电流 i (\muA)');
title('光电流 i 与 cos^2 \phi 的关系');
grid on;


