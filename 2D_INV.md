# 2D ERT 逆推

### 先載入資料
+ 目前針對.ohm檔案。使用最少量的資訊，包含a b m n r，以及有地形的電極位置。
+ 參考: https://github.com/gimli-org/transform2022/blob/main/2_Lake.ipynb
  + 這裡有提供範例檔案及示範如何載入資料。
  ```python
  # 預設呼叫方法，寫在importData.py中，其實是去呼叫pg.load
  data = ert.load("data/lake.ohm")
  print(f"data 物件的類型是: {type(data)}")
  # ohm檔案是pygimli統一支援的檔案格式，可用load函數載入為ERT資料(pg.DataContainerERT)
  # 預設統一呼叫方法
  data = pg.load("data/lake.ohm")
  print(f"data 物件的類型是: {type(data)}")
  # 等價的呼叫方法
  data = pg.load("data/lake.ohm", verbose=False, testAll=True, realName=None)
  print(f"data 物件的類型是: {type(data)}")
  # 以上方法擇一即可
  ```
  
+ 可以用ert.show 來繪圖
  ```python
  # 預設呼叫方法
  ert.show(data)
  # 等價於以下寫法
  ax, cbar = ert.show(
      data,                        # 必須的參數：DataContainerERT 物件
      vals='rhoa',                 # 預設值：要繪製的數據欄位名稱，預設是 'rhoa'（電阻率）
      logScale=False,              # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      label='Apparent resistivity (Ωm)',                  # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
  ```
+ 如果想存成圖檔
  ```python
  # 使用 ert.show() 來顯示 rhoa（視電阻率），並自動決定色階範圍
  ax, cbar = ert.show(
        data,                        # 必須的參數：DataContainerERT 物件
        vals='rhoa',                 # 預設值：要繪製的數據欄位名稱，預設是 'rhoa'（電阻率）
        logScale=False,              # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
        label='Apparent resistivity (Ωm)',                  # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
        xlabel=None,                 # 預設值：x 軸標籤
        ylabel=None                  # 預設值：y 軸標籤
    )
  # 確保是座標軸對象，並加入標題與軸標籤
  ax.set_title("視電阻率分佈圖", fontsize=14)
  ax.set_xlabel("水平距離 (m)")
  # 不用科學記號的 colorbar 數值
  from matplotlib.ticker import ScalarFormatter
  cbar.ax.xaxis.set_major_formatter(ScalarFormatter(useMathText=False))
  cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
  # 保存為圖檔（如 PNG 格式）
  fig = ax.get_figure()  # 取得對應的 figure 物件
  fig.savefig("AppRes_distribution.png", dpi=300, bbox_inches='tight')  # 儲存為 PNG 檔案，300 dpi，緊密邊框
  plt.close(fig)  # 不顯示圖形
  ```
+ 可以用data.save 來存出ohm檔案
  ```python
  data.save("my_data.ohm")
  ```
### 幾何因子(Geometric Factor, K)
+ 幾何因子用於將測量的電阻 (R) 轉換為視電阻率 ($\rho_a$)，其基本公式為：

$$\rho_a = K \cdot R = K \cdot \frac{V}{I}$$

其中：
- $\rho_a$ 是視電阻率[ohm-m]
- $K$ 是幾何因子[m]
- $R$ 是測量的電阻[ohm]
- $V$ 是測量的電位差[V]
- $I$ 是注入地下的電流[A]

幾何因子的具體公式取決於所使用的電極排列方式。以下是一些常見排列方式的幾何因子公式：

### 常見電極排列的幾何因子公式

**1. 廣義四極排列 (General Four-Electrode Array):**

對於地表上的電流電極 A 和 B，以及電位電極 M 和 N，幾何因子 K 的通用公式為：

$$K = 2\pi \left( \frac{1}{AM} - \frac{1}{AN} - \frac{1}{BM} + \frac{1}{BN} \right)^{-1}$$

其中 AM、AN、BM 和 BN 分別是電極 A 到 M、A 到 N、B 到 M 和 B 到 N 之間的距離。

**重要注意事項：** 當任意兩個電極之間的距離為零時，上述公式會產生奇異值，此時的電極配置不再屬於典型的廣義四極排列，應根據實際的電極配置（例如三極或兩極排列）採用其他適用的公式。距離為零的測量數據通常也應被視為無效或需要特殊處理。

**2. 溫納排列 (Wenner Array - α 型):**

對於等距排列在一直線上的四個電極 A-M-N-B，電極間距為 $a$，幾何因子為：

$$K = 2\pi a$$

**3. 施倫貝格爾排列 (Schlumberger Array):**

電流電極 AB 對稱佈置，電位電極 MN 對稱佈置於中心，且 MN << AB。令 AB 間距為 $L$，MN 間距為 $l$，則幾何因子為：

$$K = \pi \frac{L^2 - l^2}{2l}$$

當 $l \ll L$ 時，近似為：

$$K \approx \pi \frac{L^2}{2l}$$

**4. 偶極-偶極排列 (Dipole-Dipole Array):**

兩個偶極 AB 和 MN 相距 $na$，每個偶極的電極間距為 $a$，電極通常沿直線排列。幾何因子為：

$$K = \pi n(n+1)(n+2) a$$

### 總結

了解不同電極排列方式對應的幾何因子公式是正確解釋 ERT 數據的基礎。在實際應用中，儀器通常會自動計算這些因子。對於特殊情況，例如電極距離為零，需要特別注意並採用適當的處理方法。
### 準備逆推要用的最少量資料
+ 
