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
  + 我覺得circular效果不是很好，最好別用。
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
### 準備逆推要用的最少量資料
+ 
