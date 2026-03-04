import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import FormatStrFormatter

# 设置中文字体，避免乱码
plt.rcParams['font.sans-serif'] = ['SimHei']   # 黑体
plt.rcParams['axes.unicode_minus'] = False     # 负号正常显示

# =============================
# 亥姆霍兹线圈实验数据
# =============================

# 轴向距离 x (cm)
x1 = [-12.00, -11.00, -10.00, -9.00, -8.00, -7.00, -6.00, -5.00, -4.00, -3.00, -2.00, -1.00]
x2 = [  0.00,   1.00,   2.00,   3.00,   4.00,   5.00,   6.00,   7.00,   8.00,   9.00,  10.00,  11.00,  12.00]
x = np.array(x1 + x2)

# 平均磁感应强度 B (μT)
B1 = [695, 798, 906, 1015, 1121, 1224, 1304, 1367, 1408, 1430, 1441, 1443]
B2 = [1444, 1443, 1438, 1424, 1398, 1350, 1280, 1192, 1089, 978, 866, 765, 668]
B = np.array(B1 + B2)

# =============================
# 绘图部分
# =============================

plt.figure(figsize=(8,6))

plt.plot(x, B, 'o-', color="blue", label="实验测得平均 B (μT)")

plt.xlabel("轴向距离 x (cm)", fontsize=12)
plt.ylabel("磁感应强度 B (μT)", fontsize=12)
plt.title("亥姆霍兹线圈的轴向磁场强度分布", fontsize=14)

# 设置横纵坐标刻度精度
plt.gca().xaxis.set_major_formatter(FormatStrFormatter('%.2f'))  # 横坐标两位小数
plt.gca().yaxis.set_major_formatter(FormatStrFormatter('%.0f'))  # 纵坐标整数

plt.legend()
plt.grid(True, linestyle="--", alpha=0.6)
plt.tight_layout()
plt.show()
