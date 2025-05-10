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
  # 因為我已經知道是ohm檔案，其實就只是呼叫以下:
  data = pg.DataContainerERT("data/lake.ohm")
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

## 高程對電阻率成像幾何因子的影響

當電阻率成像 (ERT) 調查區域存在**高程變化**（地形起伏）時，傳統的幾何因子公式（通常假設電極位於平坦的地表上）計算出來的數值將**不再完全準確**。

### 高程影響的原因

高程的存在會導致實際的電流和電位分佈與平坦地表模型有所不同，主要影響包括：

* **電極間的真實距離：** 傳統公式使用水平距離，而實際地表上的電極間距離（考慮高程差）會更長。
* **電流路徑的改變：** 地形起伏會引導地下電流的流動路徑，使其不再是簡單的半空間擴散。
* **電位分佈的扭曲：** 高程變化會改變地表的電位分佈，使得相同水平位置的電位值與平坦地表模型不同。

### 處理高程影響的方法

為了獲得更準確的幾何因子，需要考慮高程的影響。常見的方法包括：

1.  **使用更複雜的幾何因子公式：** 針對簡單地形的解析公式存在，但對於複雜地形通常不適用。
2.  **數值模擬：** 使用有限元素法或有限差分法等數值方法，建立包含地形信息的三維模型，模擬電流和電位分佈，從而計算幾何因子。
3.  **近似校正：** 對於較小的地形起伏，可以嘗試使用基於真實地表距離或地形坡度的近似校正方法。

### PyGIMLi 的處理

**PyGIMLi** 能夠處理包含高程信息的 ERT 資料。當您提供包含電極三維坐標 (x, y, z) 的資料時，PyGIMLi 的幾何因子計算功能會自動考慮電極之間的高程差異，提供更準確的幾何因子，而無需使用者手動使用平面公式計算。

### 總結

高程變化是影響 ERT 幾何因子的重要因素。在地形起伏明顯的區域進行 ERT 調查時，必須考慮高程的影響以獲得可靠的視電阻率數據。數值模擬和使用能夠處理三維電極坐標的專業軟體（如 PyGIMLi）是處理高程影響的有效方法。

## 大幾何因子、量測難度與探測深度

普遍來說，當電阻率成像 (ERT) 調查的**幾何因子 (K) 較大**時，會呈現以下權衡關係：

* **電流擴散較大：** 更大的電極展距或特定的電極排列會導致注入地下的電流擴散到更廣泛和更深的體積。

* **量測到的電壓會更小：** 由於電流分散在更大的區域，單位體積內的電流密度降低，導致在接收電極處測量到的電位差通常會減小。

* **導致更難以準確觀測：** 較小的電壓信號更容易受到以下因素的影響，使得準確量測微弱的電壓變化變得更加困難：
    * 儀器自身的噪聲
    * 接觸電阻的波動
    * 環境中的電磁干擾

* **可探測更深的地下構造：** 然而，更大的電流擴散範圍和更寬的電極間距使得電流能夠更深地穿透地下，因此測量結果對深部地層的電阻率結構更為敏感，從而實現對更深地下構造的探測。

**總結：工程上的權衡**

ERT 調查設計常常需要在探測深度和數據品質之間進行權衡：

* **為了獲取深部信息 (大 K 值)：** 通常需要使用更大的電極展距，這會導致更大的幾何因子和更小的量測電壓，增加了量測的難度和對儀器精度的要求。

* **為了獲得精確淺部信息 (小 K 值)：** 可以使用較小的電極展距，這對應著較小的幾何因子和較大的量測電壓，但探測深度有限。

因此，地球物理學家在設計 ERT 調查時，必須根據研究目標、預期地電結構、儀器性能和現場條件等因素，仔細選擇合適的電極排列方式和展距，以實現探測深度和數據品質的最佳平衡。高精度的儀器和有效的降噪技術對於在大 K 值情況下獲取可靠的深部數據至關重要。
+ 計算幾何因子
  + 使用地形進行數值模擬：
  ```python
  data['k'] = ert.createGeometricFactors(data, numerical=True)
  ```
  + 使用傳統公式計算：
  ```python
  data['k'] = ert.createGeometricFactors(data, numerical=False)
  ```
  + 以上二擇一
