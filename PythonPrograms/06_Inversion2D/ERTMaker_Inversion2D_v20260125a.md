# Inversion2D(ERTMaker_Inversion2D_v20260125a.py)
+ 作者: HsiupoYeh
+ 更新日期: 2026-01-27

### 版本
+ ERTMaker_Inversion2D_v20260125a.py

### 開發環境
+ Windows 10
+ 使用Lite_PyGimli_Env (pygimli==1.5.4)
  + https://github.com/cgrgncu/pyGimli_dev/releases/tag/Lite_PyGimli_Env
+ 測試位置:
```
\Lite_PyGimli_Env\PythonEnv\
\Lite_PyGimli_Env\ERTMaker_Inversion2D_v20260125a\Input_ERTMaker_StgToUrf\Inversion2D.json
\Lite_PyGimli_Env\ERTMaker_Inversion2D_v20260125a\ERTMaker_Inversion2D_v20260125a.py
\Lite_PyGimli_Env\ERTMaker_Inversion2D_v20260125a\RUN_ERTMaker_Inversion2D_v20260125a.bat
```
+ 也可以放一些必要的輸入範例檔案(並非每個都有用到):
```

```
+ 呼叫方式: 運行「RUN_ERTMaker_Inversion2D_v20260125a.bat」檔案，檔案內容:
```batch
..\PythonEnv\Python.exe RUN_ERTMaker_Inversion2D_v20260125a.py
PAUSE
```
### 主程式(ERTMaker_Inversion2D_v20260125a.py)
+ 設定檔(Inversion2D.json):
```json
{
"Inversion2D_Version":"v20260125a",
"Inversion2D_Author":"HsiupoYeh",
"InputFile01_Ohm_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile01_Ohm_FileName":"Input_ERTMaker_Inversion2D/XP1_SyntheticModel_R00_L01_I00_CalData.dat",
"Mesh_Setting01_AutoMesh_Enable_Readme":"逆推參數-使用自動三角網格。若要啟用請填入字串Yes，若不啟用請填入字串No。若啟用則使用自動產生三角網格，不會讀取VTK檔案與JSON檔案。",
"Mesh_Setting01_AutoMesh_Enable":"Yes",
"Mesh_Setting02_AutoMesh_quality_Readme":"逆推參數-設定自動三角網格的網格品質。控制不要讓三角形太扁長。預設值:32，建議填入32.0~34.0之間的浮點數。此設定只有啟用自動網格才會有效。",
"Mesh_Setting02_AutoMesh_quality":32,
"Mesh_Setting03_AutoMesh_paraDepth_Readme":"逆推參數-設定自動三角網格的研究區域內最大深度。預設值:-1，單位:[m]，設定小於0的數字會自動設定為測線電極X方向長度的0.4倍。此設定只有啟用自動網格才會有效。",
"Mesh_Setting03_AutoMesh_paraDepth":-1,
"Mesh_Setting04_AutoMesh_boundary_Readme":"逆推參數-設定自動三角網格的外邊界倍數。預設值:-1，建議填入4~10之間的整數，設定小於4的數字仍會強制設定為4。此設定只有啟用自動網格才會有效。",
"Mesh_Setting04_AutoMesh_boundary":-1,
"Mesh_Setting05_AutoMesh_paraMaxCellSize_Readme":"逆推參數-設定自動三角網格的網格面積上限。單位:[m^2]。預設值:0，表示自動決定。此設定只有啟用自動網格才會有效。",
"Mesh_Setting05_AutoMesh_paraMaxCellSize":0,
"Mesh_Setting06_AutoMesh_addNodes_Readme":"逆推參數-設定自動三角網格的網格地表電極之間的節點數量。預設值:1。限制填入正整數。此值填「1」時無效果，改由paraDX決定增加的方式；填其他正整數則線性均勻增加兩個電極之間的節點數量。此設定只有啟用自動網格才會有效。",
"Mesh_Setting06_AutoMesh_addNodes":1,
"Mesh_Setting07_AutoMesh_paraDX_Readme":"逆推參數-設定自動三角網格的網格地表電極之間的節點數量。預設值:1。限制填入浮點數。僅有addNodes小於等於1的時候有效。此值大於等於0.5時，等於在兩個電極正中間增加一個節點。小於0.5的時候，在每個電極的左右兩邊各增加一個節點，距離是電極間距乘以此浮點數。此設定只有啟用自動網格才會有效。",
"Mesh_Setting07_AutoMesh_paraDX":1,
"InputFile02_MeshVTK_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile02_MeshVTK_FileName":"Input_ERTMaker_Inversion2D/XP1_SyntheticModel.vtk",
"InputFile03_MeshBCMarkersJSON_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile03_MeshBCMarkersJSON_FileName":"Input_ERTMaker_Inversion2D/XP1_SyntheticModelBCMarkers.json",
"Data_Setting00_RecalculateDataMode_Readme":"逆推參數-重新計算觀測資料方式。預設值:「r」。可填選項:「r」、「rhoa」。",
"Data_Setting00_RecalculateDataMode":"r",
"Data_Setting01_Relative_Error_Percentage_Readme":"逆推參數-資料預估相對誤差百分比，單位:[%]。用於建構目標函數，野外蒐集的資料品質好的推薦使用3[%]，若品質不好則考慮增加。",
"Data_Setting01_Relative_Error_Percentage":1,
"Data_Setting02_GeometricFactorByMesh_Enable_Readme":"逆推參數-幾何因子計算。若要啟用(使用網格計算數值解)請填入字串Yes，若不啟用(使用解析解公式計算)請填入字串No。建議僅有水平地層可以不啟用。",
"Data_Setting02_GeometricFactorByMesh_Enable":"Yes",
"IdealGeometricFactorByFile_Enable_Readme":"理想幾何因子計算網格-使用檔案內的幾何因子。若要啟用請填入字串Yes，若不啟用請填入字串No。若啟用則讀取指定檔名的dat檔案，略過理想幾何因子計算。",
"IdealGeometricFactorByFile_Enable":"Yes",
"InputFile04_IdealGeometricFactorByFile_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile04_IdealGeometricFactorByFile_FileName":"Input_ERTMaker_Inversion2D/XP1_SyntheticModel_Ideal_K.dat",
"IdealGeometricFactor_Setting01_AutoMesh_Enable_Readme":"理想幾何因子計算網格-使用三角網格。若要啟用請填入字串Yes，若不啟用請填入字串No。若啟用則使用自動產生三角網格，不會讀取VTK檔案與JSON檔案。",
"IdealGeometricFactor_Setting01_AutoMesh_Enable":"Yes",
"IdealGeometricFactor_Setting02_AutoMesh_quality_Readme":"理想幾何因子計算網格-設定三角網格的網格品質。控制不要讓三角形太扁長。預設值:32，建議填入32.0~34.0之間的浮點數。此設定只有啟用自動網格才會有效。",
"IdealGeometricFactor_Setting02_AutoMesh_quality":33.4,
"IdealGeometricFactor_Setting03_AutoMesh_paraDepth_Readme":"理想幾何因子計算網格-設定三角網格的研究區域內最大深度。預設值:-1，單位:[m]，設定小於0的數字會自動設定為測線電極X方向長度的0.4倍。此設定只有啟用自動網格才會有效。",
"IdealGeometricFactor_Setting03_AutoMesh_paraDepth":-1,
"IdealGeometricFactor_Setting04_AutoMesh_boundary_Readme":"理想幾何因子計算網格-設定三角網格的外邊界倍數。預設值:-1，建議填入4~10之間的整數，設定小於4的數字仍會強制設定為4。此設定只有啟用自動網格才會有效。",
"IdealGeometricFactor_Setting04_AutoMesh_boundary":-1,
"IdealGeometricFactor_Setting05_AutoMesh_paraMaxCellSize_Readme":"理想幾何因子計算網格-設定三角網格的網格面積上限。單位:[m^2]。預設值:0，表示自動決定。此設定只有啟用自動網格才會有效。",
"IdealGeometricFactor_Setting05_AutoMesh_paraMaxCellSize":1,
"IdealGeometricFactor_Setting06_AutoMesh_addNodes_Readme":"理想幾何因子計算網格-設定三角網格的網格地表電極之間的節點數量。預設值:1。限制填入正整數。此值填「1」時無效果，改由paraDX決定增加的方式；填其他正整數則線性均勻增加兩個電極之間的節點數量。此設定只有啟用自動網格才會有效。",
"IdealGeometricFactor_Setting06_AutoMesh_addNodes":3,
"IdealGeometricFactor_Setting07_AutoMesh_paraDX_Readme":"理想幾何因子計算網格-設定三角網格的網格地表電極之間的節點數量。預設值:1。限制填入浮點數。僅有addNodes小於等於1的時候有效。此值大於等於0.5時，等於在兩個電極正中間增加一個節點。小於0.5的時候，在每個電極的左右兩邊各增加一個節點，距離是電極間距乘以此浮點數。此設定只有啟用自動網格才會有效。",
"IdealGeometricFactor_Setting07_AutoMesh_paraDX":1,
"Data_Setting03_RemoveLowCurrentData_LowerThan_A_Readme":"逆推參數-移除過低電流觀測資料，單位:[A]。建議值:0.01。限制填大於等於0的數字，填「0」表示不移除。注意，全部刪除資料會造成後續異常錯誤。請考量正確的儀器電流情形。",
"Data_Setting03_RemoveLowCurrentData_LowerThan_A":0,
"Data_Setting04_RemoveHighCurrentData_HigherThan_A_Readme":"逆推參數-移除過大電流觀測資料，單位:[A]。建議值:0.5。限制填大於0的數字。注意，全部刪除資料會造成後續異常錯誤。請考量正確的儀器電流情形。",
"Data_Setting04_RemoveHighCurrentData_HigherThan_A":1.0,
"Data_Setting05_RemoveLowVoltageData_LowerThan_V_Readme":"逆推參數-移除過低電壓觀測資料，單位:[V]。建議值:0.01。限制填大於等於0的數字，填「0」表示不移除。注意，全部刪除資料會造成後續異常錯誤。請考量正確的儀器電流情形。",
"Data_Setting05_RemoveLowVoltageData_LowerThan_V":0,
"Data_Setting06_RemoveHighVoltageData_HigherThan_V_Readme":"逆推參數-移除過大電流觀測資料，單位:[V]。建議值:400。限制填大於0的數字。注意，全部刪除資料會造成後續異常錯誤。請考量正確的儀器電流情形。",
"Data_Setting06_RemoveHighVoltageData_HigherThan_V":999999,
"Data_Setting07_RemoveLowAppResData_LowerThan_OhmM_Readme":"逆推參數-移除過低電壓觀測資料，單位:[Ohm-m]。建議值:0.01。限制填大於等於0的數字，填「0」表示不移除。注意，全部刪除資料會造成後續異常錯誤。請考量正確的儀器電流情形。",
"Data_Setting07_RemoveLowAppResData_LowerThan_OhmM":0,
"Data_Setting08_RemoveHighAppResData_HigherThan_OhmM_Readme":"逆推參數-移除過大電流觀測資料，單位:[Ohm-m]。建議值:100000。限制填大於0的數字。注意，全部刪除資料會造成後續異常錯誤。請考量正確的儀器電流情形。",
"Data_Setting08_RemoveHighAppResData_HigherThan_OhmM":999999,
"Data_Setting09_RemoveBadElectrodeData_List_Readme":"逆推參數-移除損毀電極觀測資料。建議值:[]。限制填正整數。注意，全部刪除資料會造成後續異常錯誤。請考量正確的儀器電流情形。",
"Data_Setting09_RemoveBadElectrodeData_List":[],
"Data_Setting10_RemoveLowMeshEffectData_LowerThan_Percent_Readme":"逆推參數-移除過低網格效應觀測資料，單位:[%]。建議值:99。限制填浮點數。注意，全部刪除資料會造成後續異常錯誤。請考量正確的儀器電流情形。",
"Data_Setting10_RemoveLowMeshEffectData_LowerThan_Percent":-99999.8,
"Data_Setting11_RemoveHighMeshEffectData_HigherThan_Percent_Readme":"逆推參數-移除過高網格效應觀測資料，單位:[%]。建議值:101。限制浮點數。注意，全部刪除資料會造成後續異常錯誤。請考量正確的儀器電流情形。",
"Data_Setting11_RemoveHighMeshEffectData_HigherThan_Percent":999100.2,
"Data_Setting12_UseFakeData_Enable_Readme":"逆推參數-使用假的觀測資料。建議值:「No」。若要啟用(把觀測資料變成全部都是1[Ohm-m])請填入字串Yes，若不啟用(使用實際資料)請填入字串No。",
"Data_Setting12_UseFakeData_Enable":"No",
"OutputFile01_GeometricFactor_K_CrossPlot_PNG_Enable_Readme":"幾何因子分析圖。若要啟用請填入字串Yes，若不啟用請填入字串No。不啟用可節省計算時間。",
"OutputFile01_GeometricFactor_K_CrossPlot_PNG_Enable":"Yes",
"Inversion_Setting01_Remove_Data_Times_Readme":"逆推參數-刪除擬合不佳的觀測資料次數，單位:[次]。建議值3，若不刪除任何資料，填「0」。",
"Inversion_Setting01_Remove_Data_Times":0,
"Inversion_Setting02_Remove_Data_Percentage_Readme":"逆推參數-刪除擬合不佳的觀測資料百分比，單位:[%]。建議值5[%]。限制填入1-99的正整數，請注意刪除過多可能導致程式錯誤。",
"Inversion_Setting02_Remove_Data_Percentage":5,
"Inversion_Setting03_Lamda_Readme":"逆推參數-權重參數Lamda，單位:[無]。建議值20。更相信資料就將lamda減小。lamda調大通常造成模型更加平滑。lamda太小模型將由資料主宰有過擬合的風險；lamda太大模型將過度平滑無法反映細節。",
"Inversion_Setting03_Lamda":[1],
"Inversion_Setting04_maxIter_Readme":"逆推參數-最大迭代次數，單位:[次]。建議值20。",
"Inversion_Setting04_maxIter":20,
"Inversion_Setting05_startModel_Readme":"逆推參數-起始模型，單位:[Ohm-m]。建議值:「-1」，限制填正數或「-1」或「-2」或「-3」。填「-1」表示使用資料的中位數製作均值起始模型。若填正數則用該值製作均值起始模型。填「-2」表示使用全網格MeshVTK內的電阻率值。填「-3」表示使用研究區域網格StartModelVTK內的電阻率值。",
"Inversion_Setting05_startModel":-1,
"InputFile05_StudyAreaStartModelVTK_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile05_StudyAreaStartModelVTK_FileName":"Input_ERTMaker_Inversion2D/XP1_SyntheticModel_StartModelVTK.vtk",
"Inversion_Setting06_verbose_Enable_Readme":"逆推參數-詳細運行資訊。若要啟用請填入字串Yes，若不啟用請填入字串No。",
"Inversion_Setting06_verbose_Enable":"No",
"Inversion_Setting07_limitModelCellMinValue_Readme":"逆推參數-模型電阻率下限。預設值:「0」，限制填正數或「0」。填「0」表示不限制。",
"Inversion_Setting07_limitModelCellMinValue":0,
"Inversion_Setting08_limitModelCellMaxValue_Readme":"逆推參數-模型電阻率下限。預設值:「0」，限制填正數或「0」。填「0」表示不限制。",
"Inversion_Setting08_limitModelCellMaxValue":0,
"Inversion_Setting09_SR_Enable_Readme":"逆推參數-奇異值移除技術(SR技術)。若要啟用請填入字串Yes，若不啟用請填入字串No。預設值:「Yes」",
"Inversion_Setting09_SR_Enable":"Yes",
"OutputMainFolderPath_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。務必要使用「/」在結尾，表示資料夾。",
"OutputMainFolderPath":"Output_ERTMaker_Inversion2D/",
"Output_MainFileName_Readme":"會產生很多檔案，這些檔案的主要檔名。",
"Output_MainFileName":"XP1_SyntheticModel",
"Output_Inversion_ColorBarResistivityMin_Readme":"電阻率色階下限，線性數值，必為正數。建議:1。",
"Output_Inversion_ColorBarResistivityMin":1,
"Output_Inversion_ColorBarResistivityMax_Readme":"電阻率色階下限，線性數值，必為正數。建議:10000。",
"Output_Inversion_ColorBarResistivityMax":10000
}
```

