# 2D ERT 逆推

### 先載入資料
+ 目前針對.ohm檔案。使用最少量的資訊，包含a b m n r，以及有地形的電極位置。
+ 參考: https://github.com/gimli-org/transform2022/blob/main/2_Lake.ipynb
  + 這裡有提供範例檔案及示範如何載入資料。
  ```
  ```
+ 可以用ert.show(data, vals='rhoa', logScale=True, circular=True) 來繪圖
  + 可是circular效果不是很好，最好別用
  ```python
  # 預設呼叫方法
  ert.show(data)
  # 等價於以下寫法
  ax, cbar = ert.show(
      data,                        # 必須的參數：DataContainerERT 物件
      vals='rhoa',                 # 預設值：要繪製的數據欄位名稱，這裡是 'rhoa'（電阻率）
      x='a',                       # 預設值：x 軸對應的電極，這裡是 'a'（源電極）
      y='m',                       # 預設值：y 軸對應的電極，這裡是 'm'（測量電極）
      style='ab-mn',               # 預設值：樣式，這裡選擇 'ab-mn'，意思是使用源電極和測量電極的各種組合
      logScale=True,               # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      cMap=None,                   # 預設值：顏色映射（使用 'rhoa' 的預設顏色映射）
      label=None,                  # 預設值：數據欄位的標籤，默認使用欄位的單位
      switchxy=False,              # 預設值：是否交換 x 和 y 軸
      equidistant=False,           # 預設值：是否使用等距的電極位置
      showTopo=False,              # 預設值：是否顯示地形
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
  ```
### 準備逆推要用的最少量資料
+ 