+ 進一步計算視電阻率
  ```python
  data['rhoa'] = data['k'] * data['r']
  ```

### 誤差ERR
+ 儀器量測的供參考，但不適合放入逆推中。
  + 取代方式1:指定誤差都是3%
  ```  print("呼叫ERT工具，指定逆推使用的誤差...")
  #--
  # 參考: https://github.com/gimli-org/transform2022/blob/main/2_Lake.ipynb
  # The data are measured standard devitations and should not be used for inversion. Instead, we estimate new errors.
  # 我的理解:
  # 目前的資料誤差欄位(err)是根據「量測標準差」填入的，不適合直接用來反演。
  # 因為量測標準差不一定能反映真實誤差，特別是在現場條件不佳或系統誤差存在時。
  # 所以我們應該自行估算一組新的誤差值，用於反演中的加權矩陣。
  # 實作:
  # 如果觀測資料有err欄位，通常建議不要採用。
  # 若存在u資料(電壓資料，單位:[V])，則可以利用: data["err"] = ert.estimateError(data, relativeError=0.02, absoluteUError=100e-6)
  # 若沒有，則直接給定一個誤差值。建議0.03，或稱3%。
  #--
  # Estimate relative error
  data['err'] = ert.estimateError(data, relativeError=0.03) #找不到data['u']時，變成直接指定為0.03。
  print("呼叫ERT工具，指定逆推使用的誤差...完成!")
  print("--")
  print("展示追加後的資料欄位:")
  print(data)
  print("--")
  print("展示誤差誤差統計資訊：")
  print(f"  最小值: {np.array(data['err']).min():.2f}")
  print(f"  最大值: {np.array(data['err']).max():.2f}")
  print(f"  平均值: {np.array(data['err']).mean():.2f}")
  print("--")
  ```
### 準備逆推要用的最少量資料
+ 至少要有類似這樣的欄位:
  ```python
  print(data)
  # Data: Sensors: 65 data: 26267, nonzero entries: ['a', 'b', 'err', 'k', 'm', 'n', 'r', 'rhoa', 'valid']
  ```

+ 跑逆推
  ```python
  data['k'] = ert.createGeometricFactors(data, numerical=True)
  data['rhoa'] = data['k'] * data['r']
  data['err'] = ert.estimateError(data, relativeError=0.03) #找不到data['u']時，變成直接指定為0.03。
  mgr = ert.ERTManager(data)
  #help(mgr.invert)
  print('*****')
  mgr.invert(data)
  #mgr.showResult();
  mgr.showResult(cMin=2, cMax=200, xlabel="x (m)", ylabel="z (m)");
  mgr.showFit();
  ```




---

### PyGIMLi 反演關鍵參數總結

在 PyGIMLi 中進行地球物理反演時，您可以透過傳遞不同的參數來控制反演過程、正則化方式以及結果的呈現。這些參數通常在呼叫反演管理器的 `invert()` 方法或反演框架實例的 `run()` 方法時設定。

以下是一些主要的參數類別及其包含的參數說明：

#### 1. 基本輸入參數

* `data`: 觀測到的地球物理數據，通常為 `pygimli.DataContainer` 物件。
* `mesh`: 定義反演模型空間的網格。對於基於網格的方法（如 ERT），網格結構至關重要。
* `startModel`: 反演過程的起始模型。可以是單一數值（代表均勻模型）或與模型單元數量相符的陣列。提供一個好的起始模型有助於反演快速收斂。

#### 2. 反演算法控制參數

* `maxIter`: **最大迭代次數**。限制反演算法執行的迭代步驟上限。
* `minDPhi` (或 `dPhi`): **收斂準則**。定義目標函數相對變化的百分比閾值。當連續兩次迭代的目標函數相對變化小於此值時，反演可能終止。
* `stopAtChi1`: **$\chi^2 \le 1$ 終止準則**。布林值。若設為 `True`，當誤差加權的數據 misfit ($\chi^2$) 達到或小於 1 時，反演停止。表示模型預測的數據與觀測數據在誤差允許範圍內一致。

