import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import FormatStrFormatter

# 设置中文字体，避免乱码
plt.rcParams['font.sans-serif'] = ['SimHei']   # 或 ['Microsoft YaHei']
plt.rcParams['axes.unicode_minus'] = False     # 解决负号显示为方块的问题

# =============================
# 数据输入
# =============================

# 轴向距离 x (cm)
x1 = [-12.00, -11.00, -10.00, -9.00, -8.00, -7.00, -6.00, -5.00, -4.00, -3.00, -2.00, -1.00]
x2 = [0.00, 1.00, 2.00, 3.00, 4.00, 5.00, 6.00, 7.00, 8.00, 9.00, 10.00, 11.00, 12.00]

x = np.array(x1 + x2)

# 实测平均磁感应强度 B (μT)
B1 = [266, 309, 360, 417, 484, 556, 638, 722, 808, 882, 945, 985]
B2 = [998, 981, 936, 872, 794, 707, 625, 546, 472, 407, 351, 301, 261]

B = np.array(B1 + B2)

# 理论磁感应强度 B_x (μT)
Bx1 = [263.764, 305.993, 355.431, 413.455, 481.352, 554.347, 639.132, 723.425, 
       809.160, 883.406, 945.128, 985.293]
Bx2 = [997.914, 980.640, 936.441, 873.055, 795.440, 719.341, 626.474, 545.113, 
       473.613, 407.945, 350.821, 299.979, 260.997]

Bx = np.array(Bx1 + Bx2)

# =============================
# 绘图部分
# =============================

plt.figure(figsize=(8,6))

plt.plot(x, B, 'o-', color="blue", label="实验测得平均 B (μT)")
plt.plot(x, Bx, 's--', color="red", label="理论值 $B_x$ (μT)")

plt.xlabel("轴向距离 x (cm)", fontsize=12)
plt.ylabel("磁感应强度 B (μT)", fontsize=12)
plt.title("单个直流圆线圈的轴向磁场强度分布", fontsize=14)


# 设置横纵坐标刻度精度
plt.gca().xaxis.set_major_formatter(FormatStrFormatter('%.2f'))  # x 保留两位小数
plt.gca().yaxis.set_major_formatter(FormatStrFormatter('%.0f'))  # y 取整数


plt.legend()
plt.grid(True, linestyle="--", alpha=0.6)
plt.tight_layout()
plt.show()