+ 程式碼:
```python
#**************************************************************************
#   Name: ERTMaker_Inversion2D_v20260125a.py
#   Copyright: 
#   Author: HsiupoYeh
#   Version: v20260125a
#   Description: 讀取 JSON 設定檔，進行逆推運算與繪圖。
#                必須讀取指定位置「Input_ERTMaker_Inversion2D/Inversion2D.json」的JOSN檔案。
#                設定檔(Inversion2D.json)中有說明各參數意義。
#   已知問題: PyGIMLi在逆推的部分，無法每次運算得到完全一致的結果。
#             這可能是因為在平行運算（Parallel Processing）中，「浮點數問題」（Float Problem）。
#             主要源於浮點數運算不符合結合律（Non-associativity）。
#             這會導致相同的程式在平行執行時，每次運算的結果可能微小不同，進而引發非確定性（Non-determinism）與數值不穩定性。
#==============================================================================
#   逆推流程與觀念:
#   1.先設計符合實際情況的模型網格，也就是製作mesh的相關檔案。這個是必要輸入檔案。
#   2.準備資料檔案，也就是製作ohm檔案。包含合理的電極位置，以及觀測資料(可以是實際野外資料也可以是人造資料)。
#   3.程式載入上述兩項重要輸入檔案後會先檢查是否合理:
#   3.1.電極只能在模型網格內。
#   3.2.考慮邊界條件是否正確。預設情況下:
#   3.2.1.編號-2的是混合邊界條件(Mixed Boundary Condition)，模擬電位向無限遠處衰減的行為，常用於「側面與底部邊界」，避免邊界效應。
#   3.2.2.編號-1的是諾依曼邊界條件(Neumann Boundary Condition)，模擬一個不導電的邊界（法向電流通量為零），用於地表。
#   3.2.3.因此，我製作的mesh會保留邊界編號-1給全網格的地表，編號-2給全網格的側面和底部邊界。
#     REF: /doc/user-guide/modelling.md
#         Boundary marker (-1) : surface boundary conditions - pg.core.MARKER_BOUND_HOMOGEN_NEUMANN
#         Boundary marker (-2) : mixed-boundary conditions - pg.core.MARKER_BOUND_MIXED
#         Boundary marker ( >= 1 ) : no-flow boundaries :::
#   4.整理視電阻率資料，使V/I資料變成視電阻率。而且只允許正的視電阻率。一般情況下:
#   4.1.從檔案中取得V/I資料，並重新計算幾何因子來計算成視電阻率。因為順推只會算出V/I，所以透過幾何因子算成視電阻率。幾何因子有要注意，預設解析解是水平地層假設才可用，否則建議用數值解，最好可以提供網格。
#   4.2.建議可以從迭代0次來判斷幾何因子是否合適。迭代0次的理論觀測資料視電阻率等於真實電阻率。
#   5.移除負的視電阻率。理由:
#   5.1.物理上不存在負的電阻率。
#   5.2.因為逆推採用對數轉換(自然對數)，不接受負的電阻率。順推則維持線性尺度，所以更新的網格數值會以線性尺度儲存，展示時會選擇常用對數(Log10)。
#   6.提供相對誤差。理由:
#   6.1.在pyGimli中逆推的目標函數中有考慮相對誤差作為權重。
#   6.2.根據作者作者指出，如果設定的誤差過低(例如 < 1%)，反演算法會試圖去擬合隨機噪訊，導致模型出現不真實的偽影(Artifacts)。「3%」被視為包含電極位置誤差、儀器精度與環境噪訊的合理綜合估計值。
#     REF: Rücker, C., Günther, T., & Spitzer, K. (2006). Three-dimensional modelling and inversion of dc resistivity data incorporating topography—I. Modelling. Geophysical Journal International, 166(2), 495-505.
#   7.逆推問題:是在求解一個受約束的非線性最小平方法問題。要最小化目標函數(Objective Function)，英文代號:Phi。
#   7.1.目標函數(Phi)通常由兩個主要部分組成：
#   7.1.1.資料擬合項(Data Misfit)，英文代號:PhiD。
#   7.1.2.模型平滑項(Model Regularization)，英文代號:PhiM。
#   7.1.3.其中PhiM有一個權重參數lamda。
#   7.1.4.最終目標函數Phi=PhiD+(lam*PhiM)
#   7.2.先關心PhiD，他的計算是PhiD=sum((Data_obs_i-Data_cal_i)/(Data_obs_i*Relative_Error_i))，這就是為什麼前面要準備Relative_Error_i。
#   7.3.再來關心PhiM。在pyGimli實作的意義大概是包含平滑約束(Ctype)、先驗模型(isReference)、透過垂直權重(zWeight)來調整非等向性。
#   7.3.1.一般情況下，這幾項都用預設值就好了。預設值是1階平滑約束(Ctype=1)、不使用先驗模型(isReference=False)、等向性(zWeight=1.0)。
#   7.4.當PhiM決定後，lamda的選擇就成了反演成功與否的最後關鍵。通常被認為是一種權衡，lamda太小模型將由資料主宰有過擬合的風險；lamda太大模型將過度平滑無法反映細節。
#   7.4.1.pyGimli預設的邏輯是利用統計檢定的卡方值(chi^2 = PhiD/N)來決定lamda。當chi^2=1被認為是最理想的狀態，因為模型既解釋了數據，又沒有去擬合雜訊。
#   7.4.2.但這邏輯在實作上更偏向終止準則。這個準則要有效其實依賴選擇的lamda與Relative_Error。當然若無法終止也是個有用的提示。
#   7.4.3.因此，合理的策略是在有限的時間內產生多幅不同lamda+Relative_Error的圖像，進行決策(選擇最佳模型)。
#   7.4.4.常見的決策建議: 地質合理性(不可以出現違反現實的構造)、卡方值能否接近1、殘差值。
#   7.4.5.作者也建議，未知場址可以先用大的lamda，粗略判斷主要特徵，合理後再降低lamda來看細節。
#   7.4.6.此外，還有個奇妙的lambdaFactor可以用，預設是1.0。允許每次疊代都更換lamda為lamda*lambdaFactor。1.0等於更換成同樣的lamda。
#   8.逆推運作的開始與結束。
#   8.1.我們需要一個起始模型來進行逆推，在Pygimli的預設方案中，將選擇一個均值的起始模型，其值為觀測資料的中位數。
#   8.2.因為使用迭代法，必須告訴程式何時該停止，包含:
#   8.2.1.最多幾次疊代(maxIter)，預設值20。若真的有必要可以控制這個。
#   8.2.2.目標函數改進百分比(deltaPhiPercent)，預設值 = 1，單位:[%]。通常不提供給使用者修改。
#   8.2.3.卡方值停止疊代(stopAtChi1)，預設值True。當chi^2 <= 1時停止。通常不提供給使用者修改。
#--
#   最終選擇的輸入、輸出為:
#   Input_Mesh_File = Demo_SyntheticModel.vtk
#   Input_MeshBC_File = Demo_SyntheticModelBCMarkers.json
#     邊界編號-1給全網格的地表，混合邊界條件(Mixed Boundary Condition)；編號-2給全網格的側面和底部邊界:混合邊界條件(Mixed Boundary Condition)。
#   Input_Ohm_File = Demo_SyntheticModel.ohm
#     檢查電極在網格內
#     幾何因子利用網格計算出來
#     視電阻率利用幾何因子算出來
#     移除負的視電阻率#     
#   Inversion_Settings_Relative_Error = 0.03
#     設定預估相對誤差，如果不知道資料品質狀態建議設為3%。
#   --
#   建立逆推管理器，管理器設定網格後:
#   Info_mgr_Mesh_All_CellCount = mgr.mesh.cellCount()
#   print(f"管理器中的網格數量 = {Info_mgr_Mesh_All_CellCount}")
#   Info_mgr_Mesh_Marker1_CellCount = np.sum(mgr.mesh.cellMarkers()==1)
#   print(f"管理器中的附加區域網格數量(Marker=1) = {Info_mgr_Mesh_Marker1_CellCount}")
#   Info_mgr_Mesh_Marker2_CellCount = np.sum(mgr.mesh.cellMarkers() == 2)
#   print(f"管理器中的研究區域網格數量(Marker=2) = {Info_mgr_Mesh_Marker2_CellCount}")
#   --
#   管理器初始化逆推參數域後:
#   Info_mgr_predict_H2_Mesh_CellCount = Info_mgr_Mesh_All_CellCount*4
#   print(f"管理器順推使用的H2網格，預期數量 = {Info_mgr_Mesh_All_CellCount}x4 = {Info_mgr_predict_H2_Mesh_CellCount}")
#   Info_mgr_H2_Mesh_CellCount = mgr.fop.mesh().cellCount()
#   print(f"管理器順推使用的H2網格，數量 = {Info_mgr_H2_Mesh_CellCount}")
#   --
#   檢視逆推資料與網格健康度
#   Info_Obs_Data_Count = Ohm_data.size()
#   print(f"輸入的觀測資料數量(Obs_N): {Info_Obs_Data_Count}")
#   Info_FullMesh_Count = mgr.mesh.cellCount()
#   print(f"全網格數量或稱原始網格數量(FullMesh_N): {Info_FullMesh_Count}")
#   Info_PaddingMesh_Count = sum(mgr.mesh.cellMarkers() == 1)
#   print(f"附加網格區域網格數量(PaddingMesh_N): {Info_PaddingMesh_Count}")
#   Info_StudyAreaMesh_Count = sum(mgr.mesh.cellMarkers() == 2)
#   print(f"研究區域網格數量(StudyAreaMesh_N): {Info_StudyAreaMesh_Count}")
#   Info_Obs_Data_Count_to_StudyAreaMesh_Count_ratio = Info_Obs_Data_Count / Info_StudyAreaMesh_Count
#   print(f"資料與逆推參數比例或稱觀測資料與研究區域網格數量比例(Obs_N/StduyAreaMesh_N): {Info_Obs_Data_Count_to_StudyAreaMesh_Count_ratio}")
#   print(f"經驗上:「Obs_N/StudyAreaMesh_N < 1.0 」時，資訊不足 (Underdetermined)，可能導致產生斑點形狀的結果。")
#   print(f"經驗上:「1.0 < Obs_N/StudyAreaMesh_N < 3.0」時，資訊平衡 (Well-posed)，是最有效率的逆推情況，能兼顧地層細節與運算穩定性。 ")
#   print(f"經驗上:「3.0 < Obs_N/StudyAreaMesh_N」時，資訊非常充足 (Overdetermined)，逆推結果會非常穩定，雜訊會被平均掉，地層邊界較平滑。要注意過量的觀測資料影響運算效率。")
#   print(f"隱藏的陷阱:即使資訊充足，但其實資料主要影響電極附近，距離遠的網格並不一定受資料影響。")
#   print(f"經驗上:可以依照資訊不足、資訊平衡、資訊非常充足等不同情況，嘗試合適的lam。例如:資訊非常充足時，可以將lam從預設的20調整至10，降低模型約束(平滑化)的權重。降低lam的同時也請考慮過擬合的問題。")
#   print(f"過擬合(Over-fitting)警告: 調低 lam 會增加過擬合風險。")
#   print(f"檢查點 1: 若最終 chi^2 << 1.0，代表模型可能正在擬合雜訊，應調高 lam。")
#   print(f"檢查點 2: 若電極附近出現不自然的「點狀高/低阻異常」，代表 lam 過低。")
#   --
#   設定逆推參數(終止疊代任務相關)
#   Default_maxIter = 20 #預設值20，開放使用者修改，視為必填項目。
#   Default_dPhi = 1 #預設值1，單位[%]，禁止使用者修改。[終止疊代任務門檻]：定義目標函數最小化的「相對改善率」下限。當疊代效益 < 1% 時，視為模型已達穩定狀態，提前終止逆推，防止對噪聲過度擬合。
#   逆推參數(正則化相關)
#   Default_lam = 20 #預設值20，開放使用者修改，視為必填項目。
#   Default_lambdaFactor = 1 #預設值1，禁止使用者修改。
#   Default_isReference = False #預設值關閉，禁止使用者修改。。是否要讓起始模型也同時成為先驗模型。 
#   Default_startModel = None #預設值None，開放使用者修改，視為必填項目。預設值None為觀測資料的中位數，單位:[Ohm-m]。
#   --   
#   逆推參數(資料擬合相關)
#   Default_robustData = False #預設值關閉，禁止使用者修改。。False表示使用一般模式(L2範數)，誤差會被平方，適合資料品質好時可達最佳效果。True表示使用強健模式，誤差會被重新加權，來容忍資料品質不好的離群點多的情況。
#   Default_blockyModel = False #預設值關閉，禁止使用者修改。。False表示空間格子應該像漸層，True表示空間格子像塊狀。
#   逆推參數(過程展示相關)
#   Default_showProgress = True #禁止使用者修改。
#   Default_verbose = True #禁止使用者修改。
#   Default_debug = True #禁止使用者修改。
#   --
#   每次逆推運行完可檢查:
#   Inversion_Iteration_count = mgr.inv.iter
#   print(f"目前迭代次數: {Inversion_Iteration_count}")
#   Info_Inversion_dataTrans = str(mgr.inv.dataTrans)
#   print(f"逆推運算資料轉換方式: {Info_Inversion_dataTrans}")
#   Info_Inversion_modelTrans = str(mgr.inv.modelTrans).replace("\n", " -> ")
#   print(f"逆推運算模型轉換方式: {Info_Inversion_modelTrans}")
#--
#   Info_LastInversion_StartModelMesh_Value = mgr.inv.startModel
#   #print(f"起始模型網格數值內容: {Info_LastInversion_StartModelMesh_Value}")
#   Info_LastInversion_StartModelMesh_CellCount = len(Info_LastInversion_StartModelMesh_Value)
#   print(f"起始模型網格數量 = {Info_LastInversion_StartModelMesh_CellCount}")
#   Info_LastInversion_StartModelMesh_Value_Min = np.min(Info_LastInversion_StartModelMesh_Value)
#   Info_LastInversion_StartModelMesh_Value_Max = np.max(Info_LastInversion_StartModelMesh_Value)
#   print(f"起始模型網格數值(Min/Max) = {Info_LastInversion_StartModelMesh_Value_Min:.2f}/{Info_LastInversion_StartModelMesh_Value_Max:.2f}")
#--
#   Info_LastInversion_ForwordH2ModelMesh_Value = mgr.fop.createMappedModel(mgr.inv.modelHistory[Inversion_Iteration_count]) # 研究區域照填，附加區域延續（prolongated）
#   #print(f"最後一次迭代的順推H2網格數值內容: {Info_LastInversion_ForwordH2ModelMesh_Value}")
#   Info_LastInversion_ForwordH2ModelMesh_CellCount = len(Info_LastInversion_ForwordH2ModelMesh_Value)
#   print(f"最後一次迭代的順推H2網格數值數量 = {Info_LastInversion_ForwordH2ModelMesh_CellCount}")
#   Info_LastInversion_ForwordH2ModelMesh_Value_Min = np.min(Info_LastInversion_ForwordH2ModelMesh_Value)
#   Info_LastInversion_ForwordH2ModelMesh_Value_Max = np.max(Info_LastInversion_ForwordH2ModelMesh_Value)
#   print(f"最後一次迭代的順推H2網格數值(Min/Max) = {Info_LastInversion_ForwordH2ModelMesh_Value_Min:.2f}/{Info_LastInversion_ForwordH2ModelMesh_Value_Max:.2f}")
#   Info_LastInversion_InversionModelMesh_Value = mgr.inv.modelHistory[Inversion_Iteration_count]
#   #print(f"最後一次迭代的逆推網格數值內容: {Info_LastInversion_InversionModelMesh_Value}")
#   Info_LastInversion_InversionModelMesh_CellCount = len(Info_LastInversion_InversionModelMesh_Value)
#   print(f"最後一次迭代的逆推網格數量 = {Info_LastInversion_InversionModelMesh_CellCount}")
#   Info_LastInversion_InversionModelMesh_Value_Min = np.min(Info_LastInversion_InversionModelMesh_Value)
#   Info_LastInversion_InversionModelMesh_Value_Max = np.max(Info_LastInversion_InversionModelMesh_Value)
#   print(f"最後一次迭代的逆推網格數值(Min/Max) = {Info_LastInversion_InversionModelMesh_Value_Min:.2f}/{Info_LastInversion_InversionModelMesh_Value_Max:.2f}")
#   Info_LastInversion_Obs_dataVals = mgr.inv.dataVals
#   #print(f"最後一次迭代的觀測資料內容: {Info_LastInversion_Obs_dataVals}")
#   Info_LastInversion_Obs_dataVals_Count = len(Info_LastInversion_Obs_dataVals)
#   print(f"最後一次迭代的觀測資料數量 = {Info_LastInversion_Obs_dataVals_Count}")
#   Info_LastInversion_Obs_dataVals_Min = np.min(Info_LastInversion_Obs_dataVals)
#   Info_LastInversion_Obs_dataVals_Max = np.max(Info_LastInversion_Obs_dataVals)
#   print(f"最後一次迭代的觀測資料數值(Min/Max) = {Info_LastInversion_Obs_dataVals_Min:.2f}/{Info_LastInversion_Obs_dataVals_Max:.2f}")
#   Info_LastInversion_Obs_errorVals = mgr.inv.errorVals
#   #print(f"最後一次迭代的觀測資料估計相對誤差內容: {Info_LastInversion_Obs_errorVals}")
#   Info_LastInversion_Obs_errorVals_Count = len(Info_LastInversion_Obs_errorVals)
#   print(f"最後一次迭代的觀測資料估計相對誤差數量 = {Info_LastInversion_Obs_errorVals_Count}")
#   Info_LastInversion_Obs_errorVals_Min = np.min(Info_LastInversion_Obs_errorVals)
#   Info_LastInversion_Obs_errorVals_Max = np.max(Info_LastInversion_Obs_errorVals)
#   print(f"最後一次迭代的觀測資料估計相對誤差數值(Min/Max) = {Info_LastInversion_Obs_errorVals_Min:.2f}/{Info_LastInversion_Obs_errorVals_Max:.2f}")
#   Info_LastInversion_response_dataVals = mgr.inv.response
#   #print(f"最後一次迭代的計算資料內容: {Info_LastInversion_response_dataVals}")
#   Info_LastInversion_response_dataVals_Count = len(Info_LastInversion_response_dataVals)
#   print(f"最後一次迭代的計算資料數量 = {Info_LastInversion_response_dataVals_Count}")
#   Info_LastInversion_response_dataVals_Min = np.min(Info_LastInversion_response_dataVals)
#   Info_LastInversion_response_dataVals_Max = np.max(Info_LastInversion_response_dataVals)
#   print(f"最後一次迭代的計算資料數值(Min/Max) = {Info_LastInversion_response_dataVals_Min:.2f}/{Info_LastInversion_response_dataVals_Max:.2f}")
#   Info_LastInversion_Lamda = mgr.inv.lam # 這常常取不到
#   print(f"最後一次迭代的逆推採用Lamda = {Info_LastInversion_Lamda}")
#   Info_LastInversion_RMS = mgr.inv.absrms()
#   #print(f"最後一次迭代的RMS = {Info_LastInversion_RMS:.2f}")
#   Info_LastInversion_RRMS = mgr.inv.relrms()
#   #print(f"最後一次迭代的RRMS = {Info_LastInversion_RRMS:.2f}%")
#   print(f"最後一次迭代的RMS/RRMS = {Info_LastInversion_RMS:.2f}/{Info_LastInversion_RRMS:.2f}%")
#   Info_LastInversion_chi2 = mgr.inv.chi2()
#   print(f"最後一次迭代的chi2 = {Info_LastInversion_chi2:.2f}")
#   Info_LastInversion_PhiD = mgr.inv.phiData()
#   #print(f"最後一次迭代的PhiD = {Info_LastInversion_PhiD:.2f}")
#   Info_LastInversion_PhiM = mgr.inv.phiModel()
#   #print(f"最後一次迭代的PhiM = {Info_LastInversion_PhiM:.2f}")
#   Info_LastInversion_Phi = mgr.inv.phi()
#   print(f"最後一次迭代的Phi = PhiD+(lam*PhiM) =: {Info_LastInversion_PhiD:.2f}+({Info_LastInversion_Lamda}*{Info_LastInversion_PhiM:.2f}) = {Info_LastInversion_Phi:.2f}")
#--
# log中的資訊解析:
#==============================================================================
# checkError() - 數據權重安全性檢查與計算
# 核心定義： dweight[i] = 1.0 / error[i]
#------------------------------------------------------------------------------
# 1. min/max(dweight) = 33.3333/33.3333
# 解讀: 相對誤差倒數的最大最小值。無單位。
#------------------------------------------------------------------------------
#dataWeight_ = 1.0 / tD_->error(fixZero(data_, TOLERANCE), error_);
#
#if (verbose_) std::cout << "min/max(dweight) = " << min(dataWeight_) << "/"
#                          << max(dataWeight_) << std::endl;
#==============================================================================
#==============================================================================
# DC Forward Response & Reciprocity Summary - 電阻率正向模擬與互換性摘要
#------------------------------------------------------------------------------
# 1. Response: min = 78.2413 max = 114.529 mean = 95.6784
# 解讀: 理論資料的最大最小與平均值。單位Ohm-m。
#--
# 2. Reciprocity rms(modelReciprocity) 0.224131%, max: 0.755323%
# 解讀: 理論上，根據互換定理（Reciprocity Theorem），正向與反向測量的結果應該完全相同。
#       數值意義: 在有限元素法 (FEM) 模擬中，由於網格離散化，兩者會有些微差距。
#       建議評價: < 1% = 代表數值模擬非常精確，網格密度 (Mesh density) 足夠。
#                 > 5% ：代表網格可能太粗糙，或電極附近的網格剖分不當，模擬結果不可信。
#==============================================================================
#==============================================================================
# tau (τ) 步長品質
#------------------------------------------------------------------------------
# 1. Performing line search with tau = 1
# 解讀: tau == 1.0 (理想狀態)。Phi 穩定快速下降，模型更新果斷。
#       0.3 < tau < 1.0 (正常修正)。
#       tau <= 0.03 (停滯/自救)。若持續發生：建議檢查 Data Error 是否給太小，或增加 Lambda 穩定反演。
#==============================================================================
#==============================================================================
# 迭代數據的詳細解讀 (以第 3 次迭代為例)
#------------------------------------------------------------------------------
# 3: Model: min = 45.2478; max = 196.671
# 解讀: 反演得到的地下電阻率範圍。單位：Ohm-m。
# 3: Response: min = 78.1385; max = 114.57
# 解讀: 當前模型產生的視電阻率響應範圍。單位：Ohm-m。
# 3: rms/rrms(data, Response) = 1.36746/1.52795%
# 解讀: 不考慮Log轉換，不考慮誤差權重。
#    - rms  : 即 AbsRMS (絕對均方根殘差)，平均每個點差了 1.37 Ohm-m。
#    - rrms : 相對百分比誤差。1.52% 代表擬合得非常好。
# 3: chi^2(data, Response, error, log) = 0.253918
# 解讀: 考慮Log轉換。考慮誤差權重。
#    - 關鍵判定: 
#      * chi^2 << 1 (如 0.25): 代表「過度擬合 (Overfitting)」。
#      * 原因: 你的 Data Error 給得太大，或者 Lambda 太小。
#      * 影響: 算法會試圖去擬合雜訊，導致模型出現不自然的碎裂。
# 3: Phi = 165.301 + 7.10985 * 20 = 307.497
# 解讀: 總目標函數 (Total Objective Function)。
#    - 165.301 : PhiD (Data misfit) - 數據項。
#    - 7.10985 : PhiM (Model roughness) - 模型項。
#    - 20      : Lambda (Regularization strength) - 正則化權重。
#------------------------------------------------------------------------------
#void echoStatus(const Vec & response, const Vec & model, const std::string & xtra = "") const {
#        double chi2 = getPhiD(response) / data_.size();
#        std::cout << iter_ << ": " << xtra
#                  << "Model: min = " << min(model) << "; max = " << max(model) << std::endl;
#        std::cout << iter_ << ": " << xtra
#                  << "Response: min = " << min(response) << "; max = " << max(response) << std::endl;
#        std::cout << iter_ << ": rms/rrms(data, " << xtra << "Response) = "
#                        << rms(data_, response) << "/"
#                        << rrms(data_, response) * 100.0 << "%" << std::endl;
#        std::cout << iter_ << ": chi^2(data, " << xtra
#                  << "Response, error, log) = " << chi2 <<        std::endl;
#        std::cout << iter_ << ": Phi = " << getPhiD(response) << "+" << getPhiM(model)
#                            << "*" << lambda_ << "=" << getPhi(model, response) << std::endl;
#    }
#==============================================================================
#==============================================================================
# 反演進度監控 (Convergence Monitoring) - 詳細解讀
#------------------------------------------------------------------------------
# 核心指標： dPhi (總目標函數下降率)
# 公式： dphi = (1 - (phi / lastPhi)) * 100
#------------------------------------------------------------------------------
# 註解說明：
# 1. phi: 當前迭代計算出的總目標函數值 (Total Objective Function)。
# 2. lastPhi: 上一次迭代的總目標函數值。
# 3. dphi : 該次迭代讓目標函數「改善了多少百分比」。範例： dphi=10%。代表這次更新進步了 10%。
# ------------------------------------------------------------------------------
#phi = self.phi()
#dPhi = phi / lastPhi
#
#if self.verbose:
#    dphi = (1 - dPhi) * 100
#    pg.info(f"chi² = {chi2:7.2f} (dPhi = {dphi:.2f}%) lam: {self.lam:.1f}")
#==============================================================================
#==============================================================================
# chi^2 = 其實是正規化卡方值，要有效的關鍵就是選到正確的相對誤差。
# 程式碼的計算幾乎就是PhiD/N
# ------------------------------------------------------------------------------
# Chi-squared (Normalized) Formula:
#             1      N  /  trans(data[i]) - trans(response[i]) \ 2
# Chi^2 =   -----   SUM | ------------------------------------ |
#             N     i=1 \           error_trans[i]             /
# ------------------------------------------------------------------------------
# 註解說明：
# 1. data : 觀測數據向量 (Observed data vector)
# 2. response : 模型響應向量 (Model response / Predicted data)
# 3. N     : 數據點總數 (Total number of data points)
# 4. error : 使用者設定的誤差門檻 (Relative Error)
# 4. 特點  : 使用預期誤差 (error) 當分母 -> 衡量「擬合是否達標」。考慮使用者設定的相對誤差 (relativeError)。
# 5. 輸出  : 純量 (Scalar)。
# 6. 判斷準則：
#    - Chi^2 = 1 : 擬合剛好達到你的誤差預期。
#    - Chi^2 > 1 : 擬合不足。
#    - Chi^2 < 1 : 過度擬合 (Overfitting)。
# ------------------------------------------------------------------------------
#    def chi2(self, response=None):
#        """Chi-squared misfit (mean of squared error-weighted misfit)."""
#        return self.phiData(response) / len(self.dataVals)
#==============================================================================
#==============================================================================
# PhiD = 目標函數的資料約束項。誤差權重殘差的平方和。是計算考慮誤差的殘差。
# error-weighted misfit就是residual
# ------------------------------------------------------------------------------
# 
#              N  /  trans(data[i]) - trans(response[i])  \ 2
# PhiData =   SUM | ------------------------------------ |
#             i=1 \           error_trans[i]             /
#
# ------------------------------------------------------------------------------
# 註解說明：
# 1. N             : 數據點總數 (Total number of data points)。
# 2. i             : 第 i 個數據點的索引。
# 3. data[i]       : 觀測到的原始數據值 (Observed data value)。
# 4. response[i]   : 模型產生的響應值 (Model response / Predicted data)。
# 5. trans()       : 轉換函數 (Data Transformation)。
#                    - 通常為 Log-transformation (logTrans)。
#                    - 目的：縮小動態範圍，使反演對高、低電阻率同樣敏感。
# 6. error_trans[i]: 轉換後的誤差權重 (Transformed Error)。
#                    - 計算公式通常與 relativeError 相關。
#                    - 意義：你對這筆數據「不信任」的程度。分母越大，代表該點對目標函數影響越小。
# ------------------------------------------------------------------------------
# def phiData(self, response=None):
#     """Return data objective function (sum of squared error-weighted misfit)."""
#     if response is None:
#         response = self.response
#
#     dT = self.dataTrans
#     dData = (dT.trans(self.dataVals) - dT.trans(response)) / \
#         dT.error(self.dataVals, self.errorVals)
#
#     return pg.math.dot(dData, dData)
#==============================================================================
#==============================================================================
# PhiM = 模型正規化項。概念就是粗糙度，數值越大越粗糙。而目標函數是希望小，所以是希望結果平滑。
# 搭配的lamda越大，會造成很容易把粗糙度變大，導致模型想要往更平滑去調整。
# ------------------------------------------------------------------------------
#def phiModel(self, model=None):
#    """Model objective function (norm of regularization term)."""
#    if model is None:
#        model = self.model
#
#    rough = self.inv.roughness(model)
#    return pg.math.dot(rough, rough)
#==============================================================================
#==============================================================================
# Phi = 完整的目標函數。PhiD + (lambda * PhiM)。
# ------------------------------------------------------------------------------
#def phi(self, model=None, response=None):
#    """Total objective function (phiD + lambda * phiM)."""
#    if response is None:
#        response = self.response
#
#    phiD = self.phiData(response)
#    if self.localRegularization:
#        return phiD
#    else:
#        return phiD + self.phiModel(model) * self.lamOhm_data['i']
#==============================================================================
#==============================================================================
# RRMS = 相對方均根殘差。計算不考慮誤差的殘差。
# ------------------------------------------------------------------------------
# RRMS (Relative Root Mean Square) Formula:
# 
#            _______________________________________________________
#           /   1     N  /  | data[i] - response[i] |  \ 2
# RRMS =   /  -----  SUM | ------------------------     |   * 100%
#        \/     N    i=1 \      | data[i]|             /
#
# ------------------------------------------------------------------------------
# 註解說明：
# 1. data : 觀測數據向量 (Observed data vector)
# 2. response : 模型響應向量 (Model response / Predicted data)
# 3. N     : 數據點總數 (Total number of data points)
# 4. 特點  : 客觀百分比指標，不考慮使用者設定的相對誤差 (relativeError)。
# 5. 輸出  : 由向量 (Vector) 降維運算後得到的純量 (Scalar)。
# 6. 單位  : %
# ------------------------------------------------------------------------------
#def relrms(self):
#    """Relative root-mean-square misfit of the last run."""
#    return pg.math.rrms(self.data, self.response)
#def rrms(a, b, axis=None):
#    """Compute the relative (regarding a) root mean square."""
#    # abs for complex values
#    return rms(np.abs(a-b)/np.abs(a), axis)
#def rms(v, axis=None):
#    """Compute the root mean square."""
#    # abs for complex values
#    return np.sqrt(np.mean(np.abs(v)**2, axis))
#==============================================================================
#==============================================================================
# ABSRMS = 絕對方均根殘差，也被簡單稱作RMS
# ------------------------------------------------------------------------------
# AbsRMS (Absolute Root Mean Square) Formula:
# 
#            _________________________________________________
#           /   1     N  
# AbsRMS = /  -----  SUM ( data[i] - response[i] ) ^ 2
#        \/     N    i=1 
#
# ------------------------------------------------------------------------------
# 註解說明：
# 1. data : 觀測數據向量 (Observed data vector)
# 2. response : 模型響應向量 (Model response / Predicted data)
# 3. N     : 數據點總數 (Total number of data points)
# 4. 特點  : 不考慮使用者設定的相對誤差 (relativeError)。不進行歸一化。
# 5. 輸出  : 純量 (Scalar)。
# 6. 單位  : 與原始數據 (data) 單位完全相同 (例如 Ohm-m)。
# ------------------------------------------------------------------------------
# def absrms(self):
#     """Absolute root-mean-square misfit of the last run."""
#     return pg.math.rms(self.data, self.response)
#
# def rms(v, axis=None):
#     """Compute the root mean square (Internal Logic)."""
#     # 這裡的 v = (data - response)
#     return np.sqrt(np.mean(np.abs(v)**2, axis))
#==============================================================================
#==============================================================================
# Jacobian矩陣，簡稱J矩陣。公式代號J_ij。
# J_ij矩陣的Rows(例如651，i = 1, 2, ..., 651)：每一行必須對應一筆觀測數據（Data Container 中的量測點）。
# J_ij矩陣的Cols(例如4200，j = 1, 2, ..., 4200)：每一列必須對應一個反演網格（Model 空間）。
# Jacobian矩陣的元素計算公式 (J_ij):
#
#              dData[i,j]       ( response_Change[i,j] - response_NoChange[i] )
#    J[i,j] = ------------ = ---------------------------------------------------
#              dModel[j]        ( model_Change[j] - model_NoChange[j] )
#
#    * where i = 1, 2, ..., 651 (Index of Data)
#    * where j = 1, 2, ..., 4200 (Index of Model Cell)
#
# J_ij矩陣結構:
#
#         [ J_1,1    J_1,2    ...   J_1,4200   ]  -- 觀測資料 #1
#         [ J_2,1    J_2,2    ...   J_2,4200   ]  -- 觀測資料 #2
#    J =  [  ...      ...     ...     ...      ]
#         [ J_651,1  J_651,2  ...   J_651,4200 ]  -- 觀測資料 #651
#            |        |               |
#          網格 1   網格 2          網格 #4200
#
#--
# 矩陣尺寸固定不會變。初次計算的時候J矩陣為空，就被判斷尺寸錯誤，所以會強制重新計算。
# 因為從程式碼中發現，是使用暴力法，而且是將模型值*1.05當作擾動，這表示模型數值是在線性的世界，單位為[Ohm-m]。
# 同樣地，觀測資料是順推結果，單位為[Ohm-m]。故J_ij的單位是[Ohm-m]/[Ohm-m]=無單位
#--
#預設值
#void ModellingBase::init_() {
#    regionManager_      = new RegionManager(verbose_);
#    regionManagerInUse_ = false;
#
#    // __MS("ModellingBase::init_: " << this <<  " rm:" << regionManager_)
#
#    mesh_               = 0;
#    jacobian_           = 0;
#    constraints_        = 0;
#    dataContainer_      = 0;
#
#    nThreads_           = min(8, numberOfCPU()-2);
#    nThreadsJacobian_   = 1;
#
#    ownJacobian_        = false;
#    ownConstraints_     = false;
#    ownRegionManager_   = true;
#
#    initJacobian();
#    initConstraints();
#}
#--
# 觸發點: 某個函數呼叫這個
#void RInversion::checkJacobian(bool force) {
#
#    if ((forward_->jacobian()->rows() == data_.size() &&
#        forward_->jacobian()->cols() == model_.size()) && !force) return;
#
#    if (verbose_ &&
#            (forward_->jacobian()->rows() != data_.size() ||
#                forward_->jacobian()->cols() != model_.size())
#        ){
#        std::cout << "check Jacobian: wrong dimensions: "
#                    << "(" << forward_->jacobian()->rows()  << "x" << forward_->jacobian()->cols() << ") should be "
#                    << "(" << data_.size() << "x" << model_.size()  << ") " << " force: " << force << std::endl;
#        std::cout << "jacobian size invalid, forced recalc: " << force << std::endl;
#    }
#
#    Stopwatch swatch(true);
#    if (verbose_) std::cout << "Calculating Jacobian matrix (forced=" << force << ")...";
#    forward_->createJacobian(model_);
#    jacobiNeedRecalc_ = false;
#    if (verbose_) std::cout << "... " << swatch.duration(true) << " s" << std::endl;
#}
#--
# 主要進入點forward_->createJacobian(model_)
#void ModellingBase::createJacobian(const RVector & model){
#    RVector resp;
#    if (nThreadsJacobian_ > 1){
#        resp = response_mt(model);
#    } else {
#        resp = response(model);
#    }
#
#    if (!jacobian_){
#        this->initJacobian();
#    } else {
#        jacobian_->clear();
#    }
#    RMatrix *J = dynamic_cast< RMatrix * >(jacobian_);
#    if (J->rows() != resp.size()){
#        J->resize(resp.size(), model.size());
#    }
#
#    if (nThreadsJacobian_ > 1){
#        return createJacobian_mt(model, resp);
#    } else {
#        return createJacobian(model, resp);
#    }
#}
#--
#去呼叫createJacobian(model, resp) 
# 採用「brute force」也就是暴力法。使網格數值增加到1.05倍，這個當dModel。然後去順推再算dData，最後得到J。
# 例如:
# 有4200個網格(cols=4200，公式J_ij的j)，作為原始網格。進行順推模擬取得該次651個response_NoChange，觀測資料有651個(row=651，公式J_ij的i)。
# 接著將跑迴圈(4200次)，每次從原始網格修改一個網格model_NoChange成為擾動網格model_Change，再次進行順推模擬取得該次651個response_Change。
# 該次的651個response_Change拿去與原始網格的原始651個response_NoChange抓去算該次651個J。公式J=(response_Change-response_NoChange) / (model_Change-model_NoChange)。
# 意義上就是，問物理引擎：「如果只有這格調升5%，地表 651 個觀測站看到的電壓會變多少？」
# 跑完之後就會產生row x cols = 651 x 4200的J矩陣
#void ModellingBase::createJacobian(const RVector & model,
#                                   const RVector & resp){
#    if (verbose_) std::cout << "Create Jacobian matrix (brute force) ...";
#
#    Stopwatch swatch(true);
#    double fak = 1.05;
#
#    if (!jacobian_){
#        this->initJacobian();
#    }
#    RMatrix *J = dynamic_cast< RMatrix * >(jacobian_);
#    if (J->rows() != resp.size()){ J->resize(resp.size(), model.size()); }
#
#    for (size_t i = 0; i < model.size(); i++) {
#        RVector modelChange(model);
#        modelChange[i] *= fak;
#
#        RVector respChange(response(modelChange));
#
#        if (::fabs(modelChange[i] - model[i]) > TOLERANCE){
#            J->setCol(i, (respChange - resp) / (modelChange[i] - model[i]));
#        } else {
#            J->setCol(i, RVector(resp.size(), 0.0));
#        }
#
#//         __MS(i << " " << min(J->col(i)) << " " << max(J->col(i)))
#
#//         for (size_t j = 0; j < resp.size(); j++){
#//             if (::fabs(modelChange[i] - model[i]) > TOLERANCE){
#//                 (*J)[j][i] = (respChange[j] - resp[j]) / (modelChange[i] - model[i]);
#//             } else {
#//                 (*J)[j][i] = 0.0;
#//             }
#//         }
#    }
#
#    swatch.stop();
#    if (verbose_) std::cout << " ... " << swatch.duration() << " s." << std::endl;
#}
#==============================================================================
#==============================================================================
# 覆蓋度coverage與標準化覆蓋度standardizedCoverage:
# coverage利用J矩陣，再透過網格面積、網格電阻率、觀測資料進行歸一化算出的覆蓋度矩陣。數量與J矩陣相同。
# 覆蓋率應用在繪圖中會產生漸漸變化的感覺。
#                     /   covTrans[j]   \
#    Coverage = log10 |   -----------   |
#                     \   cellSize[j]   /
# 這是由 pg.core.coverageDCtrans(J, 1/d, 1/m) 計算出來的結果：
#
#                  651    |          Model[j] |
#    covTrans[j] = SUM    | J[i,j] * -------- | 
#                  i=1    |          Data[i]  |
# 
# 標準化覆蓋度standardizedCoverage則是用某個門檻再調整為0或1的內容。數量與J矩陣相同。
# 標準化覆蓋度覆蓋率應用在繪圖中會產生銳利切割的感覺。
#                                   {  1.0  ,  if  coverage() >  threshold(預設0.01)
#   standardizedCoverage (0或1)  =  {
#                                   {  0.0  ,  if  coverage() <= threshold(預設0.01)
# 使用pg.show繪圖的時候，Coverage轉換成透明度，使用addCoverageAlpha
# addCoverageAlpha 統計門檻判定：
#   - 計算所有網格 Coverage 的直方圖。
#   - 找出累計分佈 (CDF) 前 40% 的位置 (ma)。
#   - 找出累積前 2% 的弱訊號位置 (mi)。
#   - 程式「強迫」將覆蓋度最低的 60% 網格設為完全透明 (Alpha=0)。
#   - 剩餘 40% 的網格進行線性映射 (從 mi 到 ma 映射至 0 到 1)。
# 繪圖效果為漸層到變透明:
#   - 越靠近第 60% 位 (門檻線) 的網格：越趨近透明 (Alpha 降低)。
#   - 遠離門檻線的高覆蓋網格：越清晰 (Alpha 趨近 1.0)。
# 隱藏的解讀問題與風險:
#   - 相對性偏誤：這套邏輯是「相對比較」而非「絕對正確」。
#     無論資料好壞，程式預設都會塗白 60% 的區域。
#     這可能導致解釋者誤以為「白色的地方一定不可信」。
#   - 網格規模陷阱：當反演範圍 (Mesh) 劃分得極為巨大時，外圍存在大量靈敏度趨近於 0 的無效網格。
#     這些「垃圾網格」會迅速填滿 60% 的淘汰名額，導致原本處於邊緣、靈敏度普通的網格被推入「前 40% 清晰區」。
#     讓使用者誤以為探測深度變深了，產生「探測良好」的錯覺。
#   - 若白的區域非常多且邊界突兀，表示覆蓋率分佈極端 (例如訊號只集中在地表極淺層)，解釋變得非常危險。
#--
#def coverage(self):
#    """Coverage vector considering the logarithmic transformation."""
#    covTrans = pg.core.coverageDCtrans(self.fop.jacobian(),
#                                       1.0 / self.inv.response,
#                                       1.0 / self.inv.model)
#
#    paramSizes = np.zeros(len(self.inv.model))
#    for c in self.fop.paraDomain.cells():
#        paramSizes[c.marker()] += c.size()
#
#    wCovLog = np.log10(covTrans / paramSizes)
#    return wCovLog[self.fop.paraDomain.cellMarkers()]
#
#def standardizedCoverage(self, threshold=0.01):
#    """Return standardized coverage vector (0|1) using thresholding."""
#    return 1.0*(self.coverage() > threshold)
#
#RVector coverageDCtrans(const MatrixBase & S, const RVector & dd, const RVector & mm) {
#    RVector cov;
#
#    if (S.rows() > 0) {
#        cov.resize(S.cols(), 0.0);
#    } else {
#        std::cout << "Sensmatrix invalid" << std::endl;
#    }
#
#    if (S.rtti() == GIMLI_MATRIX_RTTI){
#        const RMatrix *Sl = dynamic_cast < const RMatrix * >(&S);
#
#        for (size_t i = 0; i < S.rows(); i ++) {
#            cov += abs((*Sl)[i] * dd[i]);
#        }
#    } else if (S.rtti() == GIMLI_SPARSE_MAP_MATRIX_RTTI){
#
#        const RSparseMapMatrix * Sl = dynamic_cast< const RSparseMapMatrix * >(&S);
#
#        for (RSparseMapMatrix::const_iterator it = Sl->begin(); it != Sl->end(); it ++){
#            Index row = (*it).first.first;
#            Index col = (*it).first.second;
#            cov[col] += (*it).second * dd[row];
#        }
#    } else {
#        CERR_TO_IMPL
#    }
#
#    return cov / abs(mm);
#}
#--
#def showMesh(mesh, data=None, block=False, colorBar=None,
#             label=None, coverage=None, ax=None, savefig=None,
#             showMesh=False, showBoundary=None, factor=1,
#             markers=False, **kwargs):
#中間略...
#
#    if coverage is not None:
#        if isinstance(coverage, (float, int)):
#            gci.set_alpha(coverage)
#        elif len(data) == len(coverage) == mesh.cellCount():
#            addCoverageAlpha(gci, coverage,
#                             dropThreshold=kwargs.pop('dropThreshold', 0.4))
#        else:
#            pg.error('Coverage needs to be either of type float or an array',
#                     'with the same length as data and mesh.cellCount().')
#            # addCoverageAlpha(gci, pg.core.cellDataToPointData(mesh,
#            #                                                   coverage))
#後面略...
#--
#def addCoverageAlpha(patches, coverage, dropThreshold=0.4):
#    """Add alpha values to the colors of a polygon collection.
#
#    Parameters
#    ----------
#
#    patches : 2D mpl mappable
#
#    coverage : array
#        coverage values. Maximum coverage mean no opaqueness.
#
#    dropThreshold : float
#        relative minimum coverage
#    """
#    patches.set_antialiaseds(True)
#    # generate individual color values here
#    patches.update_scalarmappable()
#
#    cols = patches.get_facecolor()
#
#    C = np.asarray(coverage)
#    #    print(np.min(C), np.max(C))
#
#    if (np.min(C) < 0.) | (np.max(C) > 1.) | (np.max(C) < 0.5):
#
#        nn, hh = np.histogram(C, 50)
#        nnn = nn.cumsum(axis=0) / float(len(C))
#
#        #        print("min-max nnn ", min(nnn), max(nnn))
#        mi = hh[np.min(np.where(nnn > 0.02)[0])]
#
#        if np.min(nnn) > dropThreshold:
#            ma = np.max(C)
#        else:
#            ma = hh[np.max(np.where(nnn < dropThreshold)[0])]
##            mi = hh[min(np.where(nnn > 0.2)[0])]
##            ma = hh[max(np.where(nnn < 0.7)[0])]
#
#        C = (C - mi) / (ma - mi)
#        C[np.where(C < 0.)] = 0.0
#        C[np.where(C > 0.95)] = 1.0
#
##    else:
##        print('taking the values directly')
#    import matplotlib as mpl
#    from packaging import version
#
#    if version.parse(mpl.__version__) >= version.parse("3.4"):
#        patches.set_alpha(C)
#        patches.set_snap(True)
#    else:
#        cols[:, 3] = C
#        patches.set_facecolors(cols)#
#
#    if hasattr(patches, 'ax'):
#        updateAxes(patches.ax)
#    elif hasattr(patches, 'get_axes'):
#        updateAxes(patches.get_axes())
#==============================================================================
#==============================================================================
# 相對殘差百分比: Relative_Misfit_Percentage (%)
# Relative_Misfit_Percentage = np.abs((mgr.inv.response - data['rhoa']) / data['rhoa']) * 100
#==============================================================================
#==============================================================================
# 目標函數下降比例: dPhi = current_Phi / last_Phi
#==============================================================================
#==============================================================================
# 網格設計參考:
#def createParaMeshPLC(sensors, paraDX=1, paraDepth=-1, paraBoundary=2,
#                      paraMaxCellSize=0.0, boundary=-1, boundaryMaxCellSize=0,
#                      balanceDepth=True,
#                      isClosed=False, addNodes=1, **kwargs):
#中間略...
#    if paraDepth <= 0.0:
#        paraDepth = 0.4 * (xMax - xMin)
#中間略...
#    if boundary < 0:
#        boundary = 4
#
#    bound = abs(xMax - xMin) * boundary
#下面略...
#--
# 這表示預設情況下，先決定網格深度為測線水平長度的0.4倍。然後向左與向右擴展的寬度是測線水平長度的4倍。
# 例如:測線長度100公尺，則研究區域網格是寬100公尺，深40公尺，標註Marker2。全網格則是寬100+400+400=900公尺，深40+400=440公尺，標註Marker1。
# 並標註邊界:
#   Boundary marker (-1) : surface boundary conditions - pg.core.MARKER_BOUND_HOMOGEN_NEUMANN
#   Boundary marker (-2) : mixed-boundary conditions - pg.core.MARKER_BOUND_MIXED
# 此外，預設情況下paraDX=1，addNodes=1，將導致兩個電極中間增加一個節點。
# balanceDepth表示模型最底下是平坦的。isClosed表示非封閉的網格，通常指上方為地表與空氣的介面。
#==============================================================================
#**************************************************************************
import json
import os
import numpy as np
from datetime import datetime
import pygimli as pg
#--------------------------------------------
from pygimli.physics import ert
#--
# 因為「ert.show」函數不安全，某些陣列判定會出錯。
# 使用動態「猴子補丁」技術，重寫該函數並覆蓋。
#--
# 定義安全版函數
def safe_generateConfStr(yy, switch=False):
    mO, mT = 100, 10000
    types = ['PP', 'PD', 'DP', 'WA', 'SL', 'DD']
    yy = np.atleast_1d(yy)
    typ_indices = np.round(yy // mT).astype(int)
    
    if switch:
        dip = yy % mO
        spac = np.round(yy // mO) % mO
    else:
        spac = yy % mO
        dip = np.round(yy // mO) % mO

    rendd = (np.mean(spac / (dip + 1)) < 2.1)
    keys = []
    for s, d, t in zip(spac, dip, typ_indices):
        #-----------------------------
        # 核心修正：加入索引合法性檢查
        if 0 <= t < len(types):
            key = types[t]
        else:
            key = f"UNK{int(t)}"
        #-----------------------------  
        if d > 0:
            if rendd and d + 1 == s and t == 5:
                key = 'WB'
            else:
                key = key + str(int(d + 1)) + '-'
        key = key + f"{int(s):2d}"
        keys.append(key)
    return keys
#--
# 直接修改路徑下的函數指標
ert.visualization.generateConfStr = safe_generateConfStr
#--------------------------------------------
import matplotlib.pyplot as plt
#--------------------------------------------
# 取得運行開始時間
program_start_time = datetime.now()
#--------------------------------------------
#--------------------------------------------
# 版本資訊
VERSION_STR = 'v20260125a'
# 提示畫面
print('************************************************************')
print(f'* ERTMaker_Inversion2D_v{VERSION_STR}')
print('* Author: HsiupoYeh')
print(f'* Version: {VERSION_STR}')
print('************************************************************')
# 軟體說明
ERTMaker_Info = f'ERTMaker v1.0(Author: HsiupoYeh) Powered by PyGIMLi v{pg.__version__}'
print(ERTMaker_Info)
#--
print(f"程式開始運行...時間: {program_start_time.strftime('%Y-%m-%d %H:%M:%S')}")
print('--')
#--------------------------------------------
# 指定檔案名稱
json_file_name = 'Input_ERTMaker_Inversion2D/Inversion2D.json'
#--------------------------------------------
# 讀取檔案
# 開啟並讀取 JSON 檔案
print("讀取 .json 檔...")
with open(json_file_name, 'r', encoding='utf-8') as json_file:
    temp_json_data = json.load(json_file)
print("讀取 .json 檔...完成!")
#--------------------------------------------
#--------------------------------------------
# 讀取資料 Ohm檔案
#--
print("載入Ohm檔案...")
Input_Ohm_FileName = temp_json_data["InputFile01_Ohm_FileName"]
print(f"目標檔案: {Input_Ohm_FileName}")
Ohm_data = ert.load(Input_Ohm_FileName)
if os.path.exists('invalid.data'):
    os.remove('invalid.data')
print("載入Ohm檔案...完成!")
#--
Ohm_data_All_count = Ohm_data.size()
print(f'Ohm: 感應器數量 = {Ohm_data.sensorCount()}, 資料數量 = {Ohm_data_All_count}')
#--------------------------------------------
print('--')
#--------------------------------------------
AutoMesh_quality = 0
AutoMesh_paraDepth = 0
AutoMesh_boundary = 0
AutoMesh_paraMaxCellSize = 0
AutoMesh_addNodes = 0
AutoMesh_paraDX = 0
if temp_json_data["Mesh_Setting01_AutoMesh_Enable"] == 'Yes' :
    #--------------------------------------------
    AutoMesh_quality = temp_json_data["Mesh_Setting02_AutoMesh_quality"]
    AutoMesh_paraDepth = temp_json_data["Mesh_Setting03_AutoMesh_paraDepth"]
    AutoMesh_boundary = temp_json_data["Mesh_Setting04_AutoMesh_boundary"]
    AutoMesh_paraMaxCellSize = temp_json_data["Mesh_Setting05_AutoMesh_paraMaxCellSize"]
    AutoMesh_addNodes = temp_json_data["Mesh_Setting06_AutoMesh_addNodes"]
    AutoMesh_paraDX = temp_json_data["Mesh_Setting07_AutoMesh_paraDX"]
    mesh=pg.meshtools.createParaMesh(Ohm_data,quality=AutoMesh_quality,paraDepth=AutoMesh_paraDepth,boundary=AutoMesh_boundary,paraMaxCellSize=AutoMesh_paraMaxCellSize,addNodes=AutoMesh_addNodes,paraDX=AutoMesh_paraDX)
    print(f"網格節點數量 (Mesh Node Count): {mesh.nodeCount()}")
    print(f"網格單元數量 (Mesh Cell Count): {mesh.cellCount()}")
    print(f"附加區域網格單元(Marker=1)的單元數量(Mesh Cell Marker=1 Count): {np.sum(mesh.cellMarkers() == 1)}")
    print(f"研究區域網格單元(Marker=2)的單元數量(Mesh Cell Marker=2 Count): {np.sum(mesh.cellMarkers() == 2)}")
    print(f"網格邊界數量 (Mesh Boundary Count): {mesh.boundaryCount()}")
    #--------------------------------------------
    # 填入預設電阻率
    mesh['Resistivity'] = np.ones(mesh.cellCount())
    mesh['Resistivity_(log10)'] = np.log10(mesh['Resistivity'])
    #--------------------------------------------
else:
    #--------------------------------------------
    # 建立網格
    mesh = pg.Mesh(2)
    # 使用計算出的節點座標創建網格
    print("讀取 .vtk 檔...")
    mesh.load(temp_json_data["InputFile02_MeshVTK_FileName"])
    print("讀取 .vtk 檔...完成!")
    # 確保正確性，重新計算log10的電阻率
    mesh['Resistivity_(log10)'] = np.log10(mesh['Resistivity'])
    #--------------------------------------------
    # 讀取並設定 MeshBCMarkers
    print("讀取 MeshBCMarkersJSON 檔...")
    # 開啟並讀取 JSON 檔案
    with open(temp_json_data["InputFile03_MeshBCMarkersJSON_FileName"], 'r', encoding='utf-8') as json_file:
        FullMeshMarkers_json_data = json.load(json_file)
    print("讀取 MeshBCMarkersJSON 檔...完成!")
    #--
    # 取出最後一直欄(marker)
    markers = [row[-1] for row in FullMeshMarkers_json_data['MeshBCMarkers']]
    # 設定 針對每一筆記錄，取出 index 與 marker，設定到對應的 boundary
    for entry in FullMeshMarkers_json_data['MeshBCMarkers']:
        indexValue, x1Value, y1Value, x2Value, y2Value, markerValue = entry
        b = mesh.boundaries()[int(indexValue)]
        b.setMarker(int(markerValue))
    #--
    print(f"網格節點數量 (Mesh Node Count): {mesh.nodeCount()}")
    print(f"網格單元數量 (Mesh Cell Count): {mesh.cellCount()}")
    print(f"附加區域網格單元(Marker=1)的單元數量(Mesh Cell Marker=1 Count): {np.sum(mesh.cellMarkers() == 1)}")
    print(f"研究區域網格單元(Marker=2)的單元數量(Mesh Cell Marker=2 Count): {np.sum(mesh.cellMarkers() == 2)}")
    print(f"網格邊界數量 (Mesh Boundary Count): {mesh.boundaryCount()}")
    #--------------------------------------------
print('--')
#--------------------------------------------
# 檢查網格與電極是否匹配
print("檢查網格與電極是否匹配...")
try:
    # 建立一個 ERT 模擬算子
    temp_fop = ert.ERTModelling()
    # 這是關鍵動作：它會觸發底層的 searchElectrodes_()
    temp_fop.setData(Ohm_data)
    #temp_fop.setMesh(mesh, ignoreRegionManager=True)    
    temp_fop.setMesh(mesh, ignoreRegionManager=False)  
    print("檢查通過：所有電極均成功匹配網格單元。")
except RuntimeError as e:
    # 當電極在網格之外時，會捕捉到 RuntimeError
    print("檢查失敗：偵測到電極與網格不匹配！(電極在網格之外嗎?)")
    print(f"錯誤訊息: {e}")
    exit(1)
print("檢查網格與電極是否匹配...完成!")
#--------------------------------------------
#==============================================================================
# Pygimli網格繪圖:  繪製全網格剖面(電阻率、電極位置、網格資訊)
#--
# 可填入的資訊
Main_FileName = temp_json_data["Output_MainFileName"]
PNG_Profile_Name = Main_FileName
PNG_NumPy_Electrode_x = Ohm_data.sensors().array()[:, 0]
PNG_NumPy_Electrode_y = Ohm_data.sensors().array()[:, 1]
PNG_NumPy_Electrode_z = Ohm_data.sensors().array()[:, 2]
PNG_mesh = mesh
PNG_mesh_data = mesh['Resistivity_(log10)']
PNG_colorbar_title = 'Resistivity (log10 Ωm)'
PNG_colorbar_ticker_ModifyLog10ToLinear_Enable = True # True = 把colorbar數值文字從對數尺度調整成線性尺度 / False = 維持原本數值
PNG_colorbar_ticker_ModifyLog10ToLinear_title = 'Resistivity (Ωm)'
PNG_Main_Title = f"{PNG_Profile_Name} FullMesh (" + \
    f"AutoMesh={temp_json_data['Mesh_Setting01_AutoMesh_Enable']}," + \
    f"quality={AutoMesh_quality}," + \
    f"paraDepth={AutoMesh_paraDepth}," + \
    f"boundary={AutoMesh_boundary})\n" + \
    f"(paraMaxCellSize={AutoMesh_paraMaxCellSize}," + \
    f"addNodes={AutoMesh_addNodes}," + \
    f"paraDX={AutoMesh_paraDX}) " + \
    f"Cell Count={np.sum(mesh.cellMarkers() == 1)}+{np.sum(mesh.cellMarkers() == 2)}={mesh.cellCount()}, " + \
    f"Data Count={Ohm_data_All_count}, " + \
    f'Electrode Count={Ohm_data.sensorCount()}'                
PNG_mesh_showMesh = True # True / False
PNG_mesh_showBoundary = True # None / True / False ，某些時候None與True效果相同
PNG_cMap = 'jet'
PNG_cMin = np.min(PNG_mesh_data) # None表示自動
PNG_cMax = np.max(PNG_mesh_data) # None表示自動
# 檢查是否所有數值都相同
if PNG_cMin == PNG_cMax:
    # 如果全部相同，設定極小的偏移量
    PNG_cMin = PNG_cMin - 0.000001
    PNG_cMax = PNG_cMax + 0.000001
PNG_DPI = 100
PNG_Width = 1280
PNG_Height = 720    
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_01_InputFullMesh.png')
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
# 繪製網格
ax, cbar = pg.show(PNG_mesh, 
    data=PNG_mesh_data, 
    ax=ax,
    markers=False,
    showMesh=PNG_mesh_showMesh,
    showBoundary=PNG_mesh_showBoundary,  
    label=PNG_colorbar_title,     # colorbar的標題。
    axisLabels=False,             # 阻止自動標籤(否則特定條件下會把Y軸轉換成深度)。後面自行填入標籤。
    cMap=PNG_cMap,
    cMin=PNG_cMin,
    cMax=PNG_cMax)
# 繪製電極
ax.plot(PNG_NumPy_Electrode_x, PNG_NumPy_Electrode_y, 'o', markersize=6, color='magenta', markerfacecolor='magenta', markeredgecolor='black', label='Electrode Nodes')    
ax.set_title(PNG_Main_Title, pad=3)  
# 調整XY標籤
ax.set_xlabel('Distance (m)')
ax.set_ylabel('Elevation (m)')
# 調整圖例
ax.legend(loc='upper right',ncol=2,framealpha=0.4)
# 調整colorbar內文字
if PNG_colorbar_ticker_ModifyLog10ToLinear_Enable:
    cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda x, pos: f'{10**x:.1f}'.rstrip('0').rstrip('.')))    
    cbar.ax.xaxis.get_offset_text().set_visible(False) # 避免顯示 1eX
    cbar.set_label(PNG_colorbar_ticker_ModifyLog10ToLinear_title) # 使用你設定的 Ωm 標題
else:
    cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
    cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
# 調整邊界
x_min, x_max = ax.get_xlim()
y_min, y_max = ax.get_ylim()
x_range = x_max - x_min
y_range = y_max - y_min
ax.set_ylim(y_min , y_max + 0.1 * y_range)
#--
#print(f'儲存 {PNG_Profile_Name} 圖片...')
#Output_PNG_FileName = 'ABCD.png'
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
plt.close()
#print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
#==============================================================================
#==============================================================================
# Pygimli網格繪圖:  繪製研究區域網格剖面(電阻率、電極位置、網格資訊)
#--
# 可填入的資訊
Main_FileName = temp_json_data["Output_MainFileName"]
PNG_Profile_Name = Main_FileName
PNG_NumPy_Electrode_x = Ohm_data.sensors().array()[:, 0]
PNG_NumPy_Electrode_y = Ohm_data.sensors().array()[:, 1]
PNG_NumPy_Electrode_z = Ohm_data.sensors().array()[:, 2]
PNG_mesh = temp_fop.regionManager().paraDomain()
PNG_mesh_data = mesh['Resistivity_(log10)'][(mesh.cellMarkers() == 2)]
PNG_colorbar_title = 'Resistivity (log10 Ωm)'
PNG_colorbar_ticker_ModifyLog10ToLinear_Enable = True # True = 把colorbar數值文字從對數尺度調整成線性尺度 / False = 維持原本數值
PNG_colorbar_ticker_ModifyLog10ToLinear_title = 'Resistivity (Ωm)'
PNG_Main_Title = f"{PNG_Profile_Name} StudyAreaMesh (" + \
    f"AutoMesh={temp_json_data['Mesh_Setting01_AutoMesh_Enable']}," + \
    f"quality={AutoMesh_quality}," + \
    f"paraDepth={AutoMesh_paraDepth}," + \
    f"boundary={AutoMesh_boundary})\n" + \
    f"(paraMaxCellSize={AutoMesh_paraMaxCellSize}," + \
    f"addNodes={AutoMesh_addNodes}," + \
    f"paraDX={AutoMesh_paraDX}) " + \
    f"Cell Count={np.sum(mesh.cellMarkers() == 1)}+{np.sum(mesh.cellMarkers() == 2)}={mesh.cellCount()}, " + \
    f"Data Count={Ohm_data_All_count}, " + \
    f'Electrode Count={Ohm_data.sensorCount()}'               
PNG_mesh_showMesh = True # True / False
PNG_mesh_showBoundary = True # None / True / False ，某些時候None與True效果相同
PNG_cMap = 'jet'
PNG_cMin = np.min(PNG_mesh_data) # None表示自動
PNG_cMax = np.max(PNG_mesh_data) # None表示自動
# 檢查是否所有數值都相同
if PNG_cMin == PNG_cMax:
    # 如果全部相同，設定極小的偏移量
    PNG_cMin = PNG_cMin - 0.000001
    PNG_cMax = PNG_cMax + 0.000001
PNG_DPI = 100
PNG_Width = 1280
PNG_Height = 720    
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_01_StudyAreaMesh.png')
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
# 繪製網格
ax, cbar = pg.show(PNG_mesh, 
    data=PNG_mesh_data, 
    ax=ax,
    markers=False,
    showMesh=PNG_mesh_showMesh,
    showBoundary=PNG_mesh_showBoundary,  
    label=PNG_colorbar_title,     # colorbar的標題。
    axisLabels=False,             # 阻止自動標籤(否則特定條件下會把Y軸轉換成深度)。後面自行填入標籤。
    cMap=PNG_cMap,
    cMin=PNG_cMin,
    cMax=PNG_cMax)
# 繪製電極
ax.plot(PNG_NumPy_Electrode_x, PNG_NumPy_Electrode_y, 'o', markersize=6, color='magenta', markerfacecolor='magenta', markeredgecolor='black', label='Electrode Nodes')    
ax.set_title(PNG_Main_Title, pad=3)  
# 調整XY標籤
ax.set_xlabel('Distance (m)')
ax.set_ylabel('Elevation (m)')
# 調整圖例
ax.legend(loc='upper right',ncol=2,framealpha=0.4)
# 調整colorbar內文字
if PNG_colorbar_ticker_ModifyLog10ToLinear_Enable:
    cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda x, pos: f'{10**x:.1f}'.rstrip('0').rstrip('.')))    
    cbar.ax.xaxis.get_offset_text().set_visible(False) # 避免顯示 1eX
    cbar.set_label(PNG_colorbar_ticker_ModifyLog10ToLinear_title) # 使用你設定的 Ωm 標題
else:
    cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
    cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
# 調整邊界
x_min, x_max = ax.get_xlim()
y_min, y_max = ax.get_ylim()
x_range = x_max - x_min
y_range = y_max - y_min
ax.set_ylim(y_min , y_max + 0.1 * y_range)
#--
#print(f'儲存 {PNG_Profile_Name} 圖片...')
#Output_PNG_FileName = 'ABCD.png'
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
plt.close()
#print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
#==============================================================================
print('--')
#--------------------------------------------
Data_Settings_Relative_Error_Percentage = temp_json_data["Data_Setting01_Relative_Error_Percentage"]
#--------------------------------------------
# 重新計算幾何因子與視電阻率並指定誤差
print("重新計算幾何因子與視電阻率並指定誤差...")
#--------------------------------------------
if temp_json_data["Data_Setting02_GeometricFactorByMesh_Enable"] == 'Yes' :
    print('**使用指定模型計算的幾何因子!(有考慮地形)')
    #這個棄用Ohm_data['k'] = ert.createGeometricFactors(Ohm_data, mesh=mesh, numerical=True) # 考慮地形使用「numerical=True」並提供「mesh」，考慮水平地層使用「numerical=False」
    # 使用mgr來計算幾何因子
    temp_Ohm_data=Ohm_data.copy()
    # 先填暫時的幾何因子(強制設為1.0)
    temp_Ohm_data['k'] = (temp_Ohm_data['r']*0)+1.0
    # 計算視電阻率(目前視電阻率也是暫時的，只是要騙過管理器)
    temp_Ohm_data["rhoa"] = (temp_Ohm_data['r']*0)+1.0
    # 提供資料估計相對誤差(只是要騙過管理器)
    temp_Ohm_data['err'] = ert.estimateError(temp_Ohm_data, relativeError=Data_Settings_Relative_Error_Percentage/100)  # Estimate relative error
    # 建一個暫時的逆推管理
    print("**建立暫時的ERTManager物件...")
    if temp_json_data["Inversion_Setting09_SR_Enable"] == 'Yes' :
        temp_mgr = ert.ERTManager(temp_Ohm_data, sr=True)
    else:
        temp_mgr = ert.ERTManager(temp_Ohm_data, sr=False)    
    print("**建立暫時的ERTManager物件...完成")
    #--
    print("**使用暫時的管理器運行逆推(maxIter=0)...")
    temp_mgr.invert(mesh=mesh, maxIter=0, startModel=1.0, verbose=False)
    print("**使用暫時的管理器運行逆推maxIter=0...完成!")
    # 計算正確的幾何因子
    k_mesh_true = 1/temp_mgr.inv.response    
    # 計算其他比較用的幾何因子
    if temp_json_data["OutputFile01_GeometricFactor_K_CrossPlot_PNG_Enable"] == 'Yes' :
        #--------------------------------------------
        # 評估幾何因子差異
        #--
        print("--")
        print("***評估幾何因子...")
        # 計算解析解 (假設水平地面)
        k_false = ert.createGeometricFactors(Ohm_data, numerical=False)
        # 計算數值解 (考慮地形)
        if temp_json_data["IdealGeometricFactorByFile_Enable"] == 'Yes' :  #用已經算好的檔案
            print("***使用檔案中算好的理想幾何因子...")
            #--------------------------------------------
            # 讀取資料 Dat檔案
            #--
            print("****載入Dat檔案...")
            Input_IdealGeometricFactor_Dat_FileName = temp_json_data["InputFile04_IdealGeometricFactorByFile_FileName"]
            print(f"****目標檔案: {Input_IdealGeometricFactor_Dat_FileName}")
            IdealGeometricFactor_Dat_data = ert.load(Input_IdealGeometricFactor_Dat_FileName)
            if os.path.exists('invalid.data'):
                os.remove('invalid.data')
            print("****載入Dat檔案...完成!")
            #--
            IdealGeometricFactor_Dat_data_All_count = IdealGeometricFactor_Dat_data.size()
            print(f'****IdealGeometricFactor_Dat: 感應器數量 = {IdealGeometricFactor_Dat_data.sensorCount()}, 資料數量 = {IdealGeometricFactor_Dat_data_All_count}')
            if IdealGeometricFactor_Dat_data_All_count != Ohm_data_All_count:
                print("****觀測資料數量異常!無法繼續分析!")
                exit(1)
            #--
            if not Ohm_data.haveData('k'):
                print("****觀測資料內沒有幾何因子!無法繼續分析!")
                exit(1)
            else:
                k_true = IdealGeometricFactor_Dat_data['k']
            #--------------------------------------------            
        elif temp_json_data["IdealGeometricFactor_Setting01_AutoMesh_Enable"] == 'Yes' :   # 計算數值解 (考慮地形)      
            print("***從參數建立的理想網格計算理想幾何因子...")
            #--------------------------------------------
            kmesh=pg.meshtools.createParaMesh(
                Ohm_data,quality=temp_json_data["IdealGeometricFactor_Setting02_AutoMesh_quality"],
                paraDepth=temp_json_data["IdealGeometricFactor_Setting03_AutoMesh_paraDepth"],
                boundary=temp_json_data["IdealGeometricFactor_Setting04_AutoMesh_boundary"],
                paraMaxCellSize=temp_json_data["IdealGeometricFactor_Setting05_AutoMesh_paraMaxCellSize"],
                addNodes=temp_json_data["IdealGeometricFactor_Setting06_AutoMesh_addNodes"],
                paraDX=temp_json_data["IdealGeometricFactor_Setting07_AutoMesh_paraDX"])
            print(f"****網格節點數量 (KMesh Node Count): {kmesh.nodeCount()}")
            print(f"****網格單元數量 (KMesh Cell Count): {kmesh.cellCount()}")
            print(f"****附加區域網格單元(Marker=1)的單元數量(KMesh Cell Marker=1 Count): {np.sum(kmesh.cellMarkers() == 1)}")
            print(f"****研究區域網格單元(Marker=2)的單元數量(KMesh Cell Marker=2 Count): {np.sum(kmesh.cellMarkers() == 2)}")
            print(f"****網格邊界數量 (KMesh Boundary Count): {kmesh.boundaryCount()}")
            #--------------------------------------------
            # 填入預設電阻率
            kmesh['Resistivity'] = np.ones(kmesh.cellCount())
            kmesh['Resistivity_(log10)'] = np.log10(kmesh['Resistivity'])
            #--------------------------------------------
            # 使用mgr來計算幾何因子
            temp_Ohm_data=Ohm_data.copy()
            # 先填暫時的幾何因子(強制設為1.0)
            temp_Ohm_data['k'] = (temp_Ohm_data['r']*0)+1.0
            # 計算視電阻率(目前視電阻率也是暫時的，只是要騙過管理器)
            temp_Ohm_data["rhoa"] = (temp_Ohm_data['r']*0)+1.0
            # 提供資料估計相對誤差(只是要騙過管理器)
            temp_Ohm_data['err'] = ert.estimateError(temp_Ohm_data, relativeError=Data_Settings_Relative_Error_Percentage/100)  # Estimate relative error
            # 建一個暫時的逆推管理
            print("****建立暫時的ERTManager物件...")
            if temp_json_data["Inversion_Setting09_SR_Enable"] == 'Yes' :
                temp_mgr = ert.ERTManager(temp_Ohm_data, sr=True)
            else:
                temp_mgr = ert.ERTManager(temp_Ohm_data, sr=False)    
            print("****建立暫時的ERTManager物件...完成")
            #--
            print("****使用暫時的管理器運行逆推(maxIter=0)...")
            temp_mgr.invert(mesh=kmesh, maxIter=0, startModel=1.0, verbose=False)
            print("****使用暫時的管理器運行逆推maxIter=0...完成!")
            # 計算正確的幾何因子
            k_true = 1/temp_mgr.inv.response
        else :
            print("***Pygimli內建計算理想幾何因子...")
            k_true = ert.createGeometricFactors(Ohm_data, numerical=True)
        # 計算數值解 (使用指定模型考慮地形)
        #這個棄用k_mesh_true = ert.createGeometricFactors(Ohm_data, mesh=mesh, numerical=True)
        #k_mesh_true = Ohm_data['k']
        print("***評估幾何因子...完成!")
        print("--")
        #--------------------------------------------
    Ohm_data['k'] = k_mesh_true
    k_Ideal = k_true
else:
    print('**使用解析解公式的幾何因子!請注意僅適用水平地層!')
    # 解析解公式的幾何因子
    k_false = ert.createGeometricFactors(Ohm_data, numerical=False)    
    # 計算其他比較用的幾何因子
    if temp_json_data["OutputFile01_GeometricFactor_K_CrossPlot_PNG_Enable"] == 'Yes' :
        #--------------------------------------------
        # 評估幾何因子差異
        #--
        print("***評估幾何因子...")
        # 計算解析解 (假設水平地面)
        #k_false = ert.createGeometricFactors(Ohm_data, numerical=False)
        # 計算數值解 (考慮地形)
        k_true = Ohm_data['k']*0 +1 # 用假的
        # 計算數值解 (使用指定模型考慮地形)
        #這個棄用k_mesh_true = ert.createGeometricFactors(Ohm_data, mesh=mesh, numerical=True)
        # 使用mgr來計算幾何因子
        temp_Ohm_data=Ohm_data.copy()
        # 先填暫時的幾何因子(強制設為1.0)
        temp_Ohm_data['k'] = (temp_Ohm_data['r']*0)+1.0
        # 計算視電阻率(目前視電阻率也是暫時的，只是要騙過管理器)
        temp_Ohm_data["rhoa"] = (temp_Ohm_data['r']*0)+1.0
        # 提供資料估計相對誤差(只是要騙過管理器)
        temp_Ohm_data['err'] = ert.estimateError(temp_Ohm_data, relativeError=Data_Settings_Relative_Error_Percentage/100)  # Estimate relative error
        # 建一個暫時的逆推管理
        print("***建立暫時的ERTManager物件...")
        if temp_json_data["Inversion_Setting09_SR_Enable"] == 'Yes' :
            temp_mgr = ert.ERTManager(temp_Ohm_data, sr=True)
        else:
            temp_mgr = ert.ERTManager(temp_Ohm_data, sr=False)    
        print("***建立暫時的ERTManager物件...完成")
        #--
        print("使用暫時的管理器運行逆推(maxIter=0)...")
        temp_mgr.invert(mesh=mesh, maxIter=0, startModel=1.0, verbose=False)
        print("***使用暫時的管理器運行逆推maxIter=0...完成!")
        # 計算正確的幾何因子
        k_mesh_true = 1/temp_mgr.inv.response 
        print("***評估幾何因子...完成!")
        #--------------------------------------------
    Ohm_data['k'] = k_false 
    k_Ideal = k_false  
if temp_json_data["Data_Setting00_RecalculateDataMode"] == 'rhoa' and Ohm_data.haveData('rhoa') :
    print("採用檔案中的「rhoa」欄位!")
    # 計算正確的V/I(重新計算)
    Ohm_data["r"] = Ohm_data["rhoa"]/Ohm_data["k"]
    print(Ohm_data["r"])
    print(Ohm_data["rhoa"])
    # 提供資料估計相對誤差
    Ohm_data['err'] = ert.estimateError(Ohm_data, relativeError=Data_Settings_Relative_Error_Percentage/100)  # Estimate relative error
    # 確保有電流欄位
    if not Ohm_data.haveData('i'):
        Ohm_data['i'] = (Ohm_data['r']*0)+1.0
else:
    print("採用檔案中的「r」欄位!")
    # 計算正確的視電阻率(重新計算)
    Ohm_data["rhoa"] = Ohm_data["r"] * Ohm_data["k"]
    # 提供資料估計相對誤差
    Ohm_data['err'] = ert.estimateError(Ohm_data, relativeError=Data_Settings_Relative_Error_Percentage/100)  # Estimate relative error
    # 確保有電流欄位
    if not Ohm_data.haveData('i'):
        Ohm_data['i'] = (Ohm_data['r']*0)+1.0
print("重新計算幾何因子與視電阻率並指定誤差...完成!")
#--------------------------------------------
print("--")
if temp_json_data["OutputFile01_GeometricFactor_K_CrossPlot_PNG_Enable"] == 'Yes' :
    #--------------------------------------------
    # Cross Plot K
    #--
    Main_FileName = temp_json_data["Output_MainFileName"]
    temp_PNG_DPI = 100
    temp_PNG_Width = 1280
    temp_PNG_Height = 720
    #--
    # 建立畫布
    fig, axes = plt.subplots(1, 3, figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
    #--
    # 子圖1
    #--
    # 繪製資料點
    k_false_positive_positive = k_false[(k_false > 0) & (k_true > 0)]
    k_true_positive_positive = k_true[(k_false > 0) & (k_true > 0)]
    axes[0].scatter(k_false_positive_positive, k_true_positive_positive, alpha=0.5, s=5, c='blue',label=f'1+2+({len(k_false_positive_positive)})')
    k_false_positive_negative = k_false[(k_false > 0) & (k_true < 0)]
    k_true_positive_negative = k_true[(k_false > 0) & (k_true < 0)]
    axes[0].scatter(k_false_positive_negative, k_true_positive_negative, alpha=0.5, s=5, c='blue',label=f'1+2-({len(k_false_positive_negative)})')
    k_false_negative_negative = k_false[(k_false < 0) & (k_true < 0)]
    k_true_negative_negative = k_true[(k_false < 0) & (k_true < 0)]
    axes[0].scatter(k_false_negative_negative, k_true_negative_negative, alpha=0.5, s=5, c='blue',label=f'1-2-({len(k_false_negative_negative)})')
    k_false_negative_positive = k_false[(k_false < 0) & (k_true > 0)]
    k_true_negative_positive = k_true[(k_false < 0) & (k_true > 0)]
    axes[0].scatter(k_false_negative_positive, k_true_negative_positive, alpha=0.5, s=5, c='blue',label=f'1-2+({len(k_false_negative_positive)})')
    # 設定等比例
    axes[0].set_aspect('equal', adjustable='box')
    # 畫出 1:1 參考線
    lims = [
        np.min([axes[0].get_xlim(), axes[0].get_ylim()]),
        np.max([axes[0].get_xlim(), axes[0].get_ylim()]),
    ]
    axes[0].plot(lims, lims, '--', c='gray', alpha=0.75, zorder=0, label='1:1 Line')
    #--
    # 調整繪圖參數
    axes[0].set_xlabel(f'1: Half-space Analytical Solution K (m)')
    axes[0].set_ylabel(f'2: Ideal Numerical Solution K (m)')
    axes[0].set_title(f'#1 Geometric Factor K Cross Plot(Linear)\nData Count = {len(k_false_positive_positive)+len(k_false_positive_negative)+len(k_false_negative_negative)+len(k_false_negative_positive)}')
    axes[0].legend(loc='upper left')
    #--
    # 子圖2
    #--
    # 繪製資料點
    k_false_positive_positive = k_false[(k_false > 0) & (k_mesh_true > 0)]
    k_mesh_true_positive_positive = k_mesh_true[(k_false > 0) & (k_mesh_true > 0)]
    axes[1].scatter(k_false_positive_positive, k_mesh_true_positive_positive, alpha=0.5, s=5, c='blue',label=f'1+2+({len(k_false_positive_positive)})')
    k_false_positive_negative = k_false[(k_false > 0) & (k_mesh_true < 0)]
    k_mesh_true_positive_negative = k_mesh_true[(k_false > 0) & (k_mesh_true < 0)]
    axes[1].scatter(k_false_positive_negative, k_mesh_true_positive_negative, alpha=0.5, s=5, c='blue',label=f'1+2-({len(k_false_positive_negative)})')
    k_false_negative_negative = k_false[(k_false < 0) & (k_mesh_true < 0)]
    k_mesh_true_negative_negative = k_mesh_true[(k_false < 0) & (k_mesh_true < 0)]
    axes[1].scatter(k_false_negative_negative, k_mesh_true_negative_negative, alpha=0.5, s=5, c='blue',label=f'1-2-({len(k_false_negative_negative)})')
    k_false_negative_positive = k_false[(k_false < 0) & (k_mesh_true > 0)]
    k_mesh_true_negative_positive = k_mesh_true[(k_false < 0) & (k_mesh_true > 0)]
    axes[1].scatter(k_false_negative_positive, k_mesh_true_negative_positive, alpha=0.5, s=5, c='blue',label=f'1-2+({len(k_false_negative_positive)})')
    # 設定等比例
    axes[1].set_aspect('equal', adjustable='box')
    # 畫出 1:1 參考線
    lims = [
        np.min([axes[1].get_xlim(), axes[1].get_ylim()]),
        np.max([axes[1].get_xlim(), axes[1].get_ylim()]),
    ]
    axes[1].plot(lims, lims, '--', c='gray', alpha=0.75, zorder=0, label='1:1 Line')
    #--
    # 調整繪圖參數
    axes[1].set_xlabel(f'1: Half-space Analytical Solution K (m)')
    axes[1].set_ylabel(f'2: Custom-Mesh Numerical Solution K (m)')
    axes[1].set_title(f'#2 Geometric Factor K Cross Plot(Linear)\nData Count = {len(k_false_positive_positive)+len(k_false_positive_negative)+len(k_false_negative_negative)+len(k_false_negative_positive)}')
    axes[1].legend(loc='upper left')
    #--
    # 子圖3
    #--
    # 繪製資料點
    k_true_positive_positive = k_true[(k_true > 0) & (k_mesh_true > 0)]
    k_mesh_true_positive_positive = k_mesh_true[(k_true > 0) & (k_mesh_true > 0)]
    axes[2].scatter(k_true_positive_positive, k_mesh_true_positive_positive, alpha=0.5, s=5, c='blue',label=f'1+2+({len(k_true_positive_positive)})')
    k_true_positive_negative = k_true[(k_true > 0) & (k_mesh_true < 0)]
    k_mesh_true_positive_negative = k_mesh_true[(k_true > 0) & (k_mesh_true < 0)]
    axes[2].scatter(k_true_positive_negative, k_mesh_true_positive_negative, alpha=0.5, s=5, c='blue',label=f'1+2-({len(k_true_positive_negative)})')
    k_true_negative_negative = k_true[(k_true < 0) & (k_mesh_true < 0)]
    k_mesh_true_negative_negative = k_mesh_true[(k_true < 0) & (k_mesh_true < 0)]
    axes[2].scatter(k_true_negative_negative, k_mesh_true_negative_negative, alpha=0.5, s=5, c='blue',label=f'1-2-({len(k_true_negative_negative)})')
    k_true_negative_positive = k_true[(k_true < 0) & (k_mesh_true > 0)]
    k_mesh_true_negative_positive = k_mesh_true[(k_true < 0) & (k_mesh_true > 0)]
    axes[2].scatter(k_true_negative_positive, k_mesh_true_negative_positive, alpha=0.5, s=5, c='blue',label=f'1-2+({len(k_true_negative_positive)})')
    # 設定等比例
    axes[2].set_aspect('equal', adjustable='box')
    # 畫出 1:1 參考線
    lims = [
        np.min([axes[2].get_xlim(), axes[2].get_ylim()]),
        np.max([axes[2].get_xlim(), axes[2].get_ylim()]),
    ]
    axes[2].plot(lims, lims, '--', c='gray', alpha=0.75, zorder=0, label='1:1 Line')
    #--
    # 調整繪圖參數
    axes[2].set_xlabel(f'1: Ideal Numerical Solution K (m)')
    axes[2].set_ylabel(f'2: Custom-Mesh Numerical Solution K (m)')
    axes[2].set_title(f'#3 Geometric Factor K Cross Plot(Linear)\nData Count = {len(k_true_positive_positive)+len(k_true_positive_negative)+len(k_true_negative_negative)+len(k_true_negative_positive)}')
    axes[2].legend(loc='upper left')
    #--
    # 填入總標題
    fig.suptitle(f'{Main_FileName}\n{os.path.splitext(os.path.basename(Input_Ohm_FileName))[0]}\nGeometric Factor K Cross Plot', fontsize=16, fontweight='bold', y =0.9)  
    # 填入版本資訊
    fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    #--
    print(f'儲存K_CrossPlot圖片...')
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_02_CrossPlot_K.png')
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
    plt.close()
    print(f'儲存K_CrossPlot圖片...完成!')
    #--------------------------------------------
    print("--")
#--------------------------------------------
# 繪圖 V/I All
Main_FileName = temp_json_data["Output_MainFileName"]
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
# 使用 ert.show() 來顯示資料，並自動決定色階範圍
ax, cbar = ert.show(
      Ohm_data,                    # 必須的參數：DataContainerERT 物件
      vals=Ohm_data['r'],          # 要繪製的數據
      ax=ax,                       # 指定畫在剛才建立的 ax 上
      logScale=False,              # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      label='V/I (Ω)',             # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
# 確保是座標軸對象，並加入標題與軸標籤
ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nV/I Distribution ({Ohm_data_All_count}) Min/Max={np.min(Ohm_data['r']):.6f}/{np.max(Ohm_data['r']):.6f}", fontsize=14)
ax.set_xlabel("")
# 不用科學記號的 colorbar 數值
cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
print(f'儲存 V/I All圖片...')
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_Distribution_VoverI_All.png')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存 V/I All圖片...完成!')
#--------------------------------------------
print('--')
#--------------------------------------------
# 繪圖 Voltage All
Main_FileName = temp_json_data["Output_MainFileName"]
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
# 使用 ert.show() 來顯示資料，並自動決定色階範圍
ax, cbar = ert.show(
      Ohm_data,                    # 必須的參數：DataContainerERT 物件
      vals=Ohm_data['r']*Ohm_data['i'],          # 要繪製的數據
      ax=ax,                       # 指定畫在剛才建立的 ax 上
      logScale=False,              # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      label='Voltage (V)',         # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
# 確保是座標軸對象，並加入標題與軸標籤
ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nVoltage Distribution ({Ohm_data_All_count}) Min/Max={np.min(Ohm_data['r']*Ohm_data['i']):.6f}/{np.max(Ohm_data['r']*Ohm_data['i']):.6f}", fontsize=14)
ax.set_xlabel("")
# 不用科學記號的 colorbar 數值
cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
print(f'儲存 Voltage All圖片...')
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_Distribution_V_All.png')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存 Voltage All圖片...完成!')
#--------------------------------------------
print('--')
#--------------------------------------------
# 繪圖 Current All
Main_FileName = temp_json_data["Output_MainFileName"]
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
# 使用 ert.show() 來顯示資料，並自動決定色階範圍
ax, cbar = ert.show(
      Ohm_data,                    # 必須的參數：DataContainerERT 物件
      vals=Ohm_data['i'],          # 要繪製的數據
      ax=ax,                       # 指定畫在剛才建立的 ax 上
      logScale=False,              # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      label='Current (A)',             # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
# 確保是座標軸對象，並加入標題與軸標籤
ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nCurrent Distribution ({Ohm_data_All_count}) Min/Max={np.min(Ohm_data['i']):.6f}/{np.max(Ohm_data['i']):.6f}", fontsize=14)
ax.set_xlabel("")
# 不用科學記號的 colorbar 數值
cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
print(f'儲存 Current All圖片...')
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_Distribution_I_All.png')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存 Current All圖片...完成!')
#--------------------------------------------
print('--')
#--------------------------------------------
# 繪圖 AppRes All
Main_FileName = temp_json_data["Output_MainFileName"]
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
# 使用 ert.show() 來顯示資料，並自動決定色階範圍
ax, cbar = ert.show(
      Ohm_data,                    # 必須的參數：DataContainerERT 物件
      vals=Ohm_data['rhoa'],       # 要繪製的數據
      ax=ax,                       # 指定畫在剛才建立的 ax 上
      logScale=True,              # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      label='Apparent resistivity (Ωm)',                  # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
# 確保是座標軸對象，並加入標題與軸標籤
ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nApparent Resistivity Distribution ({Ohm_data_All_count}) Min/Max={np.min(Ohm_data['rhoa']):.6f}/{np.max(Ohm_data['rhoa']):.6f}", fontsize=14)
ax.set_xlabel("")
# 不用科學記號的 colorbar 數值
cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
print(f'儲存 AppRes All圖片...')
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_Distribution_AppRes_All.png')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存 AppRes All圖片...完成!')
#--------------------------------------------
print('--')
#--------------------------------------------
# 繪圖 Error All
Main_FileName = temp_json_data["Output_MainFileName"]
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
# 使用 ert.show() 來顯示資料，並自動決定色階範圍
ax, cbar = ert.show(
      Ohm_data,                    # 必須的參數：DataContainerERT 物件
      vals=Ohm_data['err']*100,    # 要繪製的數據
      ax=ax,                       # 指定畫在剛才建立的 ax 上
      logScale=False,              # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      label='Error (%)',           # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
# 確保是座標軸對象，並加入標題與軸標籤
ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nError Distribution ({Ohm_data_All_count}) ({Ohm_data_All_count}) Min/Max={np.min(Ohm_data['err']*100):.6f}/{np.max(Ohm_data['err']*100):.6f}", fontsize=14)
ax.set_xlabel("")
# 不用科學記號的 colorbar 數值
cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
print(f'儲存 Error All圖片...')
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_Distribution_Error_All.png')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存 Error All圖片...完成!')
#--------------------------------------------
print('--')
#--------------------------------------------
# 繪圖 Geometric_Factor All
Main_FileName = temp_json_data["Output_MainFileName"]
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
# 使用 ert.show() 來顯示資料，並自動決定色階範圍
ax, cbar = ert.show(
      Ohm_data,                    # 必須的參數：DataContainerERT 物件
      vals=Ohm_data['k'],          # 要繪製的數據
      ax=ax,                       # 指定畫在剛才建立的 ax 上
      logScale=False,              # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      label='K (m)',               # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
# 確保是座標軸對象，並加入標題與軸標籤
ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nGeometric Factor K Distribution ({Ohm_data_All_count}) Min/Max={np.min(Ohm_data['k']):.6f}/{np.max(Ohm_data['k']):.6f}", fontsize=14)
ax.set_xlabel("")
# 不用科學記號的 colorbar 數值
cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
print(f'儲存 Geometric_Factor All圖片...')
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_Distribution_K_All.png')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存 Geometric_Factor All圖片...完成!')
#--------------------------------------------
print('--')
#--------------------------------------------
# 繪圖 Geometric_Factor MeshEffect = k_Simulated / k_Ideal
Main_FileName = temp_json_data["Output_MainFileName"]
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
Ohm_data['MeshEffect'] = Ohm_data['k'] / k_Ideal *100 #MeshEffect = k_Simulated / k_Ideal
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
# 使用 ert.show() 來顯示資料，並自動決定色階範圍
ax, cbar = ert.show(
      Ohm_data,                    # 必須的參數：DataContainerERT 物件
      vals=Ohm_data['MeshEffect'],          # 要繪製的數據
      ax=ax,                       # 指定畫在剛才建立的 ax 上
      logScale=False,              # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      label='MeshEffect (%)',               # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
# 確保是座標軸對象，並加入標題與軸標籤
if temp_json_data["Data_Setting02_GeometricFactorByMesh_Enable"] == 'Yes' :
    ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nMeshEffect(k_Simulated / k_Ideal) Distribution ({Ohm_data_All_count}) Min/Max={np.min(Ohm_data['MeshEffect']):.6f}/{np.max(Ohm_data['MeshEffect']):.6f}", fontsize=14)
else:
    ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nMeshEffect(k_Ideal / k_Ideal) Distribution ({Ohm_data_All_count}) Min/Max={np.min(Ohm_data['MeshEffect']):.6f}/{np.max(Ohm_data['MeshEffect']):.6f}", fontsize=14)
ax.set_xlabel("")
# 不用科學記號的 colorbar 數值
cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
print(f'儲存 Geometric_Factor MeshEffect圖片...')
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_Distribution_MeshEffect_All.png')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存 Geometric_Factor MeshEffect圖片...完成!')
#--------------------------------------------
print('--')
if temp_json_data["Data_Setting12_UseFakeData_Enable"] == 'Yes' :
    print("使用假的視電阻率資料...")
    Ohm_data['rhoa'] = (Ohm_data['rhoa']*0) + 1
    Ohm_data['r'] = Ohm_data['rhoa']/Ohm_data['k']
    Ohm_data['i'] = (Ohm_data['i']*0) + 1
    Ohm_data_Accept_count = Ohm_data.size()
    All_Electrode_Index_1Base = np.arange(Ohm_data.sensorCount())
    All_Electrode_Index_0Base = All_Electrode_Index_1Base-1
    Bad_Electrode_Index_1Base = np.array([])
    Bad_Electrode_Index_0Base = Bad_Electrode_Index_1Base-1
    Good_Electrode_Index_1Base = All_Electrode_Index_1Base
    Good_Electrode_Index_0Base = Good_Electrode_Index_1Base-1
    print("使用假的視電阻率資料...完成!")
else:
    #--------------------------------------------
    print("移除負的視電阻率資料...")
    # PyGimli本來就不允許電阻率為0，所以不必特別移除為0的
    print(f"移除之前的觀測資料數量: {Ohm_data_All_count}")
    Ohm_data.remove(Ohm_data['rhoa'] < 0)
    Ohm_data_Accept_count = Ohm_data.size()
    print(f"移除之後的觀測資料數量: {Ohm_data_Accept_count}")
    print("移除負的視電阻率資料...完成!")
    print('--')
    #--
    print(f"移除過小電流(<{temp_json_data["Data_Setting03_RemoveLowCurrentData_LowerThan_A"]}[A])的視電阻率資料...")
    print(f"移除之前的觀測資料數量: {Ohm_data_All_count}")
    Ohm_data.remove(Ohm_data['i'] < temp_json_data["Data_Setting03_RemoveLowCurrentData_LowerThan_A"])
    Ohm_data_Accept_count = Ohm_data.size()
    print(f"移除之後的觀測資料數量: {Ohm_data_Accept_count}")
    print(f"移除過小電流(<{temp_json_data["Data_Setting03_RemoveLowCurrentData_LowerThan_A"]}[A])的視電阻率資料...完成!")
    print('--')
    #--
    print(f"移除過大電流(>{temp_json_data["Data_Setting04_RemoveHighCurrentData_HigherThan_A"]}[A])的視電阻率資料...")
    print(f"移除之前的觀測資料數量: {Ohm_data_All_count}")
    Ohm_data.remove(Ohm_data['i'] > temp_json_data["Data_Setting04_RemoveHighCurrentData_HigherThan_A"])
    Ohm_data_Accept_count = Ohm_data.size()
    print(f"移除之後的觀測資料數量: {Ohm_data_Accept_count}")
    print(f"移除過大電流(>{temp_json_data["Data_Setting04_RemoveHighCurrentData_HigherThan_A"]}[A])的視電阻率資料...完成!")
    print('--')
    #--
    print(f"移除過小電壓(<{temp_json_data["Data_Setting05_RemoveLowVoltageData_LowerThan_V"]}[V])的視電阻率資料...")
    print(f"移除之前的觀測資料數量: {Ohm_data_All_count}")
    Ohm_data.remove((Ohm_data['r']*Ohm_data['i']) < temp_json_data["Data_Setting05_RemoveLowVoltageData_LowerThan_V"])
    Ohm_data_Accept_count = Ohm_data.size()
    print(f"移除之後的觀測資料數量: {Ohm_data_Accept_count}")
    print(f"移除過小電壓(<{temp_json_data["Data_Setting05_RemoveLowVoltageData_LowerThan_V"]}[V])的視電阻率資料...完成!")
    print('--')
    #--
    print(f"移除過大電壓(>{temp_json_data["Data_Setting06_RemoveHighVoltageData_HigherThan_V"]}[V])的視電阻率資料...")
    print(f"移除之前的觀測資料數量: {Ohm_data_All_count}")
    Ohm_data.remove((Ohm_data['r']*Ohm_data['i']) > temp_json_data["Data_Setting06_RemoveHighVoltageData_HigherThan_V"])
    Ohm_data_Accept_count = Ohm_data.size()
    print(f"移除之後的觀測資料數量: {Ohm_data_Accept_count}")
    print(f"移除過大電壓(>{temp_json_data["Data_Setting06_RemoveHighVoltageData_HigherThan_V"]}[V])的視電阻率資料...完成!")
    print('--')
    #--
    print(f"移除過小視電阻率(<{temp_json_data["Data_Setting07_RemoveLowAppResData_LowerThan_OhmM"]}[Ohm-m])的視電阻率資料...")
    print(f"移除之前的觀測資料數量: {Ohm_data_All_count}")
    Ohm_data.remove(Ohm_data['rhoa'] < temp_json_data["Data_Setting07_RemoveLowAppResData_LowerThan_OhmM"])
    Ohm_data_Accept_count = Ohm_data.size()
    print(f"移除之後的觀測資料數量: {Ohm_data_Accept_count}")
    print(f"移除過小視電阻率(<{temp_json_data["Data_Setting07_RemoveLowAppResData_LowerThan_OhmM"]}[Ohm-m])的視電阻率資料...完成!")
    print('--')
    #--
    print(f"移除過大視電阻率(>{temp_json_data["Data_Setting08_RemoveHighAppResData_HigherThan_OhmM"]}[Ohm-m])的視電阻率資料...")
    print(f"移除之前的觀測資料數量: {Ohm_data_All_count}")
    Ohm_data.remove(Ohm_data['rhoa'] > temp_json_data["Data_Setting08_RemoveHighAppResData_HigherThan_OhmM"])
    Ohm_data_Accept_count = Ohm_data.size()
    print(f"移除之後的觀測資料數量: {Ohm_data_Accept_count}")
    print(f"移除過大視電阻率(>{temp_json_data["Data_Setting08_RemoveHighAppResData_HigherThan_OhmM"]}[Ohm-m])的視電阻率資料...完成!")
    print('--')
    #--
    print(f"移除過小網格效應(<{temp_json_data["Data_Setting10_RemoveLowMeshEffectData_LowerThan_Percent"]}[%])的視電阻率資料...")
    print(f"移除之前的觀測資料數量: {Ohm_data_All_count}")
    Ohm_data.remove(Ohm_data['MeshEffect'] < temp_json_data["Data_Setting10_RemoveLowMeshEffectData_LowerThan_Percent"])
    Ohm_data_Accept_count = Ohm_data.size()
    print(f"移除之後的觀測資料數量: {Ohm_data_Accept_count}")
    print(f"移除過小網格效應(<{temp_json_data["Data_Setting10_RemoveLowMeshEffectData_LowerThan_Percent"]}[%])的視電阻率資料...完成!")
    print('--')
    #--
    print(f"移除過大網格效應(>{temp_json_data["Data_Setting11_RemoveHighMeshEffectData_HigherThan_Percent"]}[%])的視電阻率資料...")
    print(f"移除之前的觀測資料數量: {Ohm_data_All_count}")
    Ohm_data.remove(Ohm_data['MeshEffect'] > temp_json_data["Data_Setting11_RemoveHighMeshEffectData_HigherThan_Percent"])
    Ohm_data_Accept_count = Ohm_data.size()
    print(f"移除之後的觀測資料數量: {Ohm_data_Accept_count}")
    print(f"移除過大網格效應(>{temp_json_data["Data_Setting11_RemoveHighMeshEffectData_HigherThan_Percent"]}[%])的視電阻率資料...完成!")
    print('--')
    #--
    All_Electrode_Index_1Base = np.arange(Ohm_data.sensorCount())
    All_Electrode_Index_0Base = All_Electrode_Index_1Base-1
    Bad_Electrode_Index_1Base = np.array(temp_json_data["Data_Setting09_RemoveBadElectrodeData_List"])
    Bad_Electrode_Index_0Base = Bad_Electrode_Index_1Base-1
    Good_Electrode_Index_1Base = All_Electrode_Index_1Base[~np.isin(All_Electrode_Index_1Base, Bad_Electrode_Index_1Base)]
    Good_Electrode_Index_0Base = Good_Electrode_Index_1Base-1
    print(f"移除不採用(損壞)電極(數量={len(Bad_Electrode_Index_1Base)},清單={Bad_Electrode_Index_1Base})的視電阻率資料...")
    print(f"移除之前的觀測資料數量: {Ohm_data_All_count}")
    for sensor in ['a', 'b', 'm', 'n']:
        Ohm_data.remove(np.isin(Ohm_data[sensor], Bad_Electrode_Index_1Base))
    Ohm_data_Accept_count = Ohm_data.size()
    print(f"移除之後的觀測資料數量: {Ohm_data_Accept_count}")
    print(f"移除不採用(損壞)電極(數量={len(Bad_Electrode_Index_1Base)},清單={Bad_Electrode_Index_1Base})的視電阻率資料...完成!")
    #--------------------------------------------
if Ohm_data_Accept_count == 0:
    print('--')
    print(f"錯誤：沒有可用的觀測資料。觀測資料數量 = {Ohm_data_Accept_count}。")
    print('--')
    exit(1)
print('--')
#--------------------------------------------
# 繪圖 V/I Accept
Main_FileName = temp_json_data["Output_MainFileName"]
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
# 使用 ert.show() 來顯示資料，並自動決定色階範圍
ax, cbar = ert.show(
      Ohm_data,                    # 必須的參數：DataContainerERT 物件
      vals=Ohm_data['r'],          # 要繪製的數據
      ax=ax,                       # 指定畫在剛才建立的 ax 上
      logScale=False,              # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      label='V/I (Ω)',                  # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
# 確保是座標軸對象，並加入標題與軸標籤
ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nAccepted V/I Distribution ({Ohm_data_Accept_count}/{Ohm_data_All_count}) Min/Max={np.min(Ohm_data['r']):.6f}/{np.max(Ohm_data['r'])}:.6f", fontsize=14)
ax.set_xlabel("")
# 不用科學記號的 colorbar 數值
cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
print(f'儲存 V/I Accept圖片...')
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_Distribution_VoverI_Accept.png')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存 V/I Accept圖片...完成!')
#--------------------------------------------
print('--')
#--------------------------------------------
# 繪圖 Voltage Accept
Main_FileName = temp_json_data["Output_MainFileName"]
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
# 使用 ert.show() 來顯示資料，並自動決定色階範圍
ax, cbar = ert.show(
      Ohm_data,                    # 必須的參數：DataContainerERT 物件
      vals=Ohm_data['r']*Ohm_data['i'],          # 要繪製的數據
      ax=ax,                       # 指定畫在剛才建立的 ax 上
      logScale=False,              # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      label='Voltage (V)',         # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
# 確保是座標軸對象，並加入標題與軸標籤
ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nAccepted Voltage Distribution ({Ohm_data_Accept_count}/{Ohm_data_All_count}) Min/Max={np.min(Ohm_data['r']*Ohm_data['i']):.6f}/{np.max(Ohm_data['r']*Ohm_data['i']):.6f}", fontsize=14)
ax.set_xlabel("")
# 不用科學記號的 colorbar 數值
cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
print(f'儲存 Voltage Accept圖片...')
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_Distribution_V_Accept.png')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存 Voltage Accept圖片...完成!')
#--------------------------------------------
print('--')
#--------------------------------------------
# 繪圖 Current Accept
Main_FileName = temp_json_data["Output_MainFileName"]
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
# 使用 ert.show() 來顯示資料，並自動決定色階範圍
ax, cbar = ert.show(
      Ohm_data,                    # 必須的參數：DataContainerERT 物件
      vals=Ohm_data['i'],          # 要繪製的數據
      ax=ax,                       # 指定畫在剛才建立的 ax 上
      logScale=False,              # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      label='Current (A)',         # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
# 確保是座標軸對象，並加入標題與軸標籤
ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nAccepted Current Distribution ({Ohm_data_Accept_count}/{Ohm_data_All_count}) Min/Max={np.min(Ohm_data['i']):.6f}/{np.max(Ohm_data['i']):.6f}", fontsize=14)
ax.set_xlabel("")
# 不用科學記號的 colorbar 數值
cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
print(f'儲存 Current Accept圖片...')
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_Distribution_I_Accept.png')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存 Current Accept圖片...完成!')
#--------------------------------------------
print('--')
#--------------------------------------------
# 繪圖 AppRes Accept
Main_FileName = temp_json_data["Output_MainFileName"]
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
# 使用 ert.show() 來顯示資料，並自動決定色階範圍
ax, cbar = ert.show(
      Ohm_data,                    # 必須的參數：DataContainerERT 物件
      vals=Ohm_data['rhoa'],       # 要繪製的數據
      ax=ax,                       # 指定畫在剛才建立的 ax 上
      logScale=True,               # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      label='Apparent resistivity (Ωm)',                  # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
# 確保是座標軸對象，並加入標題與軸標籤
ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nAccepted Apparent Resistivity Distribution ({Ohm_data_Accept_count}/{Ohm_data_All_count}) Min/Max={np.min(Ohm_data['rhoa']):.6f}/{np.max(Ohm_data['rhoa']):.6f}", fontsize=14)
ax.set_xlabel("")
# 不用科學記號的 colorbar 數值
cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
print(f'儲存 AppRes Accept圖片...')
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_Distribution_AppRes_Accept.png')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存 AppRes Accept圖片...完成!')
#--------------------------------------------
print('--')
#--------------------------------------------
# 繪圖 Error Accept
Main_FileName = temp_json_data["Output_MainFileName"]
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
# 使用 ert.show() 來顯示資料，並自動決定色階範圍
ax, cbar = ert.show(
      Ohm_data,                    # 必須的參數：DataContainerERT 物件
      vals=Ohm_data['err']*100,    # 要繪製的數據
      ax=ax,                       # 指定畫在剛才建立的 ax 上
      logScale=False,              # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      label='Error (%)',           # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
# 確保是座標軸對象，並加入標題與軸標籤
ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nAccepted Error Distribution ({Ohm_data_Accept_count}/{Ohm_data_All_count}) Min/Max={np.min(Ohm_data['err']*100):.6f}/{np.max(Ohm_data['err']*100):.6f}", fontsize=14)
ax.set_xlabel("")
# 不用科學記號的 colorbar 數值
cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
print(f'儲存 Error Accept圖片...')
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_Distribution_Error_Accept.png')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存 Error Accept圖片...完成!')
#--------------------------------------------
print('--')
#--------------------------------------------
# 繪圖 Geometric_Factor Accept
Main_FileName = temp_json_data["Output_MainFileName"]
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
# 使用 ert.show() 來顯示資料，並自動決定色階範圍
ax, cbar = ert.show(
      Ohm_data,                    # 必須的參數：DataContainerERT 物件
      vals=Ohm_data['k'],          # 要繪製的數據
      ax=ax,                       # 指定畫在剛才建立的 ax 上
      logScale=False,              # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      label='K (m)',               # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
# 確保是座標軸對象，並加入標題與軸標籤
ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nAccepted Geometric Factor K Distribution ({Ohm_data_Accept_count}/{Ohm_data_All_count}) Min/Max={np.min(Ohm_data['k']):.6f}/{np.max(Ohm_data['k']):.6f}", fontsize=14)
ax.set_xlabel("")
# 不用科學記號的 colorbar 數值
cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
print(f'儲存 Geometric_Factor Accept圖片...')
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_Distribution_K_Accept.png')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存 Geometric_Factor Accept圖片...完成!')
#--------------------------------------------
print('--')
#--------------------------------------------
# 繪圖 Geometric_Factor MeshEffect = k_Simulated / k_Ideal Accept
Main_FileName = temp_json_data["Output_MainFileName"]
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
# 使用 ert.show() 來顯示資料，並自動決定色階範圍
ax, cbar = ert.show(
      Ohm_data,                    # 必須的參數：DataContainerERT 物件
      vals=Ohm_data['MeshEffect'],          # 要繪製的數據
      ax=ax,                       # 指定畫在剛才建立的 ax 上
      logScale=False,              # 預設值：根據數據值來決定是否使用對數尺度，這裡默認使用對數尺度
      label='MeshEffect (%)',               # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
      xlabel=None,                 # 預設值：x 軸標籤
      ylabel=None                  # 預設值：y 軸標籤
  )
# 確保是座標軸對象，並加入標題與軸標籤
if temp_json_data["Data_Setting02_GeometricFactorByMesh_Enable"] == 'Yes' :
    ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nAccepted MeshEffect(k_Simulated / k_Ideal) Distribution ({Ohm_data_Accept_count}/{Ohm_data_All_count}) Min/Max={np.min(Ohm_data['MeshEffect']):.6f}/{np.max(Ohm_data['MeshEffect']):.6f}", fontsize=14)
else:
    ax.set_title(f"{os.path.basename(Input_Ohm_FileName)}\nAccepted MeshEffect(k_Ideal / k_Ideal) Distribution ({Ohm_data_Accept_count}/{Ohm_data_All_count}) Min/Max={np.min(Ohm_data['MeshEffect']):.6f}/{np.max(Ohm_data['MeshEffect']):.6f}", fontsize=14)
ax.set_xlabel("")
# 不用科學記號的 colorbar 數值
cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
print(f'儲存 Geometric_Factor MeshEffect圖片...')
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_Distribution_MeshEffect_Accept.png')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存 Geometric_Factor MeshEffect圖片...完成!')
#--------------------------------------------
print('--')
#--------------------------------------------
# 繪圖 直方圖 Accept
#--
Main_FileName = temp_json_data["Output_MainFileName"]
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, axes = plt.subplots(1, 2, figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
#--
# 子圖1 視電阻率分佈直方圖 (Linear-Scale Histogram)
#--
# 直方圖統計 所有值
axes[0].hist(Ohm_data['rhoa'], bins=50, color='skyblue', edgecolor='black', alpha=0.5)
# 加入中位數線 
axes[0].axvline(np.median(Ohm_data['rhoa']), color='red', linestyle='dashed', linewidth=1.5, label=f'Median: {(np.median(Ohm_data["rhoa"])):.2f} (Ωm)')
axes[0].legend()
axes[0].set_title(f"""Apparent Resistivity Histogram (Linear-Scale)
Data count = {Ohm_data_Accept_count}, Min/Max = {np.min(Ohm_data['rhoa']):.2f}/{np.max(Ohm_data['rhoa']):.2f} (Ωm)
Mean/Median/GeometricMean = {np.mean(Ohm_data['rhoa']):.2f}/{np.median(Ohm_data['rhoa']):.2f}/{10**np.mean(np.log10(Ohm_data['rhoa'])):.2f} (Ωm)""", 
fontsize=12)
axes[0].set_xlabel('Apparent Resistivity (Ωm)')
axes[0].set_ylabel('Data Count (Count)')
axes[0].grid(True, linestyle='--', alpha=0.6)
#--
# 子圖2 視電阻率分佈直方圖 (Log-Scale Histogram)
#--
# 直方圖統計 僅正值(因為之前就移除負的，這裡就不特別檢查)
axes[1].hist(np.log10(Ohm_data['rhoa']), bins=50, color='skyblue', edgecolor='black', alpha=0.5)
# 加入中位數線 
axes[1].axvline(np.log10(np.median(Ohm_data['rhoa'])), color='red', linestyle='dashed', linewidth=1.5, label=f'Median: {(np.log10(np.median(Ohm_data["rhoa"]))):.2f} (Log10 Ωm)')
axes[1].legend()
axes[1].set_title(f"""Apparent Resistivity Histogram (Log-Scale)
Data count = {Ohm_data_Accept_count}, Min/Max = {np.log10(np.min(Ohm_data['rhoa'])):.2f}/{np.log10(np.max(Ohm_data['rhoa'])):.2f} (Log10 Ωm)
Mean/Median/GeometricMean = {np.log10(np.mean(Ohm_data['rhoa'])):.2f}/{np.log10(np.median(Ohm_data['rhoa'])):.2f}/{np.mean(np.log10(Ohm_data['rhoa'])):.2f} (Log10 Ωm)""", 
fontsize=12)
axes[1].set_xlabel('Apparent Resistivity (Log10 Ωm)')
axes[1].set_ylabel('Data Count (Count)')
axes[1].grid(True, linestyle='--', alpha=0.6)
#--
# 填入總標題
fig.suptitle(f'{os.path.splitext(os.path.basename(Input_Ohm_FileName))[0]}', fontsize=16, fontweight='bold')  
# 填入版本資訊
fig.text(0.98, 0.005, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
print(f'儲存 AppRes_Histogram 統計圖片...')
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_02_Histogram_AppRes_Accept.png')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存 AppRes_Histogram 統計圖片...完成!')
#--------------------------------------------
print("--")

#--------------------------------------------
# 逐次迭代後運行資訊更新(含畫圖與存檔)
def Inversion_Info_Update(i, inv):
    #--------------------------------------------
    # i 是當前迭代數，inv 是反演物件，但我都不取用，忽略他。
    #--
    Main_FileName = temp_json_data["Output_MainFileName"]
    #--------------------------------------------
    #--------------------------------------------
    # 展示逆推過程資訊    
    Info_Iteration_count = mgr.inv.iter
    print(f"\n--\n目前迭代次數: {Info_Iteration_count}")
    Info_Inversion_dataTrans = str(mgr.inv.dataTrans)
    print(f"逆推運算資料轉換方式: {Info_Inversion_dataTrans}")
    Info_Inversion_modelTrans = str(mgr.inv.modelTrans).replace("\n", " -> ")
    print(f"逆推運算模型轉換方式: {Info_Inversion_modelTrans}")
    if mgr.sr == True :
        print("逆推運算SR技術: 開啟")
        Info_Inversion_SR = 'Yes'
    else :
        print("逆推運算SR技術: 關閉")
        Info_Inversion_SR = 'No'
    if temp_json_data["Data_Setting02_GeometricFactorByMesh_Enable"] == 'Yes' :
        print("逆推運算幾何因子: 數值模擬計算(去除地形效應)")
        Info_GeometricFactorByMesh = 'Yes'
    else :
        print("逆推運算幾何因子: 解析解(僅適用水平地層)")
        Info_GeometricFactorByMesh = 'No'       
    #--------------------------------------------
    #--------------------------------------------
    if temp_json_data["Inversion_Setting05_startModel"] > 0 :        
        Info_LastInversion_StartModelMesh_Value = np.ones(mgr.paraDomain.cellCount()) * Inversion_startModel
    elif temp_json_data["Inversion_Setting05_startModel"] == -2 : 
        Info_LastInversion_StartModelMesh_Value = Inversion_startModel
    elif temp_json_data["Inversion_Setting05_startModel"] == -3 :  
        Info_LastInversion_StartModelMesh_Value = Inversion_startModel
    else :
        Info_LastInversion_StartModelMesh_Value = mgr.inv.startModel
    #print(f"起始模型網格數值內容: {Info_LastInversion_StartModelMesh_Value}")
    Info_LastInversion_StartModelMesh_CellCount = len(Info_LastInversion_StartModelMesh_Value)
    print(f"起始模型網格數量 = {Info_LastInversion_StartModelMesh_CellCount}")
    Info_LastInversion_StartModelMesh_Value_Min = np.min(Info_LastInversion_StartModelMesh_Value)
    Info_LastInversion_StartModelMesh_Value_Max = np.max(Info_LastInversion_StartModelMesh_Value)
    print(f"起始模型網格數值(Min/Max) = {Info_LastInversion_StartModelMesh_Value_Min:.2f}/{Info_LastInversion_StartModelMesh_Value_Max:.2f}")
    #--------------------------------------------    
    print(f"限制模型網格數值(Min/Max) = {Inversion_limitModelCellMinValue:.2f}/{Inversion_limitModelCellMaxValue:.2f}")
    #--------------------------------------------    
    Info_LastInversion_ForwordH2ModelMesh_Value = mgr.fop.createMappedModel(mgr.inv.model) # 研究區域照填，附加區域延續（prolongated）
    #print(f"最後一次迭代的順推H2網格數值內容: {Info_LastInversion_ForwordH2ModelMesh_Value}")
    Info_LastInversion_ForwordH2ModelMesh_CellCount = len(Info_LastInversion_ForwordH2ModelMesh_Value)
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 順推H2網格數值數量 = {Info_LastInversion_ForwordH2ModelMesh_CellCount}")
    Info_LastInversion_ForwordH2ModelMesh_Value_Min = np.min(Info_LastInversion_ForwordH2ModelMesh_Value)
    Info_LastInversion_ForwordH2ModelMesh_Value_Max = np.max(Info_LastInversion_ForwordH2ModelMesh_Value)
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 順推H2網格數值(Min/Max) = {Info_LastInversion_ForwordH2ModelMesh_Value_Min:.2f}/{Info_LastInversion_ForwordH2ModelMesh_Value_Max:.2f}")
    #--
    #print("取出最後一次逆推的H2全網格...")
    LastInversion_H2FullMesh = pg.Mesh(mgr.fop.mesh())
    #print("取出最後一次逆推的H2全網格...完成!")
    #print("最後一次逆推的H2全網格填充數值...")
    LastInversion_H2FullMesh['Resistivity'] = Info_LastInversion_ForwordH2ModelMesh_Value
    LastInversion_H2FullMesh['Resistivity_(log10)'] = np.log10(LastInversion_H2FullMesh['Resistivity'])
    #print("最後一次逆推的H2全網格填充數值...完成!")    
    #--------------------------------------------
    # 輸出VTK
    # 輸出VTK前先把預設該存在的資料填1
    LastInversion_H2FullMesh['Coverage'] = np.ones(LastInversion_H2FullMesh.cellCount())
    LastInversion_H2FullMesh['S_Coverage'] = np.ones(LastInversion_H2FullMesh.cellCount())
    # 輸出    
    LastInversion_H2FullMesh.exportVTK(os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_H2.vtk'))
    #-------------------------------------------- 
    # 整理 MeshBCMarkers
    #--    
    # 印出 index, x1, y1, x2, y2, marker
    #print("index, x1, y1, x2, y2, marker")
    #for i, b in enumerate(mesh.boundaries()):
    #    print(f"{i}, {b.nodes()[0].pos()[0]:.6f}, {b.nodes()[0].pos()[1]:.6f}, {b.nodes()[1].pos()[0]:.6f}, {b.nodes()[1].pos()[1]:.6f}, {b.marker()}")
    #--
    # 儲存MeshMarkers為JSON檔案
    #print('儲存MeshBCMarkers為JSON檔案...')
    # 開啟檔案，以 UTF-8 編碼手動寫入 JSON 內容    
    with open(os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_H2BCMarkers.json'), 'w', encoding='utf-8') as f:
        #--
        # 寫入說明行
        f.write('{\n')
        f.write('"MeshBCMarkers_Readme":"index,x1[m],y1[m],x2[m],y2[m],marker",\n')
        f.write('"MeshBCMarkers":[\n')
        #--
        for i, b in enumerate(LastInversion_H2FullMesh.boundaries()):
            #--
            # 組成一列文字
            line = f'[{i}, {b.nodes()[0].pos()[0]:.6f}, {b.nodes()[0].pos()[1]:.6f}, {b.nodes()[1].pos()[0]:.6f}, {b.nodes()[1].pos()[1]:.6f}, {b.marker()}]'
            # 最後一列不加逗號，其它加逗號
            if i < LastInversion_H2FullMesh.boundaryCount() - 1:
                line += ','
            line += '\n'
            # 寫入
            f.write(line)
            #--
        #--
        # 關閉陣列與大括號
        f.write(']\n')
        f.write('}\n')
        #--
    #print('儲存MeshBCMarkers為JSON檔案...完成!')
    #--------------------------------------------   
    #--------------------------------------------
    Info_LastInversion_InversionModelMesh_Value = mgr.inv.model
    #print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 逆推網格數值內容: {Info_LastInversion_InversionModelMesh_Value}")
    Info_LastInversion_InversionModelMesh_CellCount = len(Info_LastInversion_InversionModelMesh_Value)
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 逆推網格數量 = {Info_LastInversion_InversionModelMesh_CellCount}")
    Info_LastInversion_InversionModelMesh_Value_Min = np.min(Info_LastInversion_InversionModelMesh_Value)
    Info_LastInversion_InversionModelMesh_Value_Max = np.max(Info_LastInversion_InversionModelMesh_Value)
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 逆推網格數值(Min/Max) = {Info_LastInversion_InversionModelMesh_Value_Min:.2f}/{Info_LastInversion_InversionModelMesh_Value_Max:.2f}")
    #--
    #print("取出最後一次逆推的研究區域網格...")
    LastInversion_InversionModelMesh = pg.Mesh(mgr.paraDomain)
    #print("取出最後一次逆推的研究區域網格...完成!")
    #print("最後一次逆推的研究區域網格填充數值...")
    LastInversion_InversionModelMesh['Resistivity'] = Info_LastInversion_InversionModelMesh_Value
    LastInversion_InversionModelMesh['Resistivity_(log10)'] = np.log10(LastInversion_InversionModelMesh['Resistivity'])
    LastInversion_InversionModelMesh['Coverage'] = mgr.coverage()
    LastInversion_InversionModelMesh['S_Coverage'] = mgr.standardizedCoverage()
    #print("最後一次逆推的研究區域網格填充數值...完成!")
    #--------------------------------------------
    # 輸出VTK
    # 輸出    
    LastInversion_InversionModelMesh.exportVTK(os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_INV.vtk'))
    #-------------------------------------------- 
    # 整理 MeshBCMarkers
    #--    
    # 印出 index, x1, y1, x2, y2, marker
    #print("index, x1, y1, x2, y2, marker")
    #for i, b in enumerate(mesh.boundaries()):
    #    print(f"{i}, {b.nodes()[0].pos()[0]:.6f}, {b.nodes()[0].pos()[1]:.6f}, {b.nodes()[1].pos()[0]:.6f}, {b.nodes()[1].pos()[1]:.6f}, {b.marker()}")
    #--
    # 儲存MeshMarkers為JSON檔案
    #print('儲存MeshBCMarkers為JSON檔案...')
    # 開啟檔案，以 UTF-8 編碼手動寫入 JSON 內容    
    with open(os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_INVBCMarkers.json'), 'w', encoding='utf-8') as f:
        #--
        # 寫入說明行
        f.write('{\n')
        f.write('"MeshBCMarkers_Readme":"index,x1[m],y1[m],x2[m],y2[m],marker",\n')
        f.write('"MeshBCMarkers":[\n')
        #--
        for i, b in enumerate(LastInversion_InversionModelMesh.boundaries()):
            #--
            # 組成一列文字
            line = f'[{i}, {b.nodes()[0].pos()[0]:.6f}, {b.nodes()[0].pos()[1]:.6f}, {b.nodes()[1].pos()[0]:.6f}, {b.nodes()[1].pos()[1]:.6f}, {b.marker()}]'
            # 最後一列不加逗號，其它加逗號
            if i < LastInversion_InversionModelMesh.boundaryCount() - 1:
                line += ','
            line += '\n'
            # 寫入
            f.write(line)
            #--
        #--
        # 關閉陣列與大括號
        f.write(']\n')
        f.write('}\n')
        #--
    #print('儲存MeshBCMarkers為JSON檔案...完成!')    
    #--------------------------------------------
    #--------------------------------------------
    Info_LastInversion_Obs_dataVals = mgr.inv.dataVals
    #print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 觀測資料內容: {Info_LastInversion_Obs_dataVals}")
    Info_LastInversion_Obs_dataVals_Count = len(Info_LastInversion_Obs_dataVals)
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 觀測資料數量 = {Info_LastInversion_Obs_dataVals_Count}")
    Info_LastInversion_Obs_dataVals_Min = np.min(Info_LastInversion_Obs_dataVals)
    Info_LastInversion_Obs_dataVals_Max = np.max(Info_LastInversion_Obs_dataVals)
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 觀測資料數值(Min/Max) = {Info_LastInversion_Obs_dataVals_Min:.2f}/{Info_LastInversion_Obs_dataVals_Max:.2f}")
    Info_LastInversion_Obs_errorVals = mgr.inv.errorVals
    #print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 觀測資料估計相對誤差內容: {Info_LastInversion_Obs_errorVals}")
    Info_LastInversion_Obs_errorVals_Count = len(Info_LastInversion_Obs_errorVals)
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 觀測資料估計相對誤差數量 = {Info_LastInversion_Obs_errorVals_Count}")
    Info_LastInversion_Obs_errorVals_Min = np.min(Info_LastInversion_Obs_errorVals)
    Info_LastInversion_Obs_errorVals_Max = np.max(Info_LastInversion_Obs_errorVals)
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 觀測資料估計相對誤差數值(Min/Max) = {Info_LastInversion_Obs_errorVals_Min:.2f}/{Info_LastInversion_Obs_errorVals_Max:.2f}")
    Info_LastInversion_response_dataVals = mgr.inv.response
    #print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 計算資料內容: {Info_LastInversion_response_dataVals}")
    Info_LastInversion_response_dataVals_Count = len(Info_LastInversion_response_dataVals)
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 計算資料數量 = {Info_LastInversion_response_dataVals_Count}")
    Info_LastInversion_response_dataVals_Min = np.min(Info_LastInversion_response_dataVals)
    Info_LastInversion_response_dataVals_Max = np.max(Info_LastInversion_response_dataVals)    
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 計算資料數值(Min/Max) = {Info_LastInversion_response_dataVals_Min:.2f}/{Info_LastInversion_response_dataVals_Max:.2f}")
    Info_LastInversion_Lamda = Inversion_lam
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 逆推採用Lamda = {Info_LastInversion_Lamda}")
    Info_LastInversion_RMS = mgr.inv.absrms()
    #print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: RMS = {Info_LastInversion_RMS:.2f}")
    Info_LastInversion_RRMS = mgr.inv.relrms()
    #print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: RRMS = {Info_LastInversion_RRMS:.2f}%")
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: RMS/RRMS = {Info_LastInversion_RMS:.2f}/{Info_LastInversion_RRMS:.2f}%")
    Info_LastInversion_chi2 = mgr.inv.chi2()
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: chi2 = {Info_LastInversion_chi2:.2f}")
    Info_LastInversion_PhiD = mgr.inv.phiData()
    #print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: PhiD = {Info_LastInversion_PhiD:.2f}")
    Info_LastInversion_PhiM = mgr.inv.phiModel()
    #print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: PhiM = {Info_LastInversion_PhiM:.2f}")
    Info_LastInversion_Phi = mgr.inv.phi()
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: Phi = PhiD+(lam*PhiM) =: {Info_LastInversion_PhiD:.2f}+({Info_LastInversion_Lamda}*{Info_LastInversion_PhiM:.2f}) = {Info_LastInversion_Phi:.2f}")
    #--------------------------------------------
    # Cross Plot (Obs vs Response)
    #--
    # 可填入的資訊
    PNG_Profile_Name = Main_FileName
    PNG_Main_Title01 = f"{PNG_Profile_Name}\n Observed vs. Predicted Cross Plot (Linear) " + \
        f"(Iteration={Info_Iteration_count})\n" + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        f"Data Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}" + \
        f"\nData EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%" 
    PNG_Main_Title02 = f"{PNG_Profile_Name}\n Observed vs. Predicted Cross Plot (abs Log10) " + \
        f"(Iteration={Info_Iteration_count})\n" + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        f"Data Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}" + \
        f"\nData EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%"
    temp_PNG_DPI = 100
    temp_PNG_Width = 1280
    temp_PNG_Height = 720
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_CrossPlot.png')
    #--
    # 建立畫布
    fig, axes = plt.subplots(1, 2, figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
    #--
    # 子圖1
    #--
    Overlap_First_data_Rhoa_sorted = Info_LastInversion_Obs_dataVals
    Overlap_Second_data_Rhoa_sorted = Info_LastInversion_response_dataVals
    # 繪製資料點
    Overlap_First_data_Rhoa_sorted_positive_positive = Overlap_First_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted > 0) & (Overlap_Second_data_Rhoa_sorted > 0)]
    Overlap_Second_data_Rhoa_sorted_positive_positive = Overlap_Second_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted > 0) & (Overlap_Second_data_Rhoa_sorted > 0)]
    axes[0].scatter(Overlap_First_data_Rhoa_sorted_positive_positive, Overlap_Second_data_Rhoa_sorted_positive_positive, alpha=0.5, s=5, c='blue',label=f'1+2+({len(Overlap_First_data_Rhoa_sorted_positive_positive)})')
    Overlap_First_data_Rhoa_sorted_positive_negative = Overlap_First_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted > 0) & (Overlap_Second_data_Rhoa_sorted < 0)]
    Overlap_Second_data_Rhoa_sorted_positive_negative = Overlap_Second_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted > 0) & (Overlap_Second_data_Rhoa_sorted < 0)]
    axes[0].scatter(Overlap_First_data_Rhoa_sorted_positive_negative, Overlap_Second_data_Rhoa_sorted_positive_negative, alpha=0.5, s=5, c='blue',label=f'1+2-({len(Overlap_First_data_Rhoa_sorted_positive_negative)})')
    Overlap_First_data_Rhoa_sorted_negative_negative = Overlap_First_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted < 0) & (Overlap_Second_data_Rhoa_sorted < 0)]
    Overlap_Second_data_Rhoa_sorted_negative_negative = Overlap_Second_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted < 0) & (Overlap_Second_data_Rhoa_sorted < 0)]
    axes[0].scatter(Overlap_First_data_Rhoa_sorted_negative_negative, Overlap_Second_data_Rhoa_sorted_negative_negative, alpha=0.5, s=5, c='blue',label=f'1-2-({len(Overlap_First_data_Rhoa_sorted_negative_negative)})')
    Overlap_First_data_Rhoa_sorted_negative_positive = Overlap_First_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted < 0) & (Overlap_Second_data_Rhoa_sorted > 0)]
    Overlap_Second_data_Rhoa_sorted_negative_positive = Overlap_Second_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted < 0) & (Overlap_Second_data_Rhoa_sorted > 0)]
    axes[0].scatter(Overlap_First_data_Rhoa_sorted_negative_positive, Overlap_Second_data_Rhoa_sorted_negative_positive, alpha=0.5, s=5, c='blue',label=f'1-2+({len(Overlap_First_data_Rhoa_sorted_negative_positive)})')
    # 設定等比例
    axes[0].set_aspect('equal', adjustable='box')
    # 畫出 1:1 參考線
    lims = [
        np.min([axes[0].get_xlim(), axes[0].get_ylim()]),
        np.max([axes[0].get_xlim(), axes[0].get_ylim()]),
    ]
    axes[0].plot(lims, lims, '--', c='gray', alpha=0.75, zorder=0, label='1:1 Line')
    #--
    # 調整繪圖參數
    axes[0].set_xlabel(f'1: Observed Data (Ωm)')
    axes[0].set_ylabel(f'2: Predicted Data (Ωm)')
    axes[0].set_title(PNG_Main_Title01)
    axes[0].legend(loc='upper left')
    #--
    # 子圖2
    #--
    # 繪製資料點
    Overlap_First_data_Rhoa_sorted_positive_positive_abs_log10 = np.log10(np.abs(Overlap_First_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted > 0) & (Overlap_Second_data_Rhoa_sorted > 0)]))
    Overlap_Second_data_Rhoa_sorted_positive_positive_abs_log10 = np.log10(np.abs(Overlap_Second_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted > 0) & (Overlap_Second_data_Rhoa_sorted > 0)]))
    axes[1].scatter(Overlap_First_data_Rhoa_sorted_positive_positive_abs_log10, Overlap_Second_data_Rhoa_sorted_positive_positive_abs_log10, alpha=0.5, s=5, c='blue',label=f'1+2+({len(Overlap_First_data_Rhoa_sorted_positive_positive_abs_log10)})')
    Overlap_First_data_Rhoa_sorted_positive_negative_abs_log10 = np.log10(np.abs(Overlap_First_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted > 0) & (Overlap_Second_data_Rhoa_sorted < 0)]))
    Overlap_Second_data_Rhoa_sorted_positive_negative_abs_log10 = np.log10(np.abs(Overlap_Second_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted > 0) & (Overlap_Second_data_Rhoa_sorted < 0)]))
    axes[1].scatter(Overlap_First_data_Rhoa_sorted_positive_negative_abs_log10, Overlap_Second_data_Rhoa_sorted_positive_negative_abs_log10, alpha=0.5, s=5, c='lightblue',label=f'1+2-({len(Overlap_First_data_Rhoa_sorted_positive_negative_abs_log10)})')
    Overlap_First_data_Rhoa_sorted_negative_negative_abs_log10 = np.log10(np.abs(Overlap_First_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted < 0) & (Overlap_Second_data_Rhoa_sorted < 0)]))
    Overlap_Second_data_Rhoa_sorted_negative_negative_abs_log10 = np.log10(np.abs(Overlap_Second_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted < 0) & (Overlap_Second_data_Rhoa_sorted < 0)]))
    axes[1].scatter(Overlap_First_data_Rhoa_sorted_negative_negative_abs_log10, Overlap_Second_data_Rhoa_sorted_negative_negative_abs_log10, alpha=0.5, s=5, c='red',label=f'1-2-({len(Overlap_First_data_Rhoa_sorted_negative_negative_abs_log10)})')
    Overlap_First_data_Rhoa_sorted_negative_positive_abs_log10 = np.log10(np.abs(Overlap_First_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted < 0) & (Overlap_Second_data_Rhoa_sorted > 0)]))
    Overlap_Second_data_Rhoa_sorted_negative_positive_abs_log10 = np.log10(np.abs(Overlap_Second_data_Rhoa_sorted[(Overlap_First_data_Rhoa_sorted < 0) & (Overlap_Second_data_Rhoa_sorted > 0)]))
    axes[1].scatter(Overlap_First_data_Rhoa_sorted_negative_positive_abs_log10, Overlap_Second_data_Rhoa_sorted_negative_positive_abs_log10, alpha=0.5, s=5, c='lightpink',label=f'1-2+({len(Overlap_First_data_Rhoa_sorted_negative_positive_abs_log10)})')
    # 設定等比例
    axes[1].set_aspect('equal', adjustable='box')
    # 畫出 1:1 參考線
    lims = [
        np.min([axes[1].get_xlim(), axes[1].get_ylim()]),
        np.max([axes[1].get_xlim(), axes[1].get_ylim()]),
    ]
    axes[1].plot(lims, lims, '--', c='gray', alpha=0.75, zorder=0, label='1:1 Line')
    #--
    # 調整繪圖參數
    axes[1].set_xlabel(f'1: abs(Observed Data) (Log10 Ωm)')
    axes[1].set_ylabel(f'2: abs(Predicted Data) (Log10 Ohm)')
    axes[1].set_title(PNG_Main_Title02)
    axes[1].legend(loc='upper left')
    #--
    # 填入版本資訊
    fig.text(0.98, 0.005, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    #--
    #print(f'儲存 圖片...')
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
    plt.close()
    #print(f'儲存 圖片...完成!')
    #--------------------------------------------
    # 相對殘差百分比 統計圖
    Info_LastInversion_Relative_Misfit_Percentage = np.abs((Info_LastInversion_response_dataVals - Info_LastInversion_Obs_dataVals) / Info_LastInversion_Obs_dataVals) * 100
    #print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_LastInversion_Relative_Misfit_Percentage}的計算資料內容: {Info_LastInversion_Relative_Misfit_Percentage}")
    Info_LastInversion_Relative_Misfit_Percentage_Count = len(Info_LastInversion_Relative_Misfit_Percentage)
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 相對殘差百分比數量 = {Info_LastInversion_Relative_Misfit_Percentage_Count}")
    Info_LastInversion_Relative_Misfit_Percentage_Min = np.min(Info_LastInversion_Relative_Misfit_Percentage)
    Info_LastInversion_Relative_Misfit_Percentage_Mean = np.mean(Info_LastInversion_Relative_Misfit_Percentage)
    Info_LastInversion_Relative_Misfit_Percentage_Max = np.max(Info_LastInversion_Relative_Misfit_Percentage)
    print(f"Remove_Runs#{Current_Remove_Runs}({Inversion_Remove_Data_Percentage}%),Iteration#{Info_Iteration_count}: 相對殘差百分比數值(Min/Mean/Max) = {Info_LastInversion_Relative_Misfit_Percentage_Min:.2f}%/{Info_LastInversion_Relative_Misfit_Percentage_Mean:.2f}%/{Info_LastInversion_Relative_Misfit_Percentage_Max:.2f}%")
    #--
    # 可填入的資訊
    PNG_Profile_Name = Main_FileName
    PNG_Main_Title = f"{PNG_Profile_Name} Relative Data Misfit Histogram (Green = All, Red = Top {Inversion_Remove_Data_Percentage}% High Misfit )" + \
        f" (Iteration={Info_Iteration_count})" + \
        f"\nData Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        f"Data EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}"    
    #--
    PNG_DPI = 100
    PNG_Width = 1280
    PNG_Height = 720 
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_Misfit.png')
    #--
    # 計算要取出的資料個數 (假設 Inversion_Remove_Data_Percentage = 5)
    temp_All_Data_Count = len(Info_LastInversion_Relative_Misfit_Percentage)
    temp_Remove_Data_Count = int(np.round(temp_All_Data_Count * Inversion_Remove_Data_Percentage / 100))
    # 取得 misfit 最大的索引 (由小到大排序，取最後面的 N 個)
    temp_worst_indices = np.argsort(Info_LastInversion_Relative_Misfit_Percentage)[-temp_Remove_Data_Count:]
    # 根據索引提取出這 5% 的數據
    Relative_Misfit_Percentage_Worst_5_Percent = Info_LastInversion_Relative_Misfit_Percentage[temp_worst_indices]
    #--
    # 建立畫布
    fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
    # 設定截斷閾值，單位:[%]    
    Relative_Misfit_Percentage_clip_threshold = 100 #單位:[%]
    Relative_Misfit_Percentage_Histogram_Bin_Width = 5 # 單位:[%]
    # 依照上下限截斷：所有大於 100 的都會變成 101 (確保它們掉進最後一格 [100, 105])
    Relative_Misfit_Percentage_clipped = np.clip(Info_LastInversion_Relative_Misfit_Percentage, 0, Relative_Misfit_Percentage_clip_threshold + 1)
    Relative_Misfit_Percentage_Worst_5_Percent_clipped = np.clip(Relative_Misfit_Percentage_Worst_5_Percent, 0, Relative_Misfit_Percentage_clip_threshold + 1)
    # 重新設計 Histogram_Bins_Setting ( 0-5% 第一根，5-10% 第二根，中間以 5% 為間隔到 100%，最後一根代表 >100%)
    Histogram_Bins_Setting = np.arange(0, Relative_Misfit_Percentage_clip_threshold + Relative_Misfit_Percentage_Histogram_Bin_Width + 1, Relative_Misfit_Percentage_Histogram_Bin_Width)
    # 繪製直方圖
    ax.hist(Relative_Misfit_Percentage_clipped, bins=Histogram_Bins_Setting, edgecolor='black', color='limegreen', alpha=0.7,rwidth=0.7, label='All Data')
    ax.hist(Relative_Misfit_Percentage_Worst_5_Percent_clipped, bins=Histogram_Bins_Setting, edgecolor='black', color='red', alpha=0.7,rwidth=0.7, label='Worst 5%')
    # 設定 X 軸刻度與標籤
    ax.set_xticks(Histogram_Bins_Setting)
    temp_label_str = [str(int(b)) for b in Histogram_Bins_Setting]
    temp_label_str[-1] = ">" + str(Relative_Misfit_Percentage_clip_threshold) # 將最後一個標籤改為 >100
    ax.set_xticklabels(temp_label_str)
    ax.set_title(PNG_Main_Title)
    ax.set_xlabel('Relative Data Misfit (%)')
    ax.set_ylabel('Number of Data')
    #--
    # 填入版本資訊
    fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    #--
    #print(f'儲存 {PNG_Profile_Name} 圖片...')
    #Output_PNG_FileName = 'ABCD.png'
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
    plt.close()
    #print(f'儲存 {PNG_Profile_Name} 圖片...完成!')    
    #--------------------------------------------
    #--------------------------------------------
    # 儲存觀測資料與計算資料為dat檔案
    LastInversion_Data = mgr.fop.data.copy()
    LastInversion_Data['response'] = mgr.inv.response
    LastInversion_Data['Relative_Misfit_Percentage'] = Info_LastInversion_Relative_Misfit_Percentage    
    LastInversion_Data.save(os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_ObsCalData.dat'),'a b m n r i rhoa k err response Relative_Misfit_Percentage')
    LastInversion_CalData = mgr.fop.data.copy()
    LastInversion_CalData['rhoa'] = mgr.inv.response
    LastInversion_CalData['r'] = LastInversion_CalData['rhoa']/LastInversion_CalData['k']
    LastInversion_CalData['i'] = (LastInversion_CalData['i']*0) + 1
    LastInversion_CalData.save(os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_CalData.dat'),'a b m n r i rhoa k')
    #--------------------------------------------
    #--------------------------------------------
    #print('儲存 Output_Inversion_Log 檔案...')   
    Output_Inversion_Log = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_03_Inversion_Log.csv')
    with open(Output_Inversion_Log, 'a', encoding='utf-8') as f:
        #--
        # 內容
        line = f'{Main_FileName},{Info_Inversion_SR},{Info_GeometricFactorByMesh},{Current_Remove_Runs},{Inversion_Remove_Data_Percentage},{Info_Iteration_count},{Inversion_maxIter},' + \
        f'{Info_LastInversion_StartModelMesh_CellCount},{Info_LastInversion_StartModelMesh_Value_Min},{Info_LastInversion_StartModelMesh_Value_Max},' + \
        f'{Inversion_limitModelCellMinValue},{Inversion_limitModelCellMaxValue},' + \
        f'{Info_LastInversion_ForwordH2ModelMesh_CellCount},{Info_LastInversion_ForwordH2ModelMesh_Value_Min},{Info_LastInversion_ForwordH2ModelMesh_Value_Max},' + \
        f'{Info_LastInversion_InversionModelMesh_CellCount},{Info_LastInversion_InversionModelMesh_Value_Min},{Info_LastInversion_InversionModelMesh_Value_Max},' + \
        f'{Info_LastInversion_Obs_dataVals_Count},{Info_LastInversion_Obs_dataVals_Min},{Info_LastInversion_Obs_dataVals_Max},' + \
        f'{Info_LastInversion_Obs_errorVals_Min*100},{Info_LastInversion_Obs_errorVals_Max*100},' + \
        f'{Info_LastInversion_response_dataVals_Min},{Info_LastInversion_response_dataVals_Max},' + \
        f'{Info_LastInversion_Relative_Misfit_Percentage_Min},{Info_LastInversion_Relative_Misfit_Percentage_Mean},{Info_LastInversion_Relative_Misfit_Percentage_Max},' + \
        f'{Info_LastInversion_Lamda},{Info_LastInversion_RMS},{Info_LastInversion_RRMS},{Info_LastInversion_chi2},{Info_LastInversion_Phi},{Info_LastInversion_PhiD},{Info_LastInversion_PhiM}\n'    
        f.write(line)
        #--
    #print('儲存 Output_Inversion_Log 檔案...完成!')
    #--------------------------------------------
    #==============================================================================
    # Pygimli網格繪圖:  繪製H2全網格逆推剖面(電阻率、電極位置、逆推資訊)
    #--
    # 可填入的資訊
    PNG_Profile_Name = Main_FileName
    PNG_NumPy_Electrode_x = LastInversion_Data.sensors().array()[:, 0]
    PNG_NumPy_Electrode_y = LastInversion_Data.sensors().array()[:, 1]
    PNG_NumPy_Electrode_z = LastInversion_Data.sensors().array()[:, 2]
    PNG_mesh = LastInversion_H2FullMesh
    PNG_mesh_data = LastInversion_H2FullMesh['Resistivity_(log10)']
    PNG_colorbar_title = 'Resistivity (log10 Ωm)'
    PNG_colorbar_ticker_ModifyLog10ToLinear_Enable = True # True = 把colorbar數值文字從對數尺度調整成線性尺度 / False = 維持原本數值
    PNG_colorbar_ticker_ModifyLog10ToLinear_title = 'Resistivity (Ωm)'
    PNG_Main_Title = f"{PNG_Profile_Name} Inverted Resistivity Section (H2FullMesh) " + \
        f" (Iteration={Info_Iteration_count})" + \
        f"\nData Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        f"Data EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}"                
    PNG_mesh_showMesh = True # True / False
    PNG_mesh_showBoundary = True # None / True / False ，某些時候None與True效果相同
    PNG_cMap = 'jet'
    PNG_cMin = np.min(PNG_mesh_data) # None表示自動
    PNG_cMax = np.max(PNG_mesh_data) # None表示自動
    # 檢查是否所有數值都相同
    if PNG_cMin == PNG_cMax:
        # 如果全部相同，設定極小的偏移量
        PNG_cMin = PNG_cMin - 0.000001
        PNG_cMax = PNG_cMax + 0.000001
    PNG_DPI = 100
    PNG_Width = 1280
    PNG_Height = 720    
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_H2.png')
    #--
    # 建立畫布
    fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
    # 繪製網格
    ax, cbar = pg.show(PNG_mesh, 
        data=PNG_mesh_data, 
        ax=ax,
        markers=False,
        showMesh=PNG_mesh_showMesh,
        showBoundary=PNG_mesh_showBoundary,  
        label=PNG_colorbar_title,     # colorbar的標題。
        axisLabels=False,             # 阻止自動標籤(否則特定條件下會把Y軸轉換成深度)。後面自行填入標籤。
        cMap=PNG_cMap,
        cMin=PNG_cMin,
        cMax=PNG_cMax)
    # 繪製電極
    ax.plot(PNG_NumPy_Electrode_x[Good_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Good_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='magenta', markeredgecolor='black', label='Electrode Nodes')    
    if len(Bad_Electrode_Index_0Base) >0 :
        ax.plot(PNG_NumPy_Electrode_x[Bad_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Bad_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='lightgray', markeredgecolor='black', label='Skipped Electrode Nodes')
    ax.set_title(PNG_Main_Title, pad=3)  
    # 調整XY標籤
    ax.set_xlabel('Distance (m)')
    ax.set_ylabel('Elevation (m)')
    # 調整圖例
    ax.legend(loc='upper right',ncol=2,framealpha=0.4)
    # 調整colorbar內文字
    if PNG_colorbar_ticker_ModifyLog10ToLinear_Enable:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda x, pos: f'{10**x:.1f}'.rstrip('0').rstrip('.')))    
        cbar.ax.xaxis.get_offset_text().set_visible(False) # 避免顯示 1eX
        cbar.set_label(PNG_colorbar_ticker_ModifyLog10ToLinear_title) # 使用你設定的 Ωm 標題
    else:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
        cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
    #--
    # 填入版本資訊
    fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    # 調整邊界
    x_min, x_max = ax.get_xlim()
    y_min, y_max = ax.get_ylim()
    x_range = x_max - x_min
    y_range = y_max - y_min
    ax.set_ylim(y_min , y_max + 0.1 * y_range)
    #--
    #print(f'儲存 {PNG_Profile_Name} 圖片...')
    #Output_PNG_FileName = 'ABCD.png'
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
    plt.close()
    #print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
    #==============================================================================
    #==============================================================================
    # Pygimli網格繪圖:  繪製H2全網格逆推剖面(電阻率、電極位置、逆推資訊) 無網格#1
    #--
    # 可填入的資訊
    PNG_Profile_Name = Main_FileName
    PNG_NumPy_Electrode_x = LastInversion_Data.sensors().array()[:, 0]
    PNG_NumPy_Electrode_y = LastInversion_Data.sensors().array()[:, 1]
    PNG_NumPy_Electrode_z = LastInversion_Data.sensors().array()[:, 2]
    PNG_mesh = LastInversion_H2FullMesh
    PNG_mesh_data = LastInversion_H2FullMesh['Resistivity_(log10)']
    PNG_colorbar_title = 'Resistivity (log10 Ωm)'
    PNG_colorbar_ticker_ModifyLog10ToLinear_Enable = True # True = 把colorbar數值文字從對數尺度調整成線性尺度 / False = 維持原本數值
    PNG_colorbar_ticker_ModifyLog10ToLinear_title = 'Resistivity (Ωm)'
    PNG_Main_Title = f"{PNG_Profile_Name} Inverted Resistivity Section (H2FullMesh) " + \
        f" (Iteration={Info_Iteration_count})" + \
        f"\nData Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        f"Data EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}"                
    PNG_mesh_showMesh = False # True / False
    PNG_mesh_showBoundary = True # None / True / False ，某些時候None與True效果相同
    PNG_cMap = 'jet'
    PNG_cMin = np.min(PNG_mesh_data) # None表示自動
    PNG_cMax = np.max(PNG_mesh_data) # None表示自動
    # 檢查是否所有數值都相同
    if PNG_cMin == PNG_cMax:
        # 如果全部相同，設定極小的偏移量
        PNG_cMin = PNG_cMin - 0.000001
        PNG_cMax = PNG_cMax + 0.000001
    PNG_DPI = 100
    PNG_Width = 1280
    PNG_Height = 720    
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_H2_1.png')
    #--
    # 建立畫布
    fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
    # 繪製網格
    ax, cbar = pg.show(PNG_mesh, 
        data=PNG_mesh_data, 
        ax=ax,
        markers=False,
        showMesh=PNG_mesh_showMesh,
        showBoundary=PNG_mesh_showBoundary,  
        label=PNG_colorbar_title,     # colorbar的標題。
        axisLabels=False,             # 阻止自動標籤(否則特定條件下會把Y軸轉換成深度)。後面自行填入標籤。
        cMap=PNG_cMap,
        cMin=PNG_cMin,
        cMax=PNG_cMax)
    # 繪製電極
    ax.plot(PNG_NumPy_Electrode_x[Good_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Good_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='magenta', markeredgecolor='black', label='Electrode Nodes')    
    if len(Bad_Electrode_Index_0Base) >0 :
        ax.plot(PNG_NumPy_Electrode_x[Bad_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Bad_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='lightgray', markeredgecolor='black', label='Skipped Electrode Nodes')
    ax.set_title(PNG_Main_Title, pad=3)  
    # 調整XY標籤
    ax.set_xlabel('Distance (m)')
    ax.set_ylabel('Elevation (m)')
    # 調整圖例
    ax.legend(loc='upper right',ncol=2,framealpha=0.4)
    # 調整colorbar內文字
    if PNG_colorbar_ticker_ModifyLog10ToLinear_Enable:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda x, pos: f'{10**x:.1f}'.rstrip('0').rstrip('.')))    
        cbar.ax.xaxis.get_offset_text().set_visible(False) # 避免顯示 1eX
        cbar.set_label(PNG_colorbar_ticker_ModifyLog10ToLinear_title) # 使用你設定的 Ωm 標題
    else:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
        cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
    #--
    # 填入版本資訊
    fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    # 調整邊界
    x_min, x_max = ax.get_xlim()
    y_min, y_max = ax.get_ylim()
    x_range = x_max - x_min
    y_range = y_max - y_min
    ax.set_ylim(y_min , y_max + 0.1 * y_range)
    #--
    #print(f'儲存 {PNG_Profile_Name} 圖片...')
    #Output_PNG_FileName = 'ABCD.png'
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
    plt.close()
    #print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
    #==============================================================================
    #==============================================================================
    # Pygimli網格繪圖:  繪製研究區域網格逆推剖面(電阻率、電極位置、逆推資訊) 無coverage 有網格 #0
    #--    
    # 可填入的資訊
    PNG_Profile_Name = Main_FileName
    PNG_NumPy_Electrode_x = LastInversion_Data.sensors().array()[:, 0]
    PNG_NumPy_Electrode_y = LastInversion_Data.sensors().array()[:, 1]
    PNG_NumPy_Electrode_z = LastInversion_Data.sensors().array()[:, 2]
    PNG_mesh = LastInversion_InversionModelMesh
    PNG_mesh_data = LastInversion_InversionModelMesh['Resistivity_(log10)']
    PNG_colorbar_title = 'Resistivity (log10 Ωm)'
    PNG_colorbar_ticker_ModifyLog10ToLinear_Enable = True # True = 把colorbar數值文字從對數尺度調整成線性尺度 / False = 維持原本數值
    PNG_colorbar_ticker_ModifyLog10ToLinear_title = 'Resistivity (Ωm)'
    PNG_Main_Title = f"{PNG_Profile_Name} Inverted Resistivity Section " + \
        f" (Iteration={Info_Iteration_count})" + \
        f"\nData Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        f"Data EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}"                 
    PNG_mesh_showMesh = True # True / False
    PNG_mesh_showBoundary = True # None / True / False ，某些時候None與True效果相同
    PNG_cMap = 'jet'
    PNG_cMin = np.min(PNG_mesh_data) # None表示自動
    PNG_cMax = np.max(PNG_mesh_data) # None表示自動
    # 檢查是否所有數值都相同
    if PNG_cMin == PNG_cMax:
        # 如果全部相同，設定極小的偏移量
        PNG_cMin = PNG_cMin - 0.000001
        PNG_cMax = PNG_cMax + 0.000001
    PNG_DPI = 100
    PNG_Width = 1280
    PNG_Height = 720    
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_INV.png')
    #--
    # 建立畫布
    fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
    # 繪製網格
    ax, cbar = pg.show(PNG_mesh, 
        data=PNG_mesh_data, 
        ax=ax,
        markers=False,
        showMesh=PNG_mesh_showMesh,
        showBoundary=PNG_mesh_showBoundary,  
        label=PNG_colorbar_title,     # colorbar的標題。
        axisLabels=False,             # 阻止自動標籤(否則特定條件下會把Y軸轉換成深度)。後面自行填入標籤。
        cMap=PNG_cMap,
        cMin=PNG_cMin,
        cMax=PNG_cMax)
    # 繪製電極
    ax.plot(PNG_NumPy_Electrode_x[Good_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Good_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='magenta', markeredgecolor='black', label='Electrode Nodes')    
    if len(Bad_Electrode_Index_0Base) >0 :
        ax.plot(PNG_NumPy_Electrode_x[Bad_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Bad_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='lightgray', markeredgecolor='black', label='Skipped Electrode Nodes')
    ax.set_title(PNG_Main_Title, pad=3)  
    # 調整XY標籤
    ax.set_xlabel('Distance (m)')
    ax.set_ylabel('Elevation (m)')
    # 調整圖例
    ax.legend(loc='upper right',ncol=2,framealpha=0.4)
    # 調整colorbar內文字
    if PNG_colorbar_ticker_ModifyLog10ToLinear_Enable:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda x, pos: f'{10**x:.1f}'.rstrip('0').rstrip('.')))    
        cbar.ax.xaxis.get_offset_text().set_visible(False) # 避免顯示 1eX
        cbar.set_label(PNG_colorbar_ticker_ModifyLog10ToLinear_title) # 使用你設定的 Ωm 標題
    else:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
        cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
    #--
    # 填入版本資訊
    fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    # 調整邊界
    x_min, x_max = ax.get_xlim()
    y_min, y_max = ax.get_ylim()
    x_range = x_max - x_min
    y_range = y_max - y_min
    ax.set_ylim(y_min , y_max + 0.1 * y_range)
    #--
    #print(f'儲存 {PNG_Profile_Name} 圖片...')
    #Output_PNG_FileName = 'ABCD.png'
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
    plt.close()
    #print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
    #==============================================================================
    #==============================================================================
    # Pygimli網格繪圖:  繪製研究區域網格逆推剖面(電阻率、電極位置、逆推資訊) 無coverage 無網格 #1
    #--    
    # 可填入的資訊
    PNG_Profile_Name = Main_FileName
    PNG_NumPy_Electrode_x = LastInversion_Data.sensors().array()[:, 0]
    PNG_NumPy_Electrode_y = LastInversion_Data.sensors().array()[:, 1]
    PNG_NumPy_Electrode_z = LastInversion_Data.sensors().array()[:, 2]
    PNG_mesh = LastInversion_InversionModelMesh
    PNG_mesh_data = LastInversion_InversionModelMesh['Resistivity_(log10)']
    PNG_colorbar_title = 'Resistivity (log10 Ωm)'
    PNG_colorbar_ticker_ModifyLog10ToLinear_Enable = True # True = 把colorbar數值文字從對數尺度調整成線性尺度 / False = 維持原本數值
    PNG_colorbar_ticker_ModifyLog10ToLinear_title = 'Resistivity (Ωm)'
    PNG_Main_Title = f"{PNG_Profile_Name} Inverted Resistivity Section " + \
        f" (Iteration={Info_Iteration_count})" + \
        f"\nData Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        f"Data EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}"                 
    PNG_mesh_showMesh = False # True / False
    PNG_mesh_showBoundary = True # None / True / False ，某些時候None與True效果相同
    PNG_cMap = 'jet'
    PNG_cMin = np.min(PNG_mesh_data) # None表示自動
    PNG_cMax = np.max(PNG_mesh_data) # None表示自動
    # 檢查是否所有數值都相同
    if PNG_cMin == PNG_cMax:
        # 如果全部相同，設定極小的偏移量
        PNG_cMin = PNG_cMin - 0.000001
        PNG_cMax = PNG_cMax + 0.000001
    PNG_DPI = 100
    PNG_Width = 1280
    PNG_Height = 720    
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_INV1.png')
    #--
    # 建立畫布
    fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
    # 繪製網格
    ax, cbar = pg.show(PNG_mesh, 
        data=PNG_mesh_data, 
        ax=ax,
        markers=False,
        showMesh=PNG_mesh_showMesh,
        showBoundary=PNG_mesh_showBoundary,  
        label=PNG_colorbar_title,     # colorbar的標題。
        axisLabels=False,             # 阻止自動標籤(否則特定條件下會把Y軸轉換成深度)。後面自行填入標籤。
        cMap=PNG_cMap,
        cMin=PNG_cMin,
        cMax=PNG_cMax)
    # 繪製電極
    ax.plot(PNG_NumPy_Electrode_x[Good_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Good_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='magenta', markeredgecolor='black', label='Electrode Nodes')    
    if len(Bad_Electrode_Index_0Base) >0 :
        ax.plot(PNG_NumPy_Electrode_x[Bad_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Bad_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='lightgray', markeredgecolor='black', label='Skipped Electrode Nodes')
    ax.set_title(PNG_Main_Title, pad=3)  
    # 調整XY標籤
    ax.set_xlabel('Distance (m)')
    ax.set_ylabel('Elevation (m)')
    # 調整圖例
    ax.legend(loc='upper right',ncol=2,framealpha=0.4)
    # 調整colorbar內文字
    if PNG_colorbar_ticker_ModifyLog10ToLinear_Enable:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda x, pos: f'{10**x:.1f}'.rstrip('0').rstrip('.')))    
        cbar.ax.xaxis.get_offset_text().set_visible(False) # 避免顯示 1eX
        cbar.set_label(PNG_colorbar_ticker_ModifyLog10ToLinear_title) # 使用你設定的 Ωm 標題
    else:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
        cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
    #--
    # 填入版本資訊
    fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    # 調整邊界
    x_min, x_max = ax.get_xlim()
    y_min, y_max = ax.get_ylim()
    x_range = x_max - x_min
    y_range = y_max - y_min
    ax.set_ylim(y_min , y_max + 0.1 * y_range)
    #--
    #print(f'儲存 {PNG_Profile_Name} 圖片...')
    #Output_PNG_FileName = 'ABCD.png'
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
    plt.close()
    #print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
    #==============================================================================
    #==============================================================================
    # Pygimli網格繪圖:  繪製研究區域網格逆推剖面(電阻率、電極位置、逆推資訊) 無coverage 有網格 自訂colorbar #2
    #--    
    # 可填入的資訊
    PNG_Profile_Name = Main_FileName
    PNG_NumPy_Electrode_x = LastInversion_Data.sensors().array()[:, 0]
    PNG_NumPy_Electrode_y = LastInversion_Data.sensors().array()[:, 1]
    PNG_NumPy_Electrode_z = LastInversion_Data.sensors().array()[:, 2]
    PNG_mesh = LastInversion_InversionModelMesh
    PNG_mesh_data = LastInversion_InversionModelMesh['Resistivity_(log10)']
    PNG_colorbar_title = 'Resistivity (log10 Ωm)'
    PNG_colorbar_ticker_ModifyLog10ToLinear_Enable = True # True = 把colorbar數值文字從對數尺度調整成線性尺度 / False = 維持原本數值
    PNG_colorbar_ticker_ModifyLog10ToLinear_title = 'Resistivity (Ωm)'
    PNG_Main_Title = f"{PNG_Profile_Name} Inverted Resistivity Section " + \
        f" (Iteration={Info_Iteration_count})" + \
        f"\nData Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        f"Data EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}"                 
    PNG_mesh_showMesh = True # True / False
    PNG_mesh_showBoundary = True # None / True / False ，某些時候None與True效果相同
    PNG_cMap = 'jet'
    PNG_cMin = np.log10(temp_json_data['Output_Inversion_ColorBarResistivityMin']) # None表示自動
    PNG_cMax = np.log10(temp_json_data['Output_Inversion_ColorBarResistivityMax']) # None表示自動
    PNG_DPI = 100
    PNG_Width = 1280
    PNG_Height = 720    
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_INV2.png')
    #--
    # 建立畫布
    fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
    # 繪製網格
    ax, cbar = pg.show(PNG_mesh, 
        data=PNG_mesh_data, 
        ax=ax,
        markers=False,
        showMesh=PNG_mesh_showMesh,
        showBoundary=PNG_mesh_showBoundary,  
        label=PNG_colorbar_title,     # colorbar的標題。
        axisLabels=False,             # 阻止自動標籤(否則特定條件下會把Y軸轉換成深度)。後面自行填入標籤。
        cMap=PNG_cMap,
        cMin=PNG_cMin,
        cMax=PNG_cMax)
    # 繪製電極
    ax.plot(PNG_NumPy_Electrode_x[Good_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Good_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='magenta', markeredgecolor='black', label='Electrode Nodes')    
    if len(Bad_Electrode_Index_0Base) >0 :
        ax.plot(PNG_NumPy_Electrode_x[Bad_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Bad_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='lightgray', markeredgecolor='black', label='Skipped Electrode Nodes')
    ax.set_title(PNG_Main_Title, pad=3)  
    # 調整XY標籤
    ax.set_xlabel('Distance (m)')
    ax.set_ylabel('Elevation (m)')
    # 調整圖例
    ax.legend(loc='upper right',ncol=2,framealpha=0.4)
    # 調整colorbar內文字
    if PNG_colorbar_ticker_ModifyLog10ToLinear_Enable:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda x, pos: f'{10**x:.1f}'.rstrip('0').rstrip('.')))    
        cbar.ax.xaxis.get_offset_text().set_visible(False) # 避免顯示 1eX
        cbar.set_label(PNG_colorbar_ticker_ModifyLog10ToLinear_title) # 使用你設定的 Ωm 標題
    else:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
        cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
    #--
    # 填入版本資訊
    fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    # 調整邊界
    x_min, x_max = ax.get_xlim()
    y_min, y_max = ax.get_ylim()
    x_range = x_max - x_min
    y_range = y_max - y_min
    ax.set_ylim(y_min , y_max + 0.1 * y_range)
    #--
    #print(f'儲存 {PNG_Profile_Name} 圖片...')
    #Output_PNG_FileName = 'ABCD.png'
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
    plt.close()
    #print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
    #==============================================================================
    #==============================================================================
    # Pygimli網格繪圖:  繪製研究區域網格逆推剖面(電阻率、電極位置、逆推資訊) 無coverage 無網格 自訂colorbar #3
    #--    
    # 可填入的資訊
    PNG_Profile_Name = Main_FileName
    PNG_NumPy_Electrode_x = LastInversion_Data.sensors().array()[:, 0]
    PNG_NumPy_Electrode_y = LastInversion_Data.sensors().array()[:, 1]
    PNG_NumPy_Electrode_z = LastInversion_Data.sensors().array()[:, 2]
    PNG_mesh = LastInversion_InversionModelMesh
    PNG_mesh_data = LastInversion_InversionModelMesh['Resistivity_(log10)']
    PNG_colorbar_title = 'Resistivity (log10 Ωm)'
    PNG_colorbar_ticker_ModifyLog10ToLinear_Enable = True # True = 把colorbar數值文字從對數尺度調整成線性尺度 / False = 維持原本數值
    PNG_colorbar_ticker_ModifyLog10ToLinear_title = 'Resistivity (Ωm)'
    PNG_Main_Title = f"{PNG_Profile_Name} Inverted Resistivity Section " + \
        f" (Iteration={Info_Iteration_count})" + \
        f"\nData Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        f"Data EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}"                 
    PNG_mesh_showMesh = False # True / False
    PNG_mesh_showBoundary = True # None / True / False ，某些時候None與True效果相同
    PNG_cMap = 'jet'
    PNG_cMin = np.log10(temp_json_data['Output_Inversion_ColorBarResistivityMin']) # None表示自動
    PNG_cMax = np.log10(temp_json_data['Output_Inversion_ColorBarResistivityMax']) # None表示自動
    PNG_DPI = 100
    PNG_Width = 1280
    PNG_Height = 720    
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_INV3.png')
    #--
    # 建立畫布
    fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
    # 繪製網格
    ax, cbar = pg.show(PNG_mesh, 
        data=PNG_mesh_data, 
        ax=ax,
        markers=False,
        showMesh=PNG_mesh_showMesh,
        showBoundary=PNG_mesh_showBoundary,  
        label=PNG_colorbar_title,     # colorbar的標題。
        axisLabels=False,             # 阻止自動標籤(否則特定條件下會把Y軸轉換成深度)。後面自行填入標籤。
        cMap=PNG_cMap,
        cMin=PNG_cMin,
        cMax=PNG_cMax)
    # 繪製電極
    ax.plot(PNG_NumPy_Electrode_x[Good_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Good_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='magenta', markeredgecolor='black', label='Electrode Nodes')    
    if len(Bad_Electrode_Index_0Base) >0 :
        ax.plot(PNG_NumPy_Electrode_x[Bad_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Bad_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='lightgray', markeredgecolor='black', label='Skipped Electrode Nodes')
    ax.set_title(PNG_Main_Title, pad=3)  
    # 調整XY標籤
    ax.set_xlabel('Distance (m)')
    ax.set_ylabel('Elevation (m)')
    # 調整圖例
    ax.legend(loc='upper right',ncol=2,framealpha=0.4)
    # 調整colorbar內文字
    if PNG_colorbar_ticker_ModifyLog10ToLinear_Enable:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda x, pos: f'{10**x:.1f}'.rstrip('0').rstrip('.')))    
        cbar.ax.xaxis.get_offset_text().set_visible(False) # 避免顯示 1eX
        cbar.set_label(PNG_colorbar_ticker_ModifyLog10ToLinear_title) # 使用你設定的 Ωm 標題
    else:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
        cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
    #--
    # 填入版本資訊
    fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    # 調整邊界
    x_min, x_max = ax.get_xlim()
    y_min, y_max = ax.get_ylim()
    x_range = x_max - x_min
    y_range = y_max - y_min
    ax.set_ylim(y_min , y_max + 0.1 * y_range)
    #--
    #print(f'儲存 {PNG_Profile_Name} 圖片...')
    #Output_PNG_FileName = 'ABCD.png'
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
    plt.close()
    #print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
    #==============================================================================
    #==============================================================================
    # Pygimli網格繪圖:  繪製研究區域網格逆推剖面(電阻率、電極位置、逆推資訊) 有coverage 有網格 #C0
    #--    
    # 可填入的資訊
    PNG_Profile_Name = Main_FileName
    PNG_NumPy_Electrode_x = LastInversion_Data.sensors().array()[:, 0]
    PNG_NumPy_Electrode_y = LastInversion_Data.sensors().array()[:, 1]
    PNG_NumPy_Electrode_z = LastInversion_Data.sensors().array()[:, 2]
    PNG_mesh = LastInversion_InversionModelMesh
    PNG_mesh_data = LastInversion_InversionModelMesh['Resistivity_(log10)']
    PNG_mesh_coverage = LastInversion_InversionModelMesh['Coverage']
    PNG_colorbar_title = 'Resistivity (log10 Ωm)'
    PNG_colorbar_ticker_ModifyLog10ToLinear_Enable = True # True = 把colorbar數值文字從對數尺度調整成線性尺度 / False = 維持原本數值
    PNG_colorbar_ticker_ModifyLog10ToLinear_title = 'Resistivity (Ωm)'
    PNG_Main_Title = f"{PNG_Profile_Name} Inverted Resistivity Section with Coverage " + \
        f" (Iteration={Info_Iteration_count})" + \
        f"\nData Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        f"Data EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}"                 
    PNG_mesh_showMesh = True # True / False
    PNG_mesh_showBoundary = True # None / True / False ，某些時候None與True效果相同
    PNG_cMap = 'jet'
    PNG_cMin = np.min(PNG_mesh_data) # None表示自動
    PNG_cMax = np.max(PNG_mesh_data) # None表示自動
    # 檢查是否所有數值都相同
    if PNG_cMin == PNG_cMax:
        # 如果全部相同，設定極小的偏移量
        PNG_cMin = PNG_cMin - 0.000001
        PNG_cMax = PNG_cMax + 0.000001
    PNG_DPI = 100
    PNG_Width = 1280
    PNG_Height = 720    
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_INVC.png')
    #--
    # 建立畫布
    fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
    # 繪製網格
    ax, cbar = pg.show(PNG_mesh, 
        data=PNG_mesh_data, 
        coverage=PNG_mesh_coverage,
        ax=ax,
        markers=False,
        showMesh=PNG_mesh_showMesh,
        showBoundary=PNG_mesh_showBoundary,  
        label=PNG_colorbar_title,     # colorbar的標題。
        axisLabels=False,             # 阻止自動標籤(否則特定條件下會把Y軸轉換成深度)。後面自行填入標籤。
        cMap=PNG_cMap,
        cMin=PNG_cMin,
        cMax=PNG_cMax)
    # 繪製電極
    ax.plot(PNG_NumPy_Electrode_x[Good_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Good_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='magenta', markeredgecolor='black', label='Electrode Nodes')    
    if len(Bad_Electrode_Index_0Base) >0 :
        ax.plot(PNG_NumPy_Electrode_x[Bad_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Bad_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='lightgray', markeredgecolor='black', label='Skipped Electrode Nodes')
    ax.set_title(PNG_Main_Title, pad=3)  
    # 調整XY標籤
    ax.set_xlabel('Distance (m)')
    ax.set_ylabel('Elevation (m)')
    # 調整圖例
    ax.legend(loc='upper right',ncol=2,framealpha=0.4)
    # 調整colorbar內文字
    if PNG_colorbar_ticker_ModifyLog10ToLinear_Enable:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda x, pos: f'{10**x:.1f}'.rstrip('0').rstrip('.')))    
        cbar.ax.xaxis.get_offset_text().set_visible(False) # 避免顯示 1eX
        cbar.set_label(PNG_colorbar_ticker_ModifyLog10ToLinear_title) # 使用你設定的 Ωm 標題
    else:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
        cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
    #--
    # 填入版本資訊
    fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    # 調整邊界
    x_min, x_max = ax.get_xlim()
    y_min, y_max = ax.get_ylim()
    x_range = x_max - x_min
    y_range = y_max - y_min
    ax.set_ylim(y_min , y_max + 0.1 * y_range)
    #--
    #print(f'儲存 {PNG_Profile_Name} 圖片...')
    #Output_PNG_FileName = 'ABCD.png'
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
    plt.close()
    #print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
    #==============================================================================
    #==============================================================================
    # Pygimli網格繪圖:  繪製研究區域網格逆推剖面(電阻率、電極位置、逆推資訊) 有coverage 無網格 #C1
    #--    
    # 可填入的資訊
    PNG_Profile_Name = Main_FileName
    PNG_NumPy_Electrode_x = LastInversion_Data.sensors().array()[:, 0]
    PNG_NumPy_Electrode_y = LastInversion_Data.sensors().array()[:, 1]
    PNG_NumPy_Electrode_z = LastInversion_Data.sensors().array()[:, 2]
    PNG_mesh = LastInversion_InversionModelMesh
    PNG_mesh_data = LastInversion_InversionModelMesh['Resistivity_(log10)']
    PNG_mesh_coverage = LastInversion_InversionModelMesh['Coverage']
    PNG_colorbar_title = 'Resistivity (log10 Ωm)'
    PNG_colorbar_ticker_ModifyLog10ToLinear_Enable = True # True = 把colorbar數值文字從對數尺度調整成線性尺度 / False = 維持原本數值
    PNG_colorbar_ticker_ModifyLog10ToLinear_title = 'Resistivity (Ωm)'
    PNG_Main_Title = f"{PNG_Profile_Name} Inverted Resistivity Section with Coverage " + \
        f" (Iteration={Info_Iteration_count})" + \
        f"\nData Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        f"Data EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}"                 
    PNG_mesh_showMesh = False # True / False
    PNG_mesh_showBoundary = True # None / True / False ，某些時候None與True效果相同
    PNG_cMap = 'jet'
    PNG_cMin = np.min(PNG_mesh_data) # None表示自動
    PNG_cMax = np.max(PNG_mesh_data) # None表示自動
    # 檢查是否所有數值都相同
    if PNG_cMin == PNG_cMax:
        # 如果全部相同，設定極小的偏移量
        PNG_cMin = PNG_cMin - 0.000001
        PNG_cMax = PNG_cMax + 0.000001
    PNG_DPI = 100
    PNG_Width = 1280
    PNG_Height = 720    
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_INVC1.png')
    #--
    # 建立畫布
    fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
    # 繪製網格
    ax, cbar = pg.show(PNG_mesh, 
        data=PNG_mesh_data, 
        coverage=PNG_mesh_coverage,
        ax=ax,
        markers=False,
        showMesh=PNG_mesh_showMesh,
        showBoundary=PNG_mesh_showBoundary,  
        label=PNG_colorbar_title,     # colorbar的標題。
        axisLabels=False,             # 阻止自動標籤(否則特定條件下會把Y軸轉換成深度)。後面自行填入標籤。
        cMap=PNG_cMap,
        cMin=PNG_cMin,
        cMax=PNG_cMax)
    # 繪製電極
    ax.plot(PNG_NumPy_Electrode_x[Good_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Good_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='magenta', markeredgecolor='black', label='Electrode Nodes')    
    if len(Bad_Electrode_Index_0Base) >0 :
        ax.plot(PNG_NumPy_Electrode_x[Bad_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Bad_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='lightgray', markeredgecolor='black', label='Skipped Electrode Nodes')
    ax.set_title(PNG_Main_Title, pad=3)  
    # 調整XY標籤
    ax.set_xlabel('Distance (m)')
    ax.set_ylabel('Elevation (m)')
    # 調整圖例
    ax.legend(loc='upper right',ncol=2,framealpha=0.4)
    # 調整colorbar內文字
    if PNG_colorbar_ticker_ModifyLog10ToLinear_Enable:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda x, pos: f'{10**x:.1f}'.rstrip('0').rstrip('.')))    
        cbar.ax.xaxis.get_offset_text().set_visible(False) # 避免顯示 1eX
        cbar.set_label(PNG_colorbar_ticker_ModifyLog10ToLinear_title) # 使用你設定的 Ωm 標題
    else:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
        cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
    #--
    # 填入版本資訊
    fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    # 調整邊界
    x_min, x_max = ax.get_xlim()
    y_min, y_max = ax.get_ylim()
    x_range = x_max - x_min
    y_range = y_max - y_min
    ax.set_ylim(y_min , y_max + 0.1 * y_range)
    #--
    #print(f'儲存 {PNG_Profile_Name} 圖片...')
    #Output_PNG_FileName = 'ABCD.png'
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
    plt.close()
    #print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
    #==============================================================================
    #==============================================================================
    # Pygimli網格繪圖:  繪製研究區域網格逆推剖面(電阻率、電極位置、逆推資訊) 有coverage 有網格 自訂colorbar #C2
    #--    
    # 可填入的資訊
    PNG_Profile_Name = Main_FileName
    PNG_NumPy_Electrode_x = LastInversion_Data.sensors().array()[:, 0]
    PNG_NumPy_Electrode_y = LastInversion_Data.sensors().array()[:, 1]
    PNG_NumPy_Electrode_z = LastInversion_Data.sensors().array()[:, 2]
    PNG_mesh = LastInversion_InversionModelMesh
    PNG_mesh_data = LastInversion_InversionModelMesh['Resistivity_(log10)']
    PNG_mesh_coverage = LastInversion_InversionModelMesh['Coverage']
    PNG_colorbar_title = 'Resistivity (log10 Ωm)'
    PNG_colorbar_ticker_ModifyLog10ToLinear_Enable = True # True = 把colorbar數值文字從對數尺度調整成線性尺度 / False = 維持原本數值
    PNG_colorbar_ticker_ModifyLog10ToLinear_title = 'Resistivity (Ωm)'
    PNG_Main_Title = f"{PNG_Profile_Name} Inverted Resistivity Section with Coverage " + \
        f" (Iteration={Info_Iteration_count})" + \
        f"\nData Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        f"Data EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}"                 
    PNG_mesh_showMesh = True # True / False
    PNG_mesh_showBoundary = True # None / True / False ，某些時候None與True效果相同
    PNG_cMap = 'jet'
    PNG_cMin = np.log10(temp_json_data['Output_Inversion_ColorBarResistivityMin']) # None表示自動
    PNG_cMax = np.log10(temp_json_data['Output_Inversion_ColorBarResistivityMax']) # None表示自動
    PNG_DPI = 100
    PNG_Width = 1280
    PNG_Height = 720    
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_INVC.png')
    #--
    # 建立畫布
    fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
    # 繪製網格
    ax, cbar = pg.show(PNG_mesh, 
        data=PNG_mesh_data, 
        coverage=PNG_mesh_coverage,
        ax=ax,
        markers=False,
        showMesh=PNG_mesh_showMesh,
        showBoundary=PNG_mesh_showBoundary,  
        label=PNG_colorbar_title,     # colorbar的標題。
        axisLabels=False,             # 阻止自動標籤(否則特定條件下會把Y軸轉換成深度)。後面自行填入標籤。
        cMap=PNG_cMap,
        cMin=PNG_cMin,
        cMax=PNG_cMax)
    # 繪製電極
    ax.plot(PNG_NumPy_Electrode_x[Good_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Good_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='magenta', markeredgecolor='black', label='Electrode Nodes')    
    if len(Bad_Electrode_Index_0Base) >0 :
        ax.plot(PNG_NumPy_Electrode_x[Bad_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Bad_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='lightgray', markeredgecolor='black', label='Skipped Electrode Nodes')
    ax.set_title(PNG_Main_Title, pad=3)  
    # 調整XY標籤
    ax.set_xlabel('Distance (m)')
    ax.set_ylabel('Elevation (m)')
    # 調整圖例
    ax.legend(loc='upper right',ncol=2,framealpha=0.4)
    # 調整colorbar內文字
    if PNG_colorbar_ticker_ModifyLog10ToLinear_Enable:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda x, pos: f'{10**x:.1f}'.rstrip('0').rstrip('.')))    
        cbar.ax.xaxis.get_offset_text().set_visible(False) # 避免顯示 1eX
        cbar.set_label(PNG_colorbar_ticker_ModifyLog10ToLinear_title) # 使用你設定的 Ωm 標題
    else:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
        cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
    #--
    # 填入版本資訊
    fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    # 調整邊界
    x_min, x_max = ax.get_xlim()
    y_min, y_max = ax.get_ylim()
    x_range = x_max - x_min
    y_range = y_max - y_min
    ax.set_ylim(y_min , y_max + 0.1 * y_range)
    #--
    #print(f'儲存 {PNG_Profile_Name} 圖片...')
    #Output_PNG_FileName = 'ABCD.png'
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
    plt.close()
    #print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
    #==============================================================================
    #==============================================================================
    # Pygimli網格繪圖:  繪製研究區域網格逆推剖面(電阻率、電極位置、逆推資訊) 有coverage 無網格 自訂colorbar #C3
    #--    
    # 可填入的資訊
    PNG_Profile_Name = Main_FileName
    PNG_NumPy_Electrode_x = LastInversion_Data.sensors().array()[:, 0]
    PNG_NumPy_Electrode_y = LastInversion_Data.sensors().array()[:, 1]
    PNG_NumPy_Electrode_z = LastInversion_Data.sensors().array()[:, 2]
    PNG_mesh = LastInversion_InversionModelMesh
    PNG_mesh_data = LastInversion_InversionModelMesh['Resistivity_(log10)']
    PNG_mesh_coverage = LastInversion_InversionModelMesh['Coverage']
    PNG_colorbar_title = 'Resistivity (log10 Ωm)'
    PNG_colorbar_ticker_ModifyLog10ToLinear_Enable = True # True = 把colorbar數值文字從對數尺度調整成線性尺度 / False = 維持原本數值
    PNG_colorbar_ticker_ModifyLog10ToLinear_title = 'Resistivity (Ωm)'
    PNG_Main_Title = f"{PNG_Profile_Name} Inverted Resistivity Section with Coverage " + \
        f" (Iteration={Info_Iteration_count})" + \
        f"\nData Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        f"Data EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}"                 
    PNG_mesh_showMesh = False # True / False
    PNG_mesh_showBoundary = True # None / True / False ，某些時候None與True效果相同
    PNG_cMap = 'jet'
    PNG_cMin = np.log10(temp_json_data['Output_Inversion_ColorBarResistivityMin']) # None表示自動
    PNG_cMax = np.log10(temp_json_data['Output_Inversion_ColorBarResistivityMax']) # None表示自動
    PNG_DPI = 100
    PNG_Width = 1280
    PNG_Height = 720    
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_INVC1.png')
    #--
    # 建立畫布
    fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
    # 繪製網格
    ax, cbar = pg.show(PNG_mesh, 
        data=PNG_mesh_data, 
        coverage=PNG_mesh_coverage,
        ax=ax,
        markers=False,
        showMesh=PNG_mesh_showMesh,
        showBoundary=PNG_mesh_showBoundary,  
        label=PNG_colorbar_title,     # colorbar的標題。
        axisLabels=False,             # 阻止自動標籤(否則特定條件下會把Y軸轉換成深度)。後面自行填入標籤。
        cMap=PNG_cMap,
        cMin=PNG_cMin,
        cMax=PNG_cMax)
    # 繪製電極
    ax.plot(PNG_NumPy_Electrode_x[Good_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Good_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='magenta', markeredgecolor='black', label='Electrode Nodes')    
    if len(Bad_Electrode_Index_0Base) >0 :
        ax.plot(PNG_NumPy_Electrode_x[Bad_Electrode_Index_0Base], PNG_NumPy_Electrode_y[Bad_Electrode_Index_0Base], 'o', markersize=6, color='magenta', markerfacecolor='lightgray', markeredgecolor='black', label='Skipped Electrode Nodes')
    ax.set_title(PNG_Main_Title, pad=3)  
    # 調整XY標籤
    ax.set_xlabel('Distance (m)')
    ax.set_ylabel('Elevation (m)')
    # 調整圖例
    ax.legend(loc='upper right',ncol=2,framealpha=0.4)
    # 調整colorbar內文字
    if PNG_colorbar_ticker_ModifyLog10ToLinear_Enable:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda x, pos: f'{10**x:.1f}'.rstrip('0').rstrip('.')))    
        cbar.ax.xaxis.get_offset_text().set_visible(False) # 避免顯示 1eX
        cbar.set_label(PNG_colorbar_ticker_ModifyLog10ToLinear_title) # 使用你設定的 Ωm 標題
    else:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
        cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
    #--
    # 填入版本資訊
    fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    # 調整邊界
    x_min, x_max = ax.get_xlim()
    y_min, y_max = ax.get_ylim()
    x_range = x_max - x_min
    y_range = y_max - y_min
    ax.set_ylim(y_min , y_max + 0.1 * y_range)
    #--
    #print(f'儲存 {PNG_Profile_Name} 圖片...')
    #Output_PNG_FileName = 'ABCD.png'
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
    plt.close()
    #print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
    #==============================================================================
    #==============================================================================
    # 繪圖 AppRes Obs
    #--    
    # 可填入的資訊 
    PNG_Profile_Name = Main_FileName
    PNG_colorbar_title = 'Apparent Resistivity (log10 Ωm)'
    PNG_Obs_AppRes=np.log10(Info_LastInversion_Obs_dataVals)
    PNG_colorbar_ticker_ModifyLog10ToLinear_Enable = True # True = 把colorbar數值文字從對數尺度調整成線性尺度 / False = 維持原本數值
    PNG_colorbar_ticker_ModifyLog10ToLinear_title = 'Apparent Resistivity (Ωm)'
    PNG_Main_Title = f"{PNG_Profile_Name} Observed Data Apparent Resistivity Distribution " + \
        f" (Iteration={Info_Iteration_count})" + \
        f"\nData Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        f"Data EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}" 
    PNG_DPI = 100
    PNG_Width = 1280
    PNG_Height = 720    
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_DataObs.png')
    #--
    # 建立畫布
    fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
    # 使用 ert.show() 來顯示資料，並自動決定色階範圍
    ax, cbar = ert.show(
          Ohm_data,                    # 必須的參數：DataContainerERT 物件
          vals=PNG_Obs_AppRes,       # 要繪製的數據
          ax=ax,                       # 指定畫在剛才建立的 ax 上
          label=PNG_colorbar_title,                  # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
          xlabel=None,                 # 預設值：x 軸標籤
          ylabel=None                  # 預設值：y 軸標籤
      )
    # 
    ax.set_title(PNG_Main_Title, pad=3) 
    ax.set_xlabel("")
    # 調整colorbar內文字
    if PNG_colorbar_ticker_ModifyLog10ToLinear_Enable:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda x, pos: f'{10**x:.1f}'.rstrip('0').rstrip('.')))    
        cbar.ax.xaxis.get_offset_text().set_visible(False) # 避免顯示 1eX
        cbar.set_label(PNG_colorbar_ticker_ModifyLog10ToLinear_title) # 使用你設定的 Ωm 標題
    else:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
        cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
    #--
    # 填入版本資訊
    fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    #--
    #print(f'儲存 {PNG_Profile_Name} 圖片...')
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
    plt.close()
    #print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
    #==============================================================================
    #==============================================================================
    # 繪圖 AppRes Cal
    #--    
    # 可填入的資訊 
    PNG_Profile_Name = Main_FileName
    PNG_colorbar_title = 'Apparent Resistivity (log10 Ωm)'
    PNG_Cal_AppRes=np.log10(Info_LastInversion_response_dataVals)
    PNG_colorbar_ticker_ModifyLog10ToLinear_Enable = True # True = 把colorbar數值文字從對數尺度調整成線性尺度 / False = 維持原本數值
    PNG_colorbar_ticker_ModifyLog10ToLinear_title = 'Apparent Resistivity (Ωm)'
    PNG_Main_Title = f"{PNG_Profile_Name} Predicted Data Apparent Resistivity Distribution " + \
        f" (Iteration={Info_Iteration_count})" + \
        f"\nData Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        f"Data EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}" 
    PNG_DPI = 100
    PNG_Width = 1280
    PNG_Height = 720    
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_DataCal.png')
    #--
    # 建立畫布
    fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
    # 使用 ert.show() 來顯示資料，並自動決定色階範圍
    ax, cbar = ert.show(
          Ohm_data,                    # 必須的參數：DataContainerERT 物件
          vals=PNG_Cal_AppRes,       # 要繪製的數據
          ax=ax,                       # 指定畫在剛才建立的 ax 上
          label=PNG_colorbar_title,                  # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
          xlabel=None,                 # 預設值：x 軸標籤
          ylabel=None                  # 預設值：y 軸標籤
      )
    # 
    ax.set_title(PNG_Main_Title, pad=3) 
    ax.set_xlabel("")
    # 調整colorbar內文字
    if PNG_colorbar_ticker_ModifyLog10ToLinear_Enable:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda x, pos: f'{10**x:.1f}'.rstrip('0').rstrip('.')))    
        cbar.ax.xaxis.get_offset_text().set_visible(False) # 避免顯示 1eX
        cbar.set_label(PNG_colorbar_ticker_ModifyLog10ToLinear_title) # 使用你設定的 Ωm 標題
    else:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
        cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
    #--
    # 填入版本資訊
    fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    #--
    #print(f'儲存 {PNG_Profile_Name} 圖片...')
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
    plt.close()
    #print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
    #==============================================================================
    #==============================================================================
    # 繪圖 AppRes Misfit
    #--    
    # 可填入的資訊 
    PNG_Profile_Name = Main_FileName
    PNG_colorbar_title = 'Relative Data Misfit (%)'
    PNG_Misfit=(1-(Info_LastInversion_response_dataVals/Info_LastInversion_Obs_dataVals))*100
    PNG_colorbar_ticker_ModifyLog10ToLinear_Enable = False # True = 把colorbar數值文字從對數尺度調整成線性尺度 / False = 維持原本數值
    PNG_colorbar_ticker_ModifyLog10ToLinear_title = 'Relative Data Misfit (%)'
    PNG_Main_Title = f"{PNG_Profile_Name} Relative Data Misfit Distribution " + \
        f" (Iteration={Info_Iteration_count})" + \
        f"\nData Count={Info_LastInversion_Obs_dataVals_Count}, " + \
        f"Data EstError={Data_Settings_Relative_Error_Percentage}%, " + \
        f"Remove Runs={Current_Remove_Runs}, " + \
        f"Remove Data={Inversion_Remove_Data_Percentage}%, " + \
        rf"$\lambda${Current_lamda_number}={Info_LastInversion_Lamda}, " + \
        f"limits=[{Inversion_limitModelCellMinValue:.2f},{Inversion_limitModelCellMaxValue:.2f}]Ωm, " + \
        f"RRMS={Info_LastInversion_RRMS:.2f}%, " + \
        rf"$\chi^2$={Info_LastInversion_chi2:.2f}" 
    PNG_DPI = 100
    PNG_Width = 1280
    PNG_Height = 720    
    Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{Info_Iteration_count:02d}_DataRMisfit.png')
    #--
    # 建立畫布
    fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
    # 使用 ert.show() 來顯示資料，並自動決定色階範圍
    ax, cbar = ert.show(
          Ohm_data,                    # 必須的參數：DataContainerERT 物件
          vals=PNG_Misfit,       # 要繪製的數據
          ax=ax,                       # 指定畫在剛才建立的 ax 上
          label=PNG_colorbar_title,                  # colorbar的標題，不填就自動產生Apparent resistivity (Ωm)。
          cMin=-np.max(np.abs(PNG_Misfit)),              # 強制對稱範圍
          cMax=np.max(np.abs(PNG_Misfit)),              # 強制對稱範圍
          cMap="bwr",              # 藍白紅配色 (Blue-White-Red)
          xlabel=None,                 # 預設值：x 軸標籤
          ylabel=None                  # 預設值：y 軸標籤
      )
    # 
    ax.set_title(PNG_Main_Title, pad=3) 
    ax.set_xlabel("")
    # 調整colorbar內文字
    if PNG_colorbar_ticker_ModifyLog10ToLinear_Enable:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda x, pos: f'{10**x:.1f}'.rstrip('0').rstrip('.')))    
        cbar.ax.xaxis.get_offset_text().set_visible(False) # 避免顯示 1eX
        cbar.set_label(PNG_colorbar_ticker_ModifyLog10ToLinear_title) # 使用你設定的 Ωm 標題
    else:
        cbar.ax.xaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
        cbar.ax.xaxis.get_offset_text().set_visible(False)  # 避免顯示 1eX
    #--
    # 填入版本資訊
    fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    #--
    #print(f'儲存 {PNG_Profile_Name} 圖片...')
    if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
        os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
    plt.tight_layout() 
    plt.savefig(Output_PNG_FileName, dpi=PNG_DPI)
    plt.close()
    #print(f'儲存 {PNG_Profile_Name} 圖片...完成!')
    #==============================================================================  
    print("--")
#--------------------------------------------
#--------------------------------------------
# 逆推參數(終止疊代任務相關)
#Default_maxIter = 20 #預設值20，我規定成必填項目。
#Default_dPhi = 1 #預設值1，單位[%]，我規定不允許改變。[終止疊代任務門檻]：定義目標函數最小化的「相對改善率」下限。當疊代效益 < 1% 時，視為模型已達穩定狀態，提前終止逆推，防止對噪聲過度擬合。
# 逆推參數(正則化相關)
#Default_lam = 20 #預設值200，我規定成必填項目。
#Default_lambdaFactor = 1 #預設值1，我規定不允許改變。
#Default_isReference = False #預設值關閉，我規定不允許改變。是否要讓起始模型也同時成為先驗模型。 
# 逆推參數(資料擬合相關)
#Default_robustData = False #預設值關閉，我規定不允許改變。False表示使用一般模式(L2範數)，誤差會被平方，適合資料品質好時可達最佳效果。True表示使用強健模式，誤差會被重新加權，來容忍資料品質不好的離群點多的情況。
#Default_blockyModel = False #預設值關閉，我規定不允許改變。False表示空間格子應該像漸層，True表示空間格子像塊狀。
# 逆推參數
#Default_showProgress = False #預設值關閉，我規定不允許改變。
#Default_verbose = False # 預設值關閉，我規定成必填項目。
#Default_debug = False # 預設值關閉，我規定不允許改變。
# limits=[0, 0] # 預設值是[0, 0]。是線性數值，單位:[Ohm-m]
#--------------------------------------------
# 準備逆推參數
Inversion_Remove_Data_Times = temp_json_data["Inversion_Setting01_Remove_Data_Times"] #建議值 = 3，不想刪資料就設定「0」
Inversion_Remove_Data_Percentage = temp_json_data["Inversion_Setting02_Remove_Data_Percentage"] #建議值 = 5 ，單位:[%]
Inversion_lam_list = temp_json_data["Inversion_Setting03_Lamda"] #預設值20
print(f"遞減Lamda清單 = {Inversion_lam_list}")
Inversion_lam_list_count = len(Inversion_lam_list) 
print(f"遞減Lamda清單數量 = {Inversion_lam_list_count}")
print("--")
Inversion_maxIter = temp_json_data["Inversion_Setting04_maxIter"] #預設值20
if temp_json_data["Inversion_Setting05_startModel"] > 0 :
    Inversion_startModel = temp_json_data["Inversion_Setting05_startModel"] #預設值「None」，None表示使用資料的中位數。
elif temp_json_data["Inversion_Setting05_startModel"] == -2 :    
    #--------------------------------------------
    print(f"全網格數量={mesh.cellCount()},研究區域網格數量={np.sum(mesh.cellMarkers() == 2)}.")
    print("使用電阻率欄位設定起始模型電阻率...")
    if mesh.haveData("Resistivity"):
        print(f'設定起始模型電阻率(Min/Max) = {np.min(mesh["Resistivity"][(mesh.cellMarkers() == 2)])}/{np.max(mesh["Resistivity"][(mesh.cellMarkers() == 2)])}')
        Inversion_startModel = mesh["Resistivity"][(mesh.cellMarkers() == 2)]
    else:
        print('沒有找到電阻率資訊，改用資料的中位數的均質模型。')
        Inversion_startModel = None #預設值「None」，None表示使用資料的中位數。
    print("使用電阻率欄位設定起始模型電阻率...完成!")  
elif temp_json_data["Inversion_Setting05_startModel"] == -3 :    
    #--------------------------------------------
    # 建立網格
    temp_mesh = pg.Mesh(2)
    # 使用計算出的節點座標創建網格
    print("讀取 .vtk 檔...")
    temp_mesh.load(temp_json_data["InputFile05_StudyAreaStartModelVTK_FileName"])
    print("讀取 .vtk 檔...完成!")
    #--------------------------------------------
    print(f"全網格數量={mesh.cellCount()},研究區域網格數量={np.sum(mesh.cellMarkers() == 2)}.")
    print(f"起始模型網格數量={temp_mesh.cellCount()}.")
    if temp_mesh.cellCount() == np.sum(mesh.cellMarkers() == 2) :
        print("起始模型網格數量與研究區域網格數量相等!")
        print("使用電阻率欄位設定起始模型電阻率...")
        if temp_mesh.haveData("Resistivity"):
            print(f'設定起始模型電阻率(Min/Max) = {np.min(temp_mesh["Resistivity"])}/{np.max(temp_mesh["Resistivity"])}')
            Inversion_startModel = temp_mesh["Resistivity"]
        else:
            print('沒有找到電阻率資訊，改用資料的中位數的均質模型。')
            Inversion_startModel = None #預設值「None」，None表示使用資料的中位數。
        print("使用電阻率欄位設定起始模型電阻率...完成!")    
else:
    Inversion_startModel = None #預設值「None」，None表示使用資料的中位數。
if temp_json_data["Inversion_Setting06_verbose_Enable"] == 'Yes' :
    Inversion_verbose = True #預設值關閉「False」，要開啟填「True」。
else:
    Inversion_verbose = False #預設值關閉「False」，要開啟填「True」。
Inversion_limitModelCellMinValue = temp_json_data["Inversion_Setting07_limitModelCellMinValue"] #預設值0
Inversion_limitModelCellMaxValue = temp_json_data["Inversion_Setting08_limitModelCellMaxValue"] #預設值0
if Inversion_limitModelCellMinValue >= Inversion_limitModelCellMaxValue:
    Inversion_limitModelCellMinValue = 0
    Inversion_limitModelCellMaxValue = 0
if temp_json_data["Inversion_Setting09_SR_Enable"] == 'Yes' :
    Inversion_SR = True #預設值開啟「True」，要關閉填「False」。
else:
    Inversion_SR = False #預設值開啟「True」，要關閉填「False」。
#--
# 輸出逆推紀錄檔案 (檔頭部分)
Output_Inversion_Log = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_03_Inversion_Log.csv')
#print('儲存CSV檔案...')
with open(Output_Inversion_Log, 'w', encoding='utf-8') as f:
    #--
    # 前方固定內容
    line = 'Main_FileName,SR,GeometricFactorByMesh,Remove_Runs,Remove_Data[%],Iteration,Max_Iteration,' + \
    'StartModel_Cell_Count,StartModel_Cell_Value_Min[Ohm-m],StartModel_Cell_Value_Max[Ohm-m],' + \
    'LitmitModel_Cell_Value_Min[Ohm-m],LitmitModel_Cell_Value_Max[Ohm-m],' + \
    'ForwardH2Model_Cell_Count,ForwardH2Model_Cell_Value_Min[Ohm-m],ForwardH2Model_Cell_Value_Max[Ohm-m],' + \
    'InversionModel_Cell_Count,InversionModel_Cell_Value_Min[Ohm-m],InversionModel_Cell_Value_Max[Ohm-m],' + \
    'Obs_Data_Count,Obs_Data_Value_Min[Ohm-m],Obs_Data_Value_Max[Ohm-m],' + \
    'Obs_Data_Relative_Error_Min[%],Obs_Data_Relative_Error_Max[%],' + \
    'Cal_Data_Value_Min[Ohm-m],Cal_Data_Value_Max[Ohm-m],' + \
    'Relative_Misfit_Min[%],Relative_Misfit_Mean[%],Relative_Misfit_Max[%],' + \
    'Lamda,RMS,RRMS[%],Chi2,Phi,PhiD,PhiM\n'    
    f.write(line)
    #--
#print('儲存CSV檔案...完成!')
#--
print("用data建立ERTManager物件...")
mgr = ert.ERTManager(Ohm_data, sr=Inversion_SR)    
print("建立ERTManager物件...完成")
#--
print("使用管理器設定PostStep...")


# 告訴反演器：每次迭代結束，就去執行一次「Inversion_Info_Update」
mgr.inv.setPostStep(Inversion_Info_Update)
print("使用管理器設定PostStep...完成!")
#--
print("**使用管理器運行逆推...")
#--
# 第0次(沒刪除資料)
Current_Remove_Runs = 0
print(f'逆推進度({Current_Remove_Runs}/{Inversion_Remove_Data_Times})...')
Continue_Inversion_startModel = Inversion_startModel
for lamda_index in range(Inversion_lam_list_count):
    Current_lamda_number =  lamda_index + 1
    print(f"使用第{Current_lamda_number}個lam進行逆推(lam={Inversion_lam_list[lamda_index]})...")
    Inversion_lam = Inversion_lam_list[lamda_index]
    if lamda_index == 0 :
        print("沒有可接關的模型，用參數決定的起始模型!")
        mgr.invert(Ohm_data,mesh=mesh, lam=Inversion_lam, maxIter=Inversion_maxIter, startModel=Inversion_startModel, verbose=Inversion_verbose, limits=[Inversion_limitModelCellMinValue, Inversion_limitModelCellMaxValue])
    else :
        print("沒有可接關的模型，用參數決定的起始模型!")
        mgr.invert(Ohm_data,mesh=mesh, lam=Inversion_lam, maxIter=Inversion_maxIter, startModel=Continue_Inversion_startModel, verbose=Inversion_verbose, limits=[Inversion_limitModelCellMinValue, Inversion_limitModelCellMaxValue])
    print(f"使用第{lamda_index+1}個lam進行逆推(lam={Inversion_lam_list[lamda_index]})...完成!")
    print('更新一個「接關的起始模型」...')
    Continue_Inversion_startModel = mgr.inv.model
    print('更新一個「接關的起始模型」...完成')
    #--
    Output_Inversion_Log = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_03_Inversion_Log.csv')
    print('載入 Output_Inversion_Log 檔案...')
    try:
        #--------------------------------------------
        # 使用 np.loadtxt 載入 CSV 檔案 並強制所有內容為字串 (不含標頭)
        # dtype='str' 或 dtype=object：強制 NumPy 將每個單元格視為字串。
        # delimiter=','：指定逗號分隔。
        # skiprows=1：跳過標頭行。
        Inversion_Log_Matrix = np.loadtxt(
            Output_Inversion_Log, 
            dtype='str',
            delimiter=',', 
            skiprows=1,
            encoding='utf-8'
        )    
        #--------------------------------------------
        # 獨立載入標頭
        # 讀取整個檔案的第一行
        with open(Output_Inversion_Log, 'r', encoding='utf-8') as f:
            header_line = f.readline().strip()
        Inversion_Log_DataHeader = header_line.split(',')
        #--------------------------------------------
    except FileNotFoundError:
        print(f"錯誤：找不到檔案 {Input_v299Scsv_FileName}")
        exit(1) # 回傳1表示一般性錯誤
    except Exception as e:
        print(f"程式運行時發生錯誤: {e}")
        exit(1) # 回傳1表示一般性錯誤
    #--
    # 強制確保 Inversion_Log_Matrix 是 numpy 陣列
    Inversion_Log_Matrix = np.array(Inversion_Log_Matrix)
    # 如果只有一列數據導致維度變成 (N,)，將其轉回 (1, N) 或 (M, N)
    if Inversion_Log_Matrix.ndim == 1:
        Inversion_Log_Matrix = Inversion_Log_Matrix.reshape(1, -1)    
    print('載入 Output_Inversion_Log 檔案...完成!')
    #--
    # 目標函數下降比例: dPhi = current_Phi / last_Phi
    phi_list = Inversion_Log_Matrix[:, Inversion_Log_DataHeader.index('Phi')].astype(float)
    # current_phi = phi_list[-1]
    # last_phi = phi_list[-2]
    remove_runs_list = Inversion_Log_Matrix[:, Inversion_Log_DataHeader.index('Remove_Runs')]
    remove_data_list = Inversion_Log_Matrix[:, Inversion_Log_DataHeader.index('Remove_Data[%]')]
    iteration_list = Inversion_Log_Matrix[:, Inversion_Log_DataHeader.index('Iteration')]
    if Inversion_Log_Matrix.shape[0] < 2:
        # 如果只有一維，代表只有一筆紀錄，dPhi 無法計算 (設定為預設值) 代表當前目標函數與上一次完全一樣，能量下降率為 0%
        dPhi = 1.0 
    else:
        # 正常計算
        dPhi = phi_list[-1] / phi_list[-2]
    #--
    # 輸出停止原因檔案 
    Output_Inversion_Log = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_03_Inversion_Log.csv')+'.stop'
    if lamda_index == 0 :
        file_mode = 'w'
    else :
        file_mode = 'a'
    with open(Output_Inversion_Log, file_mode, encoding='utf-8') as f:
        #--
        if (dPhi > (1.0 - mgr.inv.minDPhi / 100.0)) and mgr.inv.iter >= 2:
            line=(f"Remove_Runs#{remove_runs_list[-1]}({remove_data_list[-1]}%),Iteration#{iteration_list[-1]}，運行結束原因: 已達到中止準則「dPhi({(1-dPhi)*100:.2f}%) < minDPhi({mgr.inv.minDPhi}%)」。")
        if mgr.inv.chi2() <= 1 and mgr.inv.stopAtChi1:
            line=(f"Remove_Runs#{remove_runs_list[-1]}({remove_data_list[-1]}%),Iteration#{iteration_list[-1]}，運行結束原因: 已達到中止準則「chi² <= 1」。目前 chi² = {mgr.inv.chi2():.2f}。")
        if mgr.inv.iter == Inversion_maxIter:
            line=(f"Remove_Runs#{remove_runs_list[-1]}({remove_data_list[-1]}%),Iteration#{iteration_list[-1]}，運行結束原因: 已達到設定的最大迭帶次數「iter == maxIter」。目前 iter = {mgr.inv.iter}。")   
        print(line)
        f.write(line+"\n")
    #--
    #--------------------------------------------
    # 取得運行結束時間
    program_end_time = datetime.now()
    # 計算時間差 (timedelta)
    time_difference = program_end_time - program_start_time
    total_seconds = time_difference.total_seconds()
    hours = int(total_seconds // 3600)
    minutes = int((total_seconds % 3600) // 60)
    seconds = int(total_seconds % 60)
    milliseconds = int((total_seconds % 1) * 1000)
    #print(f"程式結束運行...時間: {program_end_time.strftime('%Y-%m-%d %H:%M:%S')}")
    print(f"花費時間: {hours:02d}時 {minutes:02d}分 {seconds:02d}.{milliseconds:03d}秒")
    print('--')
    # 輸出花費時間檔案 
    Output_Inversion_Log = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_03_Inversion_Log.csv')+'.time'
    #print('儲存time檔案...')
    if lamda_index == 0 :
        file_mode = 'w'
    else :
        file_mode = 'a'
    with open(Output_Inversion_Log, file_mode, encoding='utf-8') as f:
        #--
        line = f"花費時間: {hours:02d}時 {minutes:02d}分 {seconds:02d}.{milliseconds:03d}秒"  
        f.write(line+"\n")
        #--
    #print('儲存time檔案...完成!')
    #--
    #--------------------------------------------
print(f'逆推進度({Current_Remove_Runs}/{Inversion_Remove_Data_Times})...完成!')
#--
# 預設方式儲存結果
Output_saveResult_FolderName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{temp_json_data["Output_MainFileName"]}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{mgr.inv.iter:02d}')
mgr.saveResult(Output_saveResult_FolderName)
print("**使用管理器運行逆推...完成!")
#--
print('--')
#--
for i in range(Inversion_Remove_Data_Times):
    #第i次刪除資料
    Current_Remove_Runs = Current_Remove_Runs + 1     
    #--
    # 1. 刪除資料
    #--
    # 計算要刪除的資料數量
    temp_All_Data_Count = len(Ohm_data['rhoa'])
    temp_Remove_Data_Count = int(np.round(temp_All_Data_Count * Inversion_Remove_Data_Percentage /100 ))
    temp_LastInversion_Relative_Misfit_Percentage = np.abs((mgr.inv.response - mgr.inv.dataVals) / mgr.inv.dataVals) * 100
    # 取得 misfit 最大的索引
    temp_worst_indices = np.argsort(temp_LastInversion_Relative_Misfit_Percentage)[-temp_Remove_Data_Count:]
    # 轉換成要刪除的遮罩
    temp_remove_mask = np.zeros(temp_All_Data_Count, dtype=bool)
    temp_remove_mask[temp_worst_indices] = True    
    # 執行刪除
    print(f"刪除之前的觀測資料數量: {Ohm_data_All_count}")
    Ohm_data.remove(temp_remove_mask)
    Ohm_data_Accept_count = Ohm_data.size()
    print(f"刪除之後的觀測資料數量: {Ohm_data_Accept_count}")    
    print(f'已刪除 {temp_Remove_Data_Count} 筆資料 (約 {Inversion_Remove_Data_Percentage}%)')
    #--
    # 2. 重新運行逆推
    #--
    print("用data建立ERTManager物件...")
    mgr = ert.ERTManager(Ohm_data, sr=Inversion_SR)    
    print("建立ERTManager物件...完成")
    #--
    print("使用管理器設定PostStep...")
    # 告訴反演器：每次迭代結束，就去執行一次「Inversion_Info_Update」
    mgr.inv.setPostStep(Inversion_Info_Update)
    print("使用管理器設定PostStep...完成!")
    #--
    print("**使用管理器運行逆推...")
    #--
    print(f'逆推進度({Current_Remove_Runs}/{Inversion_Remove_Data_Times})...')
    Continue_Inversion_startModel = Inversion_startModel
    for lamda_index in range(Inversion_lam_list_count):
        Current_lamda_number =  lamda_index + 1
        print(f"使用第{Current_lamda_number}個lam進行逆推(lam={Inversion_lam_list[lamda_index]})...")
        Inversion_lam = Inversion_lam_list[lamda_index]
        if lamda_index == 0 :
            print("沒有可接關的模型，用參數決定的起始模型!")
            mgr.invert(Ohm_data,mesh=mesh, lam=Inversion_lam, maxIter=Inversion_maxIter, startModel=Inversion_startModel, verbose=Inversion_verbose, limits=[Inversion_limitModelCellMinValue, Inversion_limitModelCellMaxValue])
        else :
            print("沒有可接關的模型，用參數決定的起始模型!")
            mgr.invert(Ohm_data,mesh=mesh, lam=Inversion_lam, maxIter=Inversion_maxIter, startModel=Continue_Inversion_startModel, verbose=Inversion_verbose, limits=[Inversion_limitModelCellMinValue, Inversion_limitModelCellMaxValue])
        print(f"使用第{lamda_index+1}個lam進行逆推(lam={Inversion_lam_list[lamda_index]})...完成!")
        print('更新一個「接關的起始模型」...')
        Continue_Inversion_startModel = mgr.inv.model
        print('更新一個「接關的起始模型」...完成')
        #--
        Output_Inversion_Log = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_03_Inversion_Log.csv')
        print('載入 Output_Inversion_Log 檔案...')
        try:
            #--------------------------------------------
            # 使用 np.loadtxt 載入 CSV 檔案 並強制所有內容為字串 (不含標頭)
            # dtype='str' 或 dtype=object：強制 NumPy 將每個單元格視為字串。
            # delimiter=','：指定逗號分隔。
            # skiprows=1：跳過標頭行。
            Inversion_Log_Matrix = np.loadtxt(
                Output_Inversion_Log, 
                dtype='str',
                delimiter=',', 
                skiprows=1,
                encoding='utf-8'
            )    
            #--------------------------------------------
            # 獨立載入標頭
            # 讀取整個檔案的第一行
            with open(Output_Inversion_Log, 'r', encoding='utf-8') as f:
                header_line = f.readline().strip()
            Inversion_Log_DataHeader = header_line.split(',')
            #--------------------------------------------
        except FileNotFoundError:
            print(f"錯誤：找不到檔案 {Input_v299Scsv_FileName}")
            exit(1) # 回傳1表示一般性錯誤
        except Exception as e:
            print(f"程式運行時發生錯誤: {e}")
            exit(1) # 回傳1表示一般性錯誤
        #--
        # 強制確保 Inversion_Log_Matrix 是 numpy 陣列
        Inversion_Log_Matrix = np.array(Inversion_Log_Matrix)
        # 如果只有一列數據導致維度變成 (N,)，將其轉回 (1, N) 或 (M, N)
        if Inversion_Log_Matrix.ndim == 1:
            Inversion_Log_Matrix = Inversion_Log_Matrix.reshape(1, -1)    
        print('載入 Output_Inversion_Log 檔案...完成!')
        #--
        # 目標函數下降比例: dPhi = current_Phi / last_Phi
        phi_list = Inversion_Log_Matrix[:, Inversion_Log_DataHeader.index('Phi')].astype(float)
        # current_phi = phi_list[-1]
        # last_phi = phi_list[-2]
        remove_runs_list = Inversion_Log_Matrix[:, Inversion_Log_DataHeader.index('Remove_Runs')]
        remove_data_list = Inversion_Log_Matrix[:, Inversion_Log_DataHeader.index('Remove_Data[%]')]
        iteration_list = Inversion_Log_Matrix[:, Inversion_Log_DataHeader.index('Iteration')]
        if Inversion_Log_Matrix.shape[0] < 2:
            # 如果只有一維，代表只有一筆紀錄，dPhi 無法計算 (設定為預設值) 代表當前目標函數與上一次完全一樣，能量下降率為 0%
            dPhi = 1.0 
        else:
            # 正常計算
            dPhi = phi_list[-1] / phi_list[-2]
        #--
        # 輸出停止原因檔案 
        Output_Inversion_Log = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_03_Inversion_Log.csv')+'.stop'
        if lamda_index == 0 :
            file_mode = 'w'
        else :
            file_mode = 'a'
        with open(Output_Inversion_Log, file_mode, encoding='utf-8') as f:
            #--
            if (dPhi > (1.0 - mgr.inv.minDPhi / 100.0)) and mgr.inv.iter >= 2:
                line=(f"Remove_Runs#{remove_runs_list[-1]}({remove_data_list[-1]}%),Iteration#{iteration_list[-1]}，運行結束原因: 已達到中止準則「dPhi({(1-dPhi)*100:.2f}%) < minDPhi({mgr.inv.minDPhi}%)」。")
            if mgr.inv.chi2() <= 1 and mgr.inv.stopAtChi1:
                line=(f"Remove_Runs#{remove_runs_list[-1]}({remove_data_list[-1]}%),Iteration#{iteration_list[-1]}，運行結束原因: 已達到中止準則「chi² <= 1」。目前 chi² = {mgr.inv.chi2():.2f}。")
            if mgr.inv.iter == Inversion_maxIter:
                line=(f"Remove_Runs#{remove_runs_list[-1]}({remove_data_list[-1]}%),Iteration#{iteration_list[-1]}，運行結束原因: 已達到設定的最大迭帶次數「iter == maxIter」。目前 iter = {mgr.inv.iter}。")   
            print(line)
            f.write(line+"\n")
        #--
        #--------------------------------------------
        # 取得運行結束時間
        program_end_time = datetime.now()
        # 計算時間差 (timedelta)
        time_difference = program_end_time - program_start_time
        total_seconds = time_difference.total_seconds()
        hours = int(total_seconds // 3600)
        minutes = int((total_seconds % 3600) // 60)
        seconds = int(total_seconds % 60)
        milliseconds = int((total_seconds % 1) * 1000)
        #print(f"程式結束運行...時間: {program_end_time.strftime('%Y-%m-%d %H:%M:%S')}")
        print(f"花費時間: {hours:02d}時 {minutes:02d}分 {seconds:02d}.{milliseconds:03d}秒")
        print('--')
        # 輸出花費時間檔案 
        Output_Inversion_Log = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_03_Inversion_Log.csv')+'.time'
        #print('儲存time檔案...')
        with open(Output_Inversion_Log, 'a', encoding='utf-8') as f:
            #--
            line = f"花費時間: {hours:02d}時 {minutes:02d}分 {seconds:02d}.{milliseconds:03d}秒"  
            f.write(line+"\n")
            #--
        #print('儲存time檔案...完成!')
        #--
        #--------------------------------------------
    print(f'逆推進度({Current_Remove_Runs}/{Inversion_Remove_Data_Times})...完成!')  
    #--
    # 預設方式儲存結果
    Output_saveResult_FolderName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{temp_json_data["Output_MainFileName"]}_R{Current_Remove_Runs:02d}_L{Current_lamda_number:02d}_I{mgr.inv.iter:02d}')
    mgr.saveResult(Output_saveResult_FolderName)
    print("**使用管理器運行逆推...完成!")
    #--
#--------------------------------------------
#--------------------------------------------
# 繪製收斂曲線圖
#--
Output_Inversion_Log = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_03_Inversion_Log.csv')
print('載入 Output_Inversion_Log 檔案...')
try:
    #--------------------------------------------
    # 使用 np.loadtxt 載入 CSV 檔案 並強制所有內容為字串 (不含標頭)
    # dtype='str' 或 dtype=object：強制 NumPy 將每個單元格視為字串。
    # delimiter=','：指定逗號分隔。
    # skiprows=1：跳過標頭行。
    Inversion_Log_Matrix = np.loadtxt(
        Output_Inversion_Log, 
        dtype='str',
        delimiter=',', 
        skiprows=1,
        encoding='utf-8'
    )    
    #--------------------------------------------
    # 獨立載入標頭
    # 讀取整個檔案的第一行
    with open(Output_Inversion_Log, 'r', encoding='utf-8') as f:
        header_line = f.readline().strip()
    Inversion_Log_DataHeader = header_line.split(',')
    #--------------------------------------------
except FileNotFoundError:
    print(f"錯誤：找不到檔案 {Input_v299Scsv_FileName}")
    exit(1) # 回傳1表示一般性錯誤
except Exception as e:
    print(f"程式運行時發生錯誤: {e}")
    exit(1) # 回傳1表示一般性錯誤
#--
# 強制確保 Inversion_Log_Matrix 是 numpy 陣列
Inversion_Log_Matrix = np.array(Inversion_Log_Matrix)
# 如果只有一列數據導致維度變成 (N,)，將其轉回 (1, N) 或 (M, N)
if Inversion_Log_Matrix.ndim == 1:
    Inversion_Log_Matrix = Inversion_Log_Matrix.reshape(1, -1)    
print('載入 Output_Inversion_Log 檔案...完成!')
#--
PNG_DPI = 100
PNG_Width = 1280
PNG_Height = 720    
Output_PNG_FileName = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_04_Convergence_Curve.png')
#--
# 建立畫布
fig, ax = plt.subplots(figsize=((PNG_Width / PNG_DPI, PNG_Height / PNG_DPI)))
# 轉換成數值矩陣以便繪圖
Main_FileName_list = Inversion_Log_Matrix[:, Inversion_Log_DataHeader.index('Main_FileName')]
Remove_Runs_list = Inversion_Log_Matrix[:, Inversion_Log_DataHeader.index('Remove_Runs')].astype(int)
Iteration_list = Inversion_Log_Matrix[:, Inversion_Log_DataHeader.index('Iteration')].astype(int)
RRMS_list = Inversion_Log_Matrix[:, Inversion_Log_DataHeader.index('RRMS[%]')].astype(float)
Chi2_list = Inversion_Log_Matrix[:, Inversion_Log_DataHeader.index('Chi2')].astype(float)
# 取出獨立的 Remove_Runs 清單，並產生顏色清單
Unique_Remove_Runs_list = np.unique(Remove_Runs_list)
Unique_Remove_Runs_colors = [plt.cm.viridis(i) for i in np.linspace(0, 1, len(Unique_Remove_Runs_list))]
# 繪製折線圖
for Remove_Runs_ID, Remove_Runs_Color in zip(Unique_Remove_Runs_list, Unique_Remove_Runs_colors):
    mask = (Remove_Runs_list == Remove_Runs_ID)
    mask2 = (Iteration_list[mask] ==0)
    # 原本可能會是[0,1,0,1]
    #ax.plot(Iteration_list[mask], RRMS_list[mask], color=Remove_Runs_Color, alpha=0.5, linewidth=1.2, label=f'Remove Runs #{Remove_Runs_ID}, MaxIter={np.max(Iteration_list[mask])}')
    # 就要修改為[0,1,2,3]來繪圖
    Iteration_list[mask] = np.arange(len(Iteration_list[mask]))
    ax.plot(Iteration_list[mask], RRMS_list[mask], color=Remove_Runs_Color, alpha=0.5, linewidth=1.2, label=f'Remove Runs #{Remove_Runs_ID}, MaxIter={np.max(Iteration_list[mask])}')
    ax.scatter(Iteration_list[mask][mask2], RRMS_list[mask][mask2], facecolor='none', marker='o',s=100, edgecolors='black', zorder=5)
# 繪製散點圖
if np.max(Chi2_list) > np.min(Chi2_list):
    scatter_circle = ax.scatter(Iteration_list[Chi2_list>=1.0], RRMS_list[Chi2_list>=1.0], 
                               c=(Chi2_list[Chi2_list>=1.0]), 
                               cmap='RdYlGn_r', vmin=1.0,
                               marker='o', edgecolors='black', s=50, zorder=3, alpha=0.6,
                               label=r'$\chi^2 \geq 1$ (Underfit)')
    scatter_square = ax.scatter(Iteration_list[Chi2_list<1.0], RRMS_list[Chi2_list<1.0], 
                               c=(Chi2_list[Chi2_list<1.0]), 
                               cmap='RdYlGn', vmax=1.0,
                               marker='s', edgecolors='black', s=50, zorder=4, alpha=0.6,
                               label=r'$\chi^2 < 1$ (Overfit)')
else:
    scatter_circle = ax.scatter(Iteration_list[Chi2_list>=1.0], RRMS_list[Chi2_list>=1.0], 
                               c=(Chi2_list[Chi2_list>=1.0]), 
                               cmap='RdYlGn_r',
                               marker='o', edgecolors='black', s=50, zorder=3, alpha=0.6,
                               label=r'$\chi^2 \geq 1$ (Underfit)')
    scatter_square = ax.scatter(Iteration_list[Chi2_list<1.0], RRMS_list[Chi2_list<1.0], 
                               c=(Chi2_list[Chi2_list<1.0]), 
                               cmap='RdYlGn',
                               marker='s', edgecolors='black', s=50, zorder=4, alpha=0.6,
                               label=r'$\chi^2 < 1$ (Overfit)')
# 設定繪圖參數
ax.set_title('Iteration vs RRMS Log Plot', pad=20)
ax.set_title(f"{os.path.basename(Main_FileName_list[0])} Convergence Curve "+f"\nData EstError={Data_Settings_Relative_Error_Percentage}%, "+rf"$\lambda$={Inversion_lam_list}", fontsize=14)
ax.set_xlabel('Iteration')
ax.set_ylabel('RRMS [%]')
ax.set_yscale('log')
#ax.yaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter(useMathText=False))
#ax.yaxis.get_major_formatter().set_scientific(False)
ax.yaxis.set_major_formatter(plt.matplotlib.ticker.ScalarFormatter())
ax.yaxis.set_minor_formatter(plt.matplotlib.ticker.ScalarFormatter())
ax.yaxis.get_major_formatter().set_scientific(False)
ax.yaxis.get_minor_formatter().set_scientific(False)
#ax.yaxis.set_major_formatter(plt.matplotlib.ticker.FuncFormatter(lambda y, _: f'{y:g}'))
#ax.yaxis.get_minor_formatter(plt.matplotlib.ticker.FuncFormatter(lambda y, _: f'{y:g}'))
ax.grid(True, which='both', linestyle=':', alpha=0.4)
ax.legend(loc='upper right')
#--
# 填入版本資訊
fig.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
#--
# 設置對齊的colorbar
plt.tight_layout()
cbar1 = fig.colorbar(scatter_circle, ax=ax, shrink=0.49, pad=0.01, anchor=(0, 1.0), panchor=False)
cbar1.ax.set_title(r'  $\chi^2$', fontsize=9, pad=10)
cbar1_pos = cbar1.ax.get_position(original=False).bounds
# 追加新的軸來放另一隻colorbar
cax = fig.add_axes(ax.get_position().bounds)
cbar2 = fig.colorbar(scatter_square, ax=cax, shrink=0.49, pad=0.01, anchor=(0, 0.0), panchor=False)
cbar2_pos = cbar2.ax.get_position(original=False).bounds
# 再次設定正確的位置
cax.set_position(ax.get_position().bounds)
# 對齊第一個colorbar
new_cbar2_pos = [cbar1_pos[0], cbar2_pos[1], cbar2_pos[2], cbar2_pos[3]]
cbar2.ax.set_position(new_cbar2_pos)
# 隱藏沒用的新的軸
cax.set_axis_off()
#--
#print(f'儲存 圖片...')
if os.path.dirname(Output_PNG_FileName): # 防止空路徑報錯
    os.makedirs(os.path.dirname(Output_PNG_FileName), exist_ok=True)
plt.savefig(Output_PNG_FileName, dpi=temp_PNG_DPI)
plt.close()
#print(f'儲存 圖片...完成!')
#--------------------------------------------

#--------------------------------------------
print('--')
#--------------------------------------------
# 取得運行結束時間
program_end_time = datetime.now()
# 計算時間差 (timedelta)
time_difference = program_end_time - program_start_time
total_seconds = time_difference.total_seconds()
hours = int(total_seconds // 3600)
minutes = int((total_seconds % 3600) // 60)
seconds = int(total_seconds % 60)
milliseconds = int((total_seconds % 1) * 1000)
print(f"程式結束運行...時間: {program_end_time.strftime('%Y-%m-%d %H:%M:%S')}")
print(f"最終花費時間: {hours:02d}時 {minutes:02d}分 {seconds:02d}.{milliseconds:03d}秒")
print('--')
# 輸出花費時間檔案 
Output_Inversion_Log = os.path.join(temp_json_data['OutputMainFolderPath'],f'{Main_FileName}_03_Inversion_Log.csv')+'.time'
#print('儲存time檔案...')
with open(Output_Inversion_Log, 'a', encoding='utf-8') as f:
    #--
    line = f"最終花費時間: {hours:02d}時 {minutes:02d}分 {seconds:02d}.{milliseconds:03d}秒"  
    f.write(line+"\n")
    #--
#print('儲存time檔案...完成!')
#--
#--------------------------------------------
```
