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
### 準備逆推要用的最少量資料
+ 
