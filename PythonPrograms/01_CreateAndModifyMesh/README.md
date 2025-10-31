# ERTMaker_CreateAndModifyMesh_v20251031a.py
+ 作者: HsiupoYeh
+ 更新日期: 2025-10-31

### 開發環境
+ Windows 10
+ 使用Lite_PyGimli_Env (pygimli==1.5.4)
  + https://github.com/cgrgncu/pyGimli_dev/releases/tag/Lite_PyGimli_Env
+ 測試位置:
```
\Lite_PyGimli_Env\PythonEnv\
\Lite_PyGimli_Env\Input_ERTMaker_CreateAndModifyMesh\CreateAndModifyMeshSettings.json
\Lite_PyGimli_Env\ERTMaker_CreateAndModifyMesh_v20251031a.py
\Lite_PyGimli_Env\RUN_ERTMaker_CreateAndModifyMesh_v20251031a.bat
```
+ 呼叫方式: 運行「RUN_ERTMaker_CreateAndModifyMesh_v20251031a.bat」檔案，檔案內容:
```batch
.\PythonEnv\Python.exe ERTMaker_CreateAndModifyMesh_v20251031a.py
PAUSE
```

### 主程式(ERTMaker_CreateMesh_v20251030a.py)
+ 設定檔(CreateMeshSettings.json):
{
"CreateAndModifyMeshSettings_Version":"v20251030a",
"CreateAndModifyMeshSettings_Author":"HsiupoYeh",
"TempFile01_BasicMeshPNG_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"TempFile01_BasicMeshPNG_FileName":"Temp/CreateMesh_01_BasicMesh.png",
"TempFile02_BasicMeshVTK_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"TempFile02_BasicMeshVTK_FileName":"Temp/CreateMesh_01_BasicMesh.vtk",
"TempFile03_BasicMeshPNG_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"TempFile03_BasicMeshPNG_FileName":"Temp/CreateMesh_02_BasicMeshSetMarker1.png",
"TempFile04_BasicMeshVTK_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"TempFile04_BasicMeshVTK_FileName":"Temp/CreateMesh_02_BasicMeshSetMarker1.vtk",
"TempFile05_BasicMeshPNG_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"TempFile05_BasicMeshPNG_FileName":"Temp/CreateMesh_03_BasicMeshSetMarker2.png",
"TempFile06_BasicMeshVTK_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"TempFile06_BasicMeshVTK_FileName":"Temp/CreateMesh_03_BasicMeshSetMarker2.vtk",
"TempFile07_BasicMeshPNG_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"TempFile07_BasicMeshPNG_FileName":"Temp/CreateMesh_04_BasicMeshSetBCMarker1.png",
"TempFile08_BasicMeshVTK_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"TempFile08_BasicMeshVTK_FileName":"Temp/CreateMesh_04_BasicMeshSetBCMarker1.vtk",
"TempFile09_BasicMeshPNG_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"TempFile09_BasicMeshPNG_FileName":"Temp/CreateMesh_05_BasicMeshSetBCMarker2.png",
"TempFile10_BasicMeshVTK_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"TempFile10_BasicMeshVTK_FileName":"Temp/CreateMesh_05_BasicMeshSetBCMarker2.vtk",
"TempFile11_BasicMeshPNG_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"TempFile11_BasicMeshPNG_FileName":"Temp/CreateMesh_06_BasicMeshSetTopo.png",
"TempFile12_BasicMeshPNG_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"TempFile12_BasicMeshPNG_FileName":"Temp/CreateMesh_07_BasicMeshSetTopoRes.png",
"TempFile13_BasicMeshVTK_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"TempFile13_BasicMeshVTK_FileName":"Temp/CreateMesh_07_BasicMeshSetTopoRes.vtk",
"OutputFile01_MeshBCMarkersJSON_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile01_MeshBCMarkersJSON_FileName":"Output/Output_FullMeshBCMarkers.json",
"OutputFile02_MeshBCMarkersVTK_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile02_MeshBCMarkersVTK_FileName":"Output/Output_FullMesh.vtk",
"OutputFile03_GEO_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile03_GEO_FileName":"Output/Output_FullMesh.geo",
"StudyAreaMesh_GridStyle_Readme":"研究區域的網格類型。目前只支援「Rectangle」，就是指以矩形為基礎的網格類型。",
"StudyAreaMesh_GridStyle":"Rectangle",
"StudyAreaMesh_RectangleGrid_LayerCount_Readme":"研究區域的網格層數。就是指Z方向的地層數量。此值必須是正整數。",
"StudyAreaMesh_RectangleGrid_LayerCount":30,
"StudyAreaMesh_RectangleGrid_LayerThicknessFacfor_Readme":"研究區域的地層厚度控制因子。此值必須是正數。1表示厚度不變化，0.9表示厚度變小為原本的90%，1.1表示厚度變大為原本的110%。",
"StudyAreaMesh_RectangleGrid_LayerThicknessFacfor":1,
"StudyAreaMesh_RectangleGrid_FirstLayerThickness_Readme":"研究區域的第一層厚度。單位:[m]。此值必須是正數。",
"StudyAreaMesh_RectangleGrid_FirstLayerThickness":1,
"StudyAreaMesh_GridSurfaceNode_Readme":"逐個點在X方向上應為遞增的數字，不可填入null；在Z方向上填入對應高程，允許部分缺值(填入null)，將進行內插；Electrode_Index從1開始依序增加。若設為0或負值表示該位置不設置電極",
"StudyAreaMesh_GridSurfaceNode_Readme2":"X[m],Z[m],Electrode_Index",
"StudyAreaMesh_GridSurfaceNode":[
[-10,0,0],
[-9,0,0],
[-8,0,0],
[-7,0,0],
[-6,0,1],
[-5,1,0],
[-4,0,2],
[-3,3,0],
[-2,2,3],
[-1,null,0],
[0,0,4],
[1,0,0],
[2,0,5],
[3,0,0],
[4,0,6],
[5,0,0],
[6,0,7],
[7,0,8],
[8,0,9],
[9,0,10],
[10,0,11],
[11,0,0]
],
"PaddingMesh_GridStyle_Readme":"附加區域的網格類型。目前只支援「Rectangle」，就是指以矩形為基礎的網格類型。",
"PaddingMesh_GridStyle":"Rectangle",
"PaddingMesh_RectangleGrid_LeftPaddingLayerCount_Readme":"附加區域左側要追加的網格層數。就是指-X方向追加的地層數量。此值必須是0或是正整數。",
"PaddingMesh_RectangleGrid_LeftPaddingLayerCount":5,
"PaddingMesh_RectangleGrid_LeftPaddingLayerWidthFacfor_Readme":"附加區域左側的地層寬度控制因子。此值必須是正數。1表示寬度不變化，0.9表示寬度變小為原本的90%，1.1表示寬度變大為原本的110%。",
"PaddingMesh_RectangleGrid_LeftPaddingLayerWidthFacfor":1.2,
"PaddingMesh_RectangleGrid_FirstLeftPaddingLayerWidth_Readme":"附加區域左側的第一層寬度。單位:[m]。此值小於等於0的時候，表示自動使用最靠近的一層搭配厚度因子計算出第一層寬度，否則直接使用指定數值為第一層寬度。",
"PaddingMesh_RectangleGrid_FirstLeftPaddingLayerWidth":-1,
"PaddingMesh_RectangleGrid_RightPaddingLayerCount_Readme":"附加區域右側要追加的網格層數。就是指+X方向追加的地層數量。此值必須是0或是正整數。",
"PaddingMesh_RectangleGrid_RightPaddingLayerCount":5,
"PaddingMesh_RectangleGrid_RightPaddingLayerWidthFacfor_Readme":"附加區域右側的地層寬度控制因子。此值必須是正數。1表示寬度不變化，0.9表示寬度變小為原本的90%，1.1表示寬度變大為原本的110%。",
"PaddingMesh_RectangleGrid_RightPaddingLayerWidthFacfor":1.2,
"PaddingMesh_RectangleGrid_FirstRightPaddingLayerWidth_Readme":"附加區域右側的第一層寬度。單位:[m]。此值小於等於0的時候，表示自動使用最靠近的一層搭配厚度因子計算出第一層寬度，否則直接使用指定數值為第一層寬度。",
"PaddingMesh_RectangleGrid_FirstRightPaddingLayerWidth":-1,
"PaddingMesh_RectangleGrid_BottomPaddingLayerCount_Readme":"附加區域下方的網格層數。是指Z方向的地層數量。此值必須是0或正整數。",
"PaddingMesh_RectangleGrid_BottomPaddingLayerCount":5,
"PaddingMesh_RectangleGrid_BottomPaddingLayerThicknessFacfor_Readme":"附加區域右側的地層寬度控制因子。此值必須是正數。1表示寬度不變化，0.9表示寬度變小為原本的90%，1.1表示寬度變大為原本的110%。",
"PaddingMesh_RectangleGrid_BottomPaddingLayerThicknessFacfor":1.2,
"PaddingMesh_RectangleGrid_FirstBottomPaddingLayerThickness_Readme":"附加區域的第一層厚度。單位:[m]。此值小於等於0的時候，表示自動使用最靠近的一層搭配厚度因子計算出第一層厚度，否則直接使用指定數值為第一層厚度。",
"PaddingMesh_RectangleGrid_FirstBottomPaddingLayerThickness":-1,
"ModifyMeshResistivity_Readme":"依序填入多則修改範圍，將依照規則順序修改模型。",
"ModifyMeshResistivity_Readme2":"x_min[m],x_max[m],z_min[m],z_max[m],New_Resistivity[ohm-m]",
"ModifyMeshResistivity":[
[-9999, 9999, -9999, 9999, 100],
[-9999, 9999, -10, -5, 10]
]
}
```
+ 程式碼:
```python
#**************************************************************************
#   Name: ERTMaker_CreateAndModifyMesh.py
#   Copyright: 
#   Author: HsiupoYeh
#   Version: v20251030a
#   Description: 讀取 JSON 設定檔，建立包含邊界填充區域的二維地形網格，
#                並設定單元 (Cell) 和邊界 (Boundary) Marker，輸出為
#                PNG, VTK 和 JSON 檔案。
#                必須讀取指定位置「Input_ERTMaker_CreateAndModifyMesh/CreateAndModifyMeshSettings.json」的JOSN檔案。
#                設定檔(CreateAndModifyMeshSettings.json)中有說明各參數意義。
#**************************************************************************
import json
import os
import numpy as np
from scipy.interpolate import interp1d
import pygimli as pg
import matplotlib.pyplot as plt
#--------------------------------------------
print('--')
print('ERTMaker_CreateAndModifyMesh運作開始!')
#--------------------------------------------
# 指定檔案名稱
json_file_name = 'Input_ERTMaker_CreateAndModifyMesh/CreateAndModifyMeshSettings.json'
#--------------------------------------------
# 讀取檔案
# 開啟並讀取 JSON 檔案
print("讀取 .json 檔...")
with open(json_file_name, 'r', encoding='utf-8') as json_file:
    temp_json_data = json.load(json_file)
