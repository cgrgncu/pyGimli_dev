# 整理 mesh相關操作
+ 建議用法: 使用資料data來產生mesh並逆推，然後取出mesh。
```python
#--------------------------------------------
# 引入 pygimli 中處理電阻率成像 (ERT) 的 ert 模組
from pygimli.physics import ert
#--------------------------------------------
# 使用 ert.load 載入 "data/lake.ohm" 的 ERT 資料到 'data' 變數
data = ert.load("data/lake.ohm")
#--------------------------------------------
# 1. 讀取資料
print("讀取 .ohm 檔...")
data = ert.load(ohm_file_name)
print("讀取 .ohm 檔...完成!")
print(f"data 物件的類型是: {type(data)}")
print("展示內容:")
print(data)
print("--")
print("計算 k,rhoa,err...")
data['k'] = ert.createGeometricFactors(data, numerical=True)
data['rhoa'] = data['k'] * data['r']
data['err'] = ert.estimateError(data, relativeError=0.03) #找不到data['u']時，變成直接指定為0.03。
print("計算 k,rhoa,err...完成!")
print("--")
print("用data建立ERTManager物件...")
mgr = ert.ERTManager(data)
print("建立ERTManager物件...完成")
print(f"mgr 物件的類型是: {type(mgr)}")
print("--")
if isinstance(mgr.fw, pg.frameworks.inversion.ClassicInversion) and isinstance(mgr.inv, pg.frameworks.inversion.ClassicInversion):
    print("* 使用ClassicInversion類別，是 PyGimli 框架中一個基礎的基於高斯-牛頓法的反演框架。")
    print("* 這是一個舊的框架，預計在1.6.0版以後移除。")
    print("* 它通過迭代的方式來最小化目標函數)。")
    print("* 目標函數包含資料不符項(Data misfit term)和模型正則化項(Model regularization term)。")
    print("* 在每次迭代中，ClassicInversion 會執行以下步驟：")
    print("* 1. 計算模型響應：使用當前模型和前向算子計算預測的資料響應。")
    print("* 2. 計算殘差：比較預測響應和觀測資料之間的差異。")
    print("* 3. 計算雅可比矩陣：評估模型參數對資料響應的敏感度。")
    print("* 4. 構建並求解線性系統：基於雅可比矩陣和殘差，使用高斯-牛頓法的近似來計算模型更新量。")
    print("* 5. 更新模型：將計算得到的更新量應用到當前模型上。")
    print("* 6. 檢查收斂準則：判斷是否滿足停止迭代的條件。")
    print("* 它允許設定正則化參數 (lam)、資料和模型轉換 (dataTrans, modelTrans)、以及迭代控制參數 (maxIter, stopAtChi1) 等。")
else:
    print("不確定的逆推類別...")
print("--")
#print(mgr.data) #這就是我丟進去的資料
print("--")
#mgr.debug=True
if mgr.debug:
    print(f"mgr.debug : {mgr.debug}，表示目前開啟除錯訊息。")
else:
    print(f"mgr.debug : {mgr.debug}，表示目前關閉除錯訊息。")
print("--")
if mgr.errIsAbsolute:
    print(f"mgr.errIsAbsolute : {mgr.errIsAbsolute}，表示目前使用絕對誤差。")
else:
    print(f"mgr.errIsAbsolute : {mgr.errIsAbsolute}，表示目前使用相對誤差百分比。")
print("--")
#mgr.verbose=True
if mgr.verbose :
    print(f"mgr.verbose  : {mgr.verbose }，表示目前使用較多資訊的訊息輸出。")
else:
    print(f"mgr.verbose  : {mgr.verbose }，表示目前使用較少資訊的訊息輸出。")
print("--")
#mgr.useBert=False
if mgr.useBert :
    print(f"mgr.useBert  : {mgr.useBert }，表示目前使用Boundless Electrical Resistivity Tomography,BERT。通常BERT在處理複雜幾何或需要更高精度時可能更有效")
else:
    print(f"mgr.useBert  : {mgr.useBert }，表示目前不是使用Boundless Electrical Resistivity Tomography,BERT。通常BERT在處理複雜幾何或需要更高精度時可能更有效")
print("--")
#mgr.sr=False
if mgr.sr :
    print(f"mgr.sr  : {mgr.sr }，表示啟用奇異性移除 (singularity removal) 技術。這個技術通常可以提高計算精度。")
else:
    print(f"mgr.sr  : {mgr.sr }，表示禁用奇異性移除 (singularity removal) 技術。這個技術通常可以提高計算精度。")
print("--")

print("--")
if mgr.mesh is None:
    print("mgr.mesh 的值是 None，表示它沒有指向任何網格物件。")
else:
    print("mgr.mesh 的值不是 None，它可能指向一個網格物件。")
    print(f"mgr.mesh 的類型是: {type(mgr.mesh)}")
print("--")
try:
    mgr.paraDomain
except Exception as e:
    print(f"訪問 mgr.paraDomain 時發生錯誤: {e}")
print("--")
try:
    mgr.model
except Exception as e:
    print(f"訪問 mgr.model 時發生錯誤: {e}")
print("--")

#help(mgr.invert)
mgr.invert(data)

```
