import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import FormatStrFormatter

# 设置中文字体，避免乱码
plt.rcParams['font.sans-serif'] = ['SimHei']   # 黑体
plt.rcParams['axes.unicode_minus'] = False     # 负号正常显示

# =============================
# 数据输入
# =============================

# 径向距离 y (cm)
y = np.array([-5.00, -4.00, -3.00, -2.00, -1.00, 
               0.00,  1.00,  2.00,  3.00,  4.00,  5.00])

# 实测平均磁感应强度 B (μT)
B = np.array([1216, 1124, 1063, 1021, 1004, 
              998, 1007, 1032, 1078, 1152, 1259])

# =============================
# 绘图部分
# =============================

plt.figure(figsize=(8,6))

plt.plot(y, B, 'o-', color="blue", label="实验测得平均 B (μT)")

plt.xlabel("径向距离 y (cm)", fontsize=12)
plt.ylabel("磁感应强度 B (μT)", fontsize=12)
plt.title("单个直流圆线圈的径向磁场强度分布", fontsize=14)

# 设置横纵坐标刻度精度
plt.gca().xaxis.set_major_formatter(FormatStrFormatter('%.2f'))  # y 轴坐标保留两位小数
plt.gca().yaxis.set_major_formatter(FormatStrFormatter('%.0f'))  # B 整数显示

plt.legend()
plt.grid(True, linestyle="--", alpha=0.6)
plt.tight_layout()
plt.show()