#### 3. 正則化控制參數 (Regularization Parameters)

這些參數用於引入先驗信息，解決地球物理反演的非唯一性和不適定性問題，引導模型趨向於地質上合理的解。

* `lam` (或 `lambda`): **正則化強度** ($\lambda$)。最重要的正則化參數，平衡數據擬合與模型約束。值越大，正則化越強，模型越平滑/簡單；值越小，越傾向於擬合數據，模型可能越複雜。
* `cType`: **約束/正則化類型**。一個整數，定義如何衡量模型的“粗糙度”或偏離預期性質的程度。常見值：
    * `0`: Damping (阻尼)。
    * `1`: First-order smoothness (一階平滑) - **預設值**。
    * `2`: Second-order smoothness (二階平滑)。
    * `4` 或 `-1`: Focusing (聚焦) / 最小梯度幅度。
    * `5` 或 `-2`: Total Variation (TV)。
    * `10`: Mixed first-order smoothness and damping (混合一階平滑和阻尼)。
* `zWeight`: **垂直方向平滑約束相對權重**。調整垂直方向相對於水平方向的平滑程度（**預設值為 1.0**）。`< 1` 減弱垂直平滑（適合水平地層）；`> 1` 加強垂直平滑（適合垂直構造）。
* `correlationLengths`: **地質統計相關長度**。用於地質統計正則化，指定模型參數在不同空間方向上的相關距離。通常為列表/元組，如 2D 中的 `[水平長度, 垂直長度]`。
* `dip`, `strike`: **模型空間旋轉角度**。在 2D 反演中通常不作為反演參數，而是用於在反演前根據先驗地質知識**預先旋轉**模型網格。
* `isReference`: **參考模型約束**。布林值。若為 `True`，則將 `startModel` 作為參考模型，反演結果會被約束以接近此參考模型。
* `robustData`: **魯棒數據加權**。布林值。若為 `True`，使用類似 L1 範數的方法處理數據 misfit，對異常值較不敏感。
* `blockyModel`: **魯棒模型加權**。布林值。若為 `True`，使用類似 L1 範數的方法處理模型粗糙度，傾向於生成具有更銳利邊界的塊狀模型。

#### 4. 誤差參數

用於提供數據的誤差信息，誤差加權在反演中非常重要。

* `errorVals`: **數據誤差向量**。通常是每個數據點的相對或絕對誤差陣列。
* `absoluteError`: **絕對誤差**。單一數值或向量。
* `relativeError`: **相對誤差**。單一數值或向量。（通常只需提供 `errorVals`，或 `absoluteError`/`relativeError` 其中之一或組合）。

#### 5. 轉換參數

用於在反演過程中對數據或模型參數進行數學轉換。

* `dataTrans`: **數據轉換類型**。字串 (e.g., `"log"`, `"linear"`)。常用的有對數轉換，以處理量級差異較大的數據。
* `modelTrans`: **模型轉換類型**。字串 (e.g., `"log"`, `"linear"`, `"cot"`)。常用的有對數轉換，以確保模型參數為正值。

#### 6. 輸出與除錯參數

控制反演過程的輸出信息和可視化。

* `verbose`: **詳細輸出**。布林值。若為 `True`，在控制台輸出詳細的反演進度、參數信息等。
* `debug`: **除錯模式**。布林值。若為 `True`，輸出比 `verbose` 更多的除錯信息，有助於診斷問題。
* `showProgress`: **顯示迭代進度**。布林值。若為 `True`，可能會在反演過程中可視化顯示迭代更新的模型或擬合度（具體實現可能因管理器而異）。

**總結：**

理解並適當調整這些參數是成功進行地球物理反演的關鍵。對於初學者來說，最常用的參數是 `lam`、`cType` 和設置數據誤差。隨著經驗的增加，您可以開始嘗試調整 `zWeight`、`correlationLengths` 以及魯棒加權等參數，以獲得更符合您地質預期和數據特點的反演結果。記住，所有這些參數的設置都應該基於您對研究區域的地質背景、數據質量以及反演目標的理解。

---