print("讀取 .json 檔...完成!")
#--------------------------------------------
# 若指定輸出檔案資料夾不存在，則創建資料夾，若檔案存在，則刪除。
#--
# TempFile01_BasicMeshPNG_FileName
temp_filename=temp_json_data["TempFile01_BasicMeshPNG_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--
# TempFile02_BasicMeshVTK_FileName
temp_filename=temp_json_data["TempFile02_BasicMeshVTK_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--
# TempFile03_BasicMeshPNG_FileName
temp_filename=temp_json_data["TempFile03_BasicMeshPNG_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--
# TempFile04_BasicMeshVTK_FileName
temp_filename=temp_json_data["TempFile04_BasicMeshVTK_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--
# TempFile05_BasicMeshPNG_FileName
temp_filename=temp_json_data["TempFile05_BasicMeshPNG_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--
# TempFile06_BasicMeshVTK_FileName
temp_filename=temp_json_data["TempFile06_BasicMeshVTK_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--
# TempFile07_BasicMeshPNG_FileName
temp_filename=temp_json_data["TempFile07_BasicMeshPNG_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--
# TempFile08_BasicMeshVTK_FileName
temp_filename=temp_json_data["TempFile08_BasicMeshVTK_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--
# TempFile09_BasicMeshPNG_FileName
temp_filename=temp_json_data["TempFile09_BasicMeshPNG_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--
# TempFile10_BasicMeshVTK_FileName
temp_filename=temp_json_data["TempFile10_BasicMeshVTK_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--
# TempFile11_BasicMeshPNG_FileName
temp_filename=temp_json_data["TempFile11_BasicMeshPNG_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--
# TempFile12_BasicMeshVTK_FileName
temp_filename=temp_json_data["TempFile12_BasicMeshPNG_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--
# TempFile13_BasicMeshVTK_FileName
temp_filename=temp_json_data["TempFile13_BasicMeshVTK_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--
# OutputFile01_MeshBCMarkersJSON_FileName
temp_filename=temp_json_data["OutputFile01_MeshBCMarkersJSON_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--
# OutputFile02_MeshBCMarkersVTK_FileName
temp_filename=temp_json_data["OutputFile02_MeshBCMarkersVTK_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--
# OutputFile03_GEO_FileName
temp_filename=temp_json_data["OutputFile03_GEO_FileName"]
os.makedirs(os.path.dirname(temp_filename), exist_ok=True)
if os.path.exists(temp_filename): # 檢查檔案是否存在
    os.remove(temp_filename)     # 如果存在，就刪除
#--------------------------------------------

#--------------------------------------------
# 建立網格部分
# 允許高程Z值有部分缺失，可填null，由軟體進行內插interp1d(kind='linear', fill_value="extrapolate")
#--
# 整理資料並內插Z值
#--
# 取得 StudyAreaMesh_GridSurfaceNode 的資料並轉換為 NumPy 陣列 (使用 object dtype 以容納 nan)
NumPy_StudyAreaMesh_GridSurfaceNode_array = np.array(temp_json_data["StudyAreaMesh_GridSurfaceNode"], dtype=object)
# 分離 X 和原始 Z 座標
NumPy_StudyAreaMesh_x_coords_original = NumPy_StudyAreaMesh_GridSurfaceNode_array[:, 0].astype(float)
NumPy_StudyAreaMesh_z_coords_original = NumPy_StudyAreaMesh_GridSurfaceNode_array[:, 1].astype(float)
NumPy_StudyAreaMesh_ElectrodeIndex_original = NumPy_StudyAreaMesh_GridSurfaceNode_array[:, 2].astype(float)
# 找到非 NaN 值的索引
NumPy_StudyAreaMesh_non_nan_z_indices = np.where(~np.isnan(NumPy_StudyAreaMesh_z_coords_original))[0]
# 如果有效的 Z 值不足，視為錯誤並終止程式
if len(NumPy_StudyAreaMesh_non_nan_z_indices) <= 1:
    print("錯誤：有效的 Z 值不足，無法進行內插。")
    exit(1) # 回傳1表示一般性錯誤
else:
    # 創建線性內插函數，用於填補 Z 座標中的 NaN 值
    temp_interpolate_function = interp1d(NumPy_StudyAreaMesh_x_coords_original[NumPy_StudyAreaMesh_non_nan_z_indices], NumPy_StudyAreaMesh_z_coords_original[NumPy_StudyAreaMesh_non_nan_z_indices], kind='linear', fill_value="extrapolate")
    # 找到 NaN 值的索引
    NumPy_StudyAreaMesh_nan_z_indices = np.where(np.isnan(NumPy_StudyAreaMesh_z_coords_original))[0]
    # 使用內插函數填補 NaN 值到 z_coords_interp
    NumPy_StudyAreaMesh_z_coords_interp = NumPy_StudyAreaMesh_z_coords_original.copy()
    NumPy_StudyAreaMesh_z_coords_interp[NumPy_StudyAreaMesh_nan_z_indices] = temp_interpolate_function(NumPy_StudyAreaMesh_x_coords_original[NumPy_StudyAreaMesh_nan_z_indices])
    # 創建包含 X, 原始 Z 和內插 Z 的新陣列
#--------------------------------------------
#--------------------------------------------
# 從參數建立四邊形網格
print("從參數建立四邊形網格...")
#--
# 取得 PaddingMesh_RectangleGrid_LeftPaddingLayerCount 的資料並轉換為 int 變數
int_PaddingMesh_RectangleGrid_LeftPaddingLayerCount = int(temp_json_data["PaddingMesh_RectangleGrid_LeftPaddingLayerCount"])
# 取得 PaddingMesh_RectangleGrid_LeftPaddingLayerWidthFacfor 的資料並轉換為 float 變數
float_PaddingMesh_RectangleGrid_LeftPaddingLayerWidthFacfor = float(temp_json_data["PaddingMesh_RectangleGrid_LeftPaddingLayerWidthFacfor"])
# 取得 PaddingMesh_RectangleGrid_FirstLeftPaddingLayerWidth 的資料並轉換為 float 變數
float_PaddingMesh_RectangleGrid_FirstLeftPaddingLayerWidth = float(temp_json_data["PaddingMesh_RectangleGrid_FirstLeftPaddingLayerWidth"])
# 取得 PaddingMesh_RectangleGrid_RightPaddingLayerCount 的資料並轉換為 int 變數
int_PaddingMesh_RectangleGrid_RightPaddingLayerCount = temp_json_data["PaddingMesh_RectangleGrid_LeftPaddingLayerCount"]
# 取得 PaddingMesh_RectangleGrid_RightPaddingLayerWidthFacfor 的資料並轉換為 float 變數
float_PaddingMesh_RectangleGrid_RightPaddingLayerWidthFacfor = float(temp_json_data["PaddingMesh_RectangleGrid_RightPaddingLayerWidthFacfor"])
# 取得 PaddingMesh_RectangleGrid_FirstRightPaddingLayerWidth 的資料並轉換為 float 變數
float_PaddingMesh_RectangleGrid_FirstRightPaddingLayerWidth = float(temp_json_data["PaddingMesh_RectangleGrid_FirstRightPaddingLayerWidth"])
#--
# 計算 FullMesh 的X方向上之節點向量的總數量 FullMesh_x_node_count
int_FullMesh_x_node_count = NumPy_StudyAreaMesh_x_coords_original.size + int_PaddingMesh_RectangleGrid_LeftPaddingLayerCount + int_PaddingMesh_RectangleGrid_RightPaddingLayerCount
# 建立初始的 FullMesh 的X方向上之節點座標
NumPy_FullMesh_x_coords = np.full(int_FullMesh_x_node_count, np.nan, dtype=float)
#print(NumPy_FullMesh_x_coords)
# 把「內網格」的 座標值填入
NumPy_FullMesh_x_coords[int_PaddingMesh_RectangleGrid_LeftPaddingLayerCount:int_PaddingMesh_RectangleGrid_LeftPaddingLayerCount+NumPy_StudyAreaMesh_x_coords_original.size] = NumPy_StudyAreaMesh_x_coords_original
#print(NumPy_FullMesh_x_coords)
# 處理左側，逐個計算位置並填入
if float_PaddingMesh_RectangleGrid_FirstLeftPaddingLayerWidth>0 :
    temp_Width=float_PaddingMesh_RectangleGrid_FirstLeftPaddingLayerWidth
else:
    temp_Width=np.abs(NumPy_StudyAreaMesh_x_coords_original[1] - NumPy_StudyAreaMesh_x_coords_original[0])*float_PaddingMesh_RectangleGrid_LeftPaddingLayerWidthFacfor
for i in range(int_PaddingMesh_RectangleGrid_LeftPaddingLayerCount):
    temp_target_index=(int_PaddingMesh_RectangleGrid_LeftPaddingLayerCount-i-1)
    NumPy_FullMesh_x_coords[temp_target_index]=NumPy_FullMesh_x_coords[temp_target_index+1]-temp_Width
    temp_Width=temp_Width*float_PaddingMesh_RectangleGrid_LeftPaddingLayerWidthFacfor
#print(NumPy_FullMesh_x_coords)
# 處理右側，逐個計算位置並填入
if float_PaddingMesh_RectangleGrid_FirstRightPaddingLayerWidth>0 :
    temp_Width=float_PaddingMesh_RectangleGrid_FirstRightPaddingLayerWidth
else:
    temp_Width=np.abs(NumPy_StudyAreaMesh_x_coords_original[-2] - NumPy_StudyAreaMesh_x_coords_original[-1])*float_PaddingMesh_RectangleGrid_RightPaddingLayerWidthFacfor
for i in range(int_PaddingMesh_RectangleGrid_RightPaddingLayerCount):
    temp_target_index=(int_FullMesh_x_node_count-int_PaddingMesh_RectangleGrid_RightPaddingLayerCount+i)
    NumPy_FullMesh_x_coords[temp_target_index]=NumPy_FullMesh_x_coords[temp_target_index-1]+temp_Width
    temp_Width=temp_Width*float_PaddingMesh_RectangleGrid_RightPaddingLayerWidthFacfor
#print("FullMesh X向量：")
#print(NumPy_FullMesh_x_coords)
#--
# 取得 StudyAreaMesh_RectangleGrid_LayerCount 的資料並轉換為 int 變數
int_StudyAreaMesh_RectangleGrid_LayerCount = temp_json_data["StudyAreaMesh_RectangleGrid_LayerCount"]
# 取得 StudyAreaMesh_RectangleGrid_LayerThicknessFacfor 的資料並轉換為 float 變數
float_StudyAreaMesh_RectangleGrid_LayerThicknessFacfor = float(temp_json_data["StudyAreaMesh_RectangleGrid_LayerThicknessFacfor"])
# 取得 StudyAreaMesh_RectangleGrid_FirstLayerThickness 的資料並轉換為 float 變數
float_StudyAreaMesh_RectangleGrid_FirstLayerThickness = float(temp_json_data["StudyAreaMesh_RectangleGrid_FirstLayerThickness"])
# 取得 PaddingMesh_RectangleGrid_BottomPaddingLayerCount 的資料並轉換為 int 變數
int_PaddingMesh_RectangleGrid_BottomPaddingLayerCount = temp_json_data["PaddingMesh_RectangleGrid_BottomPaddingLayerCount"]
# 取得 PaddingMesh_RectangleGrid_BottomPaddingLayerThicknessFacfor 的資料並轉換為 float 變數
float_PaddingMesh_RectangleGrid_BottomPaddingLayerThicknessFacfor = float(temp_json_data["PaddingMesh_RectangleGrid_BottomPaddingLayerThicknessFacfor"])
# 取得 PaddingMesh_RectangleGrid_FirstBottomPaddingLayerThickness 的資料並轉換為 float 變數
float_PaddingMesh_RectangleGrid_FirstBottomPaddingLayerThickness = float(temp_json_data["PaddingMesh_RectangleGrid_FirstBottomPaddingLayerThickness"])
#--
# 計算 FullMesh 的Z方向上之節點向量的總數量 FullMesh_z_node_count
int_FullMesh_z_node_count = int_StudyAreaMesh_RectangleGrid_LayerCount + int_PaddingMesh_RectangleGrid_BottomPaddingLayerCount+1
# 建立初始的 FullMesh 的Z方向上之節點座標
NumPy_FullMesh_z_coords = np.full(int_FullMesh_z_node_count, np.nan, dtype=float)
#print(NumPy_FullMesh_z_coords)
# 計算 StudyAreaMesh 的Z方向上之節點向量的總數量 FullMesh_z_node_count
int_StudyAreaMesh_z_node_count = int_StudyAreaMesh_RectangleGrid_LayerCount +1
# 建立初始的 StudyAreaMesh 的Z方向上之節點座標
NumPy_StudyAreaMesh_z_coords = np.full(int_StudyAreaMesh_z_node_count, np.nan, dtype=float)
#print(NumPy_StudyAreaMesh_z_coords)
# 處理下方，逐個計算位置並填入
NumPy_FullMesh_z_coords[0]=0
NumPy_StudyAreaMesh_z_coords[0]=0
#print(NumPy_FullMesh_z_coords)
temp_Thickness=float_StudyAreaMesh_RectangleGrid_FirstLayerThickness
for i in range(int_StudyAreaMesh_RectangleGrid_LayerCount):
    temp_target_index=i+1
    NumPy_FullMesh_z_coords[temp_target_index]=NumPy_FullMesh_z_coords[temp_target_index-1]-temp_Thickness
    NumPy_StudyAreaMesh_z_coords[temp_target_index]=NumPy_StudyAreaMesh_z_coords[temp_target_index-1]-temp_Thickness
    temp_Thickness=temp_Thickness*float_StudyAreaMesh_RectangleGrid_LayerThicknessFacfor
#print(NumPy_FullMesh_z_coords)
if float_PaddingMesh_RectangleGrid_FirstBottomPaddingLayerThickness>0 :
    temp_Thickness=float_PaddingMesh_RectangleGrid_FirstBottomPaddingLayerThickness
else:
    temp_Thickness=(NumPy_FullMesh_z_coords[int_StudyAreaMesh_RectangleGrid_LayerCount-1]-NumPy_FullMesh_z_coords[int_StudyAreaMesh_RectangleGrid_LayerCount])*float_PaddingMesh_RectangleGrid_BottomPaddingLayerThicknessFacfor
for i in range(int_PaddingMesh_RectangleGrid_BottomPaddingLayerCount):
    temp_target_index=(int_StudyAreaMesh_RectangleGrid_LayerCount+i+1)
    NumPy_FullMesh_z_coords[temp_target_index]=NumPy_FullMesh_z_coords[temp_target_index-1]-temp_Thickness
    temp_Thickness=temp_Thickness*float_PaddingMesh_RectangleGrid_BottomPaddingLayerThicknessFacfor
#print("FullMesh Z向量：")
#print(NumPy_FullMesh_z_coords)
#--
# 建立網格
mesh = pg.Mesh(2)
# 使用計算出的節點座標創建網格
mesh.createGrid(NumPy_FullMesh_x_coords, NumPy_FullMesh_z_coords)
#--------------------------------------------
# 展示並儲存(不希望使用互動式視窗，將立即關閉plt) 
# 目前是基礎網格 BasicMesh
temp_output_filename=temp_json_data["TempFile01_BasicMeshPNG_FileName"]
pg.show(mesh,  markers=True, showMesh=True, label="Markers(BasicMesh)")
plt.savefig(temp_output_filename)
plt.close()
#--------------------------------------------
# 輸出VTK
# 目前是基礎網格 BasicMesh 有填入預設的邊界的Marker。
# 輸出VTK前先把預設該存在的資料填1
mesh['Resistivity'] = np.ones(mesh.cellCount())
mesh['Resistivity_(log10)'] = np.log10(mesh['Resistivity'])
mesh['Coverage'] = np.ones(mesh.cellCount())
mesh['S_Coverage'] = np.ones(mesh.cellCount())
# 輸出
temp_output_filename=temp_json_data["TempFile02_BasicMeshVTK_FileName"]
mesh.exportVTK(temp_output_filename)
#--------------------------------------------
# 預設使用 mesh.createGrid 就會填入預設的邊界的Marker。
# BERT在逆推時會自行處理邊界，主要是依賴網格的Marker。PaddingMesh設定為1，StudyAreaMesh設定為2
# 將判定所有在地表的邊界的Marker都是-1。
# 將判定所有在PaddingMesh的左側、下側、右側之邊界的Marker都是-2。
# 將判定所有在StudyAreaMesh的左側、下側、右側之邊界的Marker都是1。
#--------------------------------------------
# 以下也照BERT的設定進行標記:
#
# 設置網格的Marker 全部為1
mesh.setCellMarkers([1] * mesh.cellCount())
#--------------------------------------------
# 展示並儲存(不希望使用互動式視窗，將立即關閉plt) 
# 目前是基礎網格 BasicMeshSetMarker1
temp_output_filename=temp_json_data["TempFile03_BasicMeshPNG_FileName"]
pg.show(mesh,  markers=True, showMesh=True, label="Markers(BasicMeshSetMarker1 All=1)")
plt.savefig(temp_output_filename)
plt.close()
#--------------------------------------------
# 輸出VTK
# 目前是基礎網格 BasicMeshSetMarker1 。
# 輸出VTK前先把預設該存在的資料填1
mesh['Resistivity'] = np.ones(mesh.cellCount())
mesh['Resistivity_(log10)'] = np.log10(mesh['Resistivity'])
mesh['Coverage'] = np.ones(mesh.cellCount())
mesh['S_Coverage'] = np.ones(mesh.cellCount())
# 輸出
temp_output_filename=temp_json_data["TempFile04_BasicMeshVTK_FileName"]
mesh.exportVTK(temp_output_filename)
#--------------------------------------------
# 取得所有網格中心位置
cell_centers = mesh.cellCenters()
# 找出 StudyArea 範圍內的網格
StudyAreaMesh_Cell_index = (
    (cell_centers[:, 0] >= NumPy_StudyAreaMesh_x_coords_original.min()) &
    (cell_centers[:, 0] <= NumPy_StudyAreaMesh_x_coords_original.max()) &
    (cell_centers[:, 1] <= 0) &
    (cell_centers[:, 1] >= NumPy_StudyAreaMesh_z_coords.min())
)
# 設定網格的Marker
markers = np.ones(mesh.cellCount(), dtype=int)
markers[StudyAreaMesh_Cell_index]=2 # 參考普通逆推情形，建立兩個標記網格時，PaddingMesh設定為1，StudyAreaMesh設定為2
mesh.setCellMarkers(markers.tolist())
#--------------------------------------------
# 展示並儲存(不希望使用互動式視窗，將立即關閉plt) 
# 目前是基礎網格 BasicMeshSetMarker2
temp_output_filename=temp_json_data["TempFile05_BasicMeshPNG_FileName"]
pg.show(mesh,  markers=True, showMesh=True, label="Markers(BasicMeshSetMarker2 Padding=1 StudyArea=2)")
plt.savefig(temp_output_filename)
plt.close()
#--------------------------------------------
# 輸出VTK
# 目前是基礎網格 BasicMeshSetMarker1 。
# 輸出VTK前先把預設該存在的資料填1
mesh['Resistivity'] = np.ones(mesh.cellCount())
mesh['Resistivity_(log10)'] = np.log10(mesh['Resistivity'])
mesh['Coverage'] = np.ones(mesh.cellCount())
mesh['S_Coverage'] = np.ones(mesh.cellCount())
# 輸出
temp_output_filename=temp_json_data["TempFile06_BasicMeshVTK_FileName"]
mesh.exportVTK(temp_output_filename)
#--------------------------------------------
# 設定 StudyAreaMesh 的 邊界的Marker
for b in mesh.boundaries():
    #--
    # 找到這條邊界左右兩邊的 cell（外側會回傳 None）
    left_cell  = b.leftCell()
    right_cell = b.rightCell()
    # 拿到它們的 網格的Marker（如果是 None，就回傳一個不可能等於 2 的值）
    m_left  = left_cell.marker()  if left_cell  is not None else 1234
    m_right = right_cell.marker() if right_cell is not None else 1234
    # 如果一側是 1，另一側是 2，就把它標成 2 (參考普通逆推情形，建立兩個標記網格時，PaddingMesh設定為1，StudyAreaMesh設定為2)
    if (m_left == 2 and m_right == 1) :
        if (b.node(0).pos()[0]==b.node(1).pos()[0]) :
            # 這裡是PaddingMesh的右側
            b.setMarker(1) 
        else :
            # 這裡是PaddingMesh的下側
            b.setMarker(1)
    elif (m_left == 1 and m_right == 2) :
        if (b.node(0).pos()[0]==b.node(1).pos()[0]) :
            # 這裡是PaddingMesh的左側
            b.setMarker(1)
#--------------------------------------------
# 展示並儲存(不希望使用互動式視窗，將立即關閉plt) 
# 目前是基礎網格 BasicMeshSetBCMarker1
temp_output_filename=temp_json_data["TempFile07_BasicMeshPNG_FileName"]
pg.show(mesh,  markers=True, showMesh=True, label="Markers(BasicMeshSetBCMarker1 StudyArea=1)")
plt.savefig(temp_output_filename)
plt.close()
#--------------------------------------------
# 輸出VTK
# 目前是基礎網格 BasicMeshSetMarker1 。
# 輸出VTK前先把預設該存在的資料填1
mesh['Resistivity'] = np.ones(mesh.cellCount())
mesh['Resistivity_(log10)'] = np.log10(mesh['Resistivity'])
mesh['Coverage'] = np.ones(mesh.cellCount())
mesh['S_Coverage'] = np.ones(mesh.cellCount())
# 輸出
temp_output_filename=temp_json_data["TempFile08_BasicMeshVTK_FileName"]
mesh.exportVTK(temp_output_filename)
#--------------------------------------------
# 設定 FullMesh 的 邊界的Marker
for b in mesh.boundaries():
    if b.outside():
        if (b.node(0).pos()[1] == 0 and b.node(1).pos()[1] == 0) :
            # 這裡是 FullMesh 的地表
            b.setMarker(-1)
        else :
            # 這裡是 FullMesh 的地表以外
            b.setMarker(-2)
#--------------------------------------------
# 展示並儲存(不希望使用互動式視窗，將立即關閉plt) 
# 目前是基礎網格 BasicMeshSetBCMarker2
temp_output_filename=temp_json_data["TempFile09_BasicMeshPNG_FileName"]
pg.show(mesh,  markers=True, showMesh=True, label="Markers(BasicMeshSetBCMarker2 FullMeshSurface=-1 FullMeshOutside=-2)")
plt.savefig(temp_output_filename)
plt.close()
#--------------------------------------------
# 輸出VTK
# 目前是基礎網格 BasicMeshSetMarker1 。
# 輸出VTK前先把預設該存在的資料填1
mesh['Resistivity'] = np.ones(mesh.cellCount())
mesh['Resistivity_(log10)'] = np.log10(mesh['Resistivity'])
mesh['Coverage'] = np.ones(mesh.cellCount())
mesh['S_Coverage'] = np.ones(mesh.cellCount())
# 輸出
temp_output_filename=temp_json_data["TempFile10_BasicMeshVTK_FileName"]
mesh.exportVTK(temp_output_filename)
#--------------------------------------------
# 遍歷網格的所有節點並根據 X 值平移 Y 值
for i in range(mesh.nodeCount()):
    node = mesh.node(i)
    current_x = node.pos()[0]
    # 找到最接近的 x_value 的索引
    closest_index = np.argmin(np.abs(NumPy_StudyAreaMesh_x_coords_original - current_x))
    # 使用該索引的 NumPy_StudyAreaMesh_z_coords_interp 來平移 Y 座標
    translation_y = NumPy_StudyAreaMesh_z_coords_interp[closest_index]
    new_y = node.pos()[1] + translation_y
    node.setPos([current_x, new_y])
#--------------------------------------------
# 從 JSON 數據中提取修改規則
modify_rules = temp_json_data.get("ModifyMeshResistivity", [])
#---
# 準備要修改的模型
temp_resistivity_model=mesh['Resistivity']
# 依序應用 JSON 中的修改規則到網格電阻率模型上
if not modify_rules:
    print("警告：JSON 檔案中沒有找到 'ModifyMeshResistivity' 規則。")
else:
    for i, rule in enumerate(modify_rules):
        #--
        # 依照規則修改
        if len(rule) == 5:
            x_min, x_max, y_min, y_max, new_resistivity = rule
            print(f"應用規則 {i+1}: X從 {x_min} 到 {x_max}, Z從 {y_min} 到 {y_max}, 設定電阻率為 {new_resistivity} Ohm-m")
            for cell_id, cell in enumerate(mesh.cells()):
                cx = cell.center().x()                
                cy = cell.center().y()
                # 如果單元中心點在當前規則的範圍內，就直接更新其電阻率
                if (cx >= x_min and cx <= x_max and
                    cy >= y_min and cy <= y_max):                        
                    temp_resistivity_model[cell_id] = float(new_resistivity)
        else:
            print(f"錯誤：規則 {i+1} 格式不正確。預期 5 個值，但得到 {len(rule)} 個。跳過此規則。")
#--
# 更新模型
mesh['Resistivity']=temp_resistivity_model
mesh['Resistivity_(log10)'] = np.log10(mesh['Resistivity'])
#--------------------------------------------
# 展示並儲存(不希望使用互動式視窗，將立即關閉plt) 
# 目前是基礎網格 BasicMeshSetTopo
temp_output_filename=temp_json_data["TempFile11_BasicMeshPNG_FileName"]
ax, _ = pg.show(mesh,  markers=True, showMesh=True, label="Markers(BasicMeshSetTopo)")
ax.plot(NumPy_StudyAreaMesh_x_coords_original[(NumPy_StudyAreaMesh_ElectrodeIndex_original > 0)], NumPy_StudyAreaMesh_z_coords_interp[(NumPy_StudyAreaMesh_ElectrodeIndex_original > 0)], 'o', markersize=6, color='magenta', markerfacecolor='magenta', markeredgecolor='black', label='Electrode Nodes (Marker=1)')
plt.savefig(temp_output_filename)
plt.close()
#--------------------------------------------
# 展示並儲存(不希望使用互動式視窗，將立即關閉plt) 
# 目前是基礎網格 BasicMeshSetTopoRes
temp_output_filename=temp_json_data["TempFile12_BasicMeshPNG_FileName"]
ax, _ = pg.show(mesh, data=mesh['Resistivity_(log10)'],  markers=False, showMesh=True, label="Resistivity(log10)(BasicMeshSetTopoRes)")
ax.plot(NumPy_StudyAreaMesh_x_coords_original[(NumPy_StudyAreaMesh_ElectrodeIndex_original > 0)], NumPy_StudyAreaMesh_z_coords_interp[(NumPy_StudyAreaMesh_ElectrodeIndex_original > 0)], 'o', markersize=6, color='magenta', markerfacecolor='magenta', markeredgecolor='black', label='Electrode Nodes (Marker=1)')
plt.savefig(temp_output_filename)
plt.close()
#--------------------------------------------
# 輸出VTK
# 目前是基礎網格 BasicMeshSetTopo 。
# 輸出VTK前先把預設該存在的資料填1
mesh['Coverage'] = np.ones(mesh.cellCount())
mesh['S_Coverage'] = np.ones(mesh.cellCount())
# 輸出
temp_output_filename=temp_json_data["TempFile13_BasicMeshVTK_FileName"]
mesh.exportVTK(temp_output_filename)
#-------------------------------------------- 
# 整理 MeshBCMarkers
#--    
# 印出 index, x1, y1, x2, y2, marker
#print("index, x1, y1, x2, y2, marker")
#for i, b in enumerate(mesh.boundaries()):
#    print(f"{i}, {b.nodes()[0].pos()[0]:.6f}, {b.nodes()[0].pos()[1]:.6f}, {b.nodes()[1].pos()[0]:.6f}, {b.nodes()[1].pos()[1]:.6f}, {b.marker()}")
#--
temp_output_filename=temp_json_data["OutputFile01_MeshBCMarkersJSON_FileName"]
# 儲存MeshMarkers為JSON檔案
print('儲存MeshBCMarkers為JSON檔案...')
# 開啟檔案，以 UTF-8 編碼手動寫入 JSON 內容
with open(temp_output_filename, 'w', encoding='utf-8') as f:
    #--
    # 寫入說明行
    f.write('{\n')
    f.write('"MeshBCMarkers_Readme":"index,x1[m],y1[m],x2[m],y2[m],marker",\n')
    f.write('"MeshBCMarkers":[\n')
    #--
    for i, b in enumerate(mesh.boundaries()):
        #--
        # 組成一列文字
        line = f'[{i}, {b.nodes()[0].pos()[0]:.6f}, {b.nodes()[0].pos()[1]:.6f}, {b.nodes()[1].pos()[0]:.6f}, {b.nodes()[1].pos()[1]:.6f}, {b.marker()}]'
        # 最後一列不加逗號，其它加逗號
        if i < mesh.boundaryCount() - 1:
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
print('儲存MeshBCMarkers為JSON檔案...完成!')
#--------------------------------------------
# 先把預設該存在的資料填1
mesh['Coverage'] = np.ones(mesh.cellCount())
mesh['S_Coverage'] = np.ones(mesh.cellCount())
#-- 
# 輸出VTK
print('儲存FullMesh為vtk檔案...')
temp_output_filename=temp_json_data["OutputFile02_MeshBCMarkersVTK_FileName"]
mesh.exportVTK(temp_output_filename)
print('儲存FullMesh為vtk檔案...完成!')
#--------------------------------------------
# 輸出GEO檔案
temp_output_filename=temp_json_data["OutputFile03_GEO_FileName"]
print('儲存GEO檔案...')
with open(temp_output_filename, 'w', encoding='utf-8') as f:
    #--
    # 前方固定內容
    f.write('Tx\n')
    f.write('1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64\n')
    f.write('Rx\n')
    f.write('1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64\n')
    f.write('RxP2\n')
    f.write('65\n')
    f.write('\n')
    f.write(':Geometry\n')    
    #--
    # 替換為電極
    for i, b in enumerate(NumPy_StudyAreaMesh_x_coords_original[(NumPy_StudyAreaMesh_ElectrodeIndex_original > 0)]):
        #--
        line=f"{i+1},{b},0,0\n"
        # 寫入
        f.write(line)
        #--
    #--
    # 後方固定內容
    f.write('\n')
    f.write(':Measurements\n')
    #--
print('儲存GEO檔案...完成!')
#--------------------------------------------
print('CreateAndModifyMesh運作結束!')
print('--')
#--------------------------------------------
```

