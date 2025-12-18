# StgToUrf(ERTMaker_StgToUrf_v20251218a.py)
+ 作者: HsiupoYeh
+ 更新日期: 2025-12-18

### 版本
+ ERTMaker_StgToUrf_v20251218a.py
  + 僅支援2Dstg檔案
  + 修正座標: 四捨五入到小數第二位

### 開發環境
+ Windows 10
+ 使用Lite_PyGimli_Env (pygimli==1.5.4)
  + https://github.com/cgrgncu/pyGimli_dev/releases/tag/Lite_PyGimli_Env
+ 測試位置:
```
\Lite_PyGimli_Env\PythonEnv\
\Lite_PyGimli_Env\Input_ERTMaker_StgToUrf\StgToUrf.json
\Lite_PyGimli_Env\ERTMaker_StgToUrf_v20251218a.py
\Lite_PyGimli_Env\RUN_ERTMaker_StgToUrf_v20251218a.bat
```
+ 也可以放一些必要的輸入範例檔案(並非每個都有用到):
```

```
+ 呼叫方式: 運行「RUN_ERTMaker_StgToUrf_v20251218a.bat」檔案，檔案內容:
```batch
.\PythonEnv\Python.exe ERTMaker_StgToUrf_v20251218a.py
PAUSE
```
### 主程式(ERTMaker_StgToUrf_v20251218a.py)
+ 設定檔(StgToUrf.json):
```json
{
"StgToUrf_Version":"v20251218a",
"StgToUrf_Author":"HsiupoYeh",
"InputFile01_Stg_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile01_Stg_FileName":"Input_ERTMaker_StgToUrf/TEST.stg",
"OutputFile01_Urf_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile01_Urf_FileName":"Output_ERTMaker_StgToUrf/TEST.urf",
"OutputFile02_Ohm_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile02_Ohm_FileName":"Output_ERTMaker_StgToUrf/TEST.ohm"
}
```

+ 程式碼:
```python
#**************************************************************************
#   Name: ERTMaker_StgToUrf_v20251218a.py
#   Copyright: 
#   Author: HsiupoYeh
#   Version: v20251218a
#   Description: 讀取 JSON 設定檔，將Stg檔案轉換為Urf檔案。
#                必須讀取指定位置「Input_ERTMaker_StgToUrf/StgToUrf.json」的JOSN檔案。
#                設定檔(StgToUrf.json)中有說明各參數意義。
#**************************************************************************
import json
import os
import numpy as np
from datetime import datetime
#--------------------------------------------
# 取得運行開始時間
program_start_time = datetime.now()
#--------------------------------------------
#--------------------------------------------
# 版本資訊
VERSION_STR = 'v20251218a'
# 提示畫面
print('************************************************************')
print(f'* ERTMaker_StgToUrf_v{VERSION_STR}')
print('* Author: HsiupoYeh')
print(f'* Version: {VERSION_STR}')
print('************************************************************')
#--
print(f"程式開始運行...時間: {program_start_time.strftime('%Y-%m-%d %H:%M:%S')}")
print('--')
#--------------------------------------------
# 指定檔案名稱
json_file_name = 'Input_ERTMaker_StgToUrf/StgToUrf.json'
#--------------------------------------------
# 讀取檔案
# 開啟並讀取 JSON 檔案
print("讀取 .json 檔...")
with open(json_file_name, 'r', encoding='utf-8') as json_file:
    temp_json_data = json.load(json_file)
print("讀取 .json 檔...完成!")
#--------------------------------------------
#--------------------------------------------
print('載入CSV檔案...')
Input_Stg_FileName = temp_json_data["InputFile01_Stg_FileName"]
try:
    #--------------------------------------------
    # 獨立載入標頭
    # 讀取整個檔案的第一行
    with open(Input_Stg_FileName, 'r', encoding='utf-8') as f:
        header_line_01 = f.readline().strip()
        header_line_02 = f.readline().strip()
        header_line_03 = f.readline().strip()
    #--------------------------------------------
    #--------------------------------------------
    # 檢查檔頭01
    if header_line_01 == 'Advanced Geosciences Inc. (AGI) Sting/SuperSting measured data (*.stg)   Type: XYZ':
        print('檔頭01正確，可進行後續轉檔!')
    else:
        print('檔頭01異常，請檢查原始資料! exit!')
        exit(1) # 回傳1表示一般性錯誤
    # 檢查檔頭02
    if header_line_02.startswith('A trimmed data set by AGI EarthImager 2D. Version: 2.4.1 (Build 624).') :
        print('檔頭02正確，可進行後續轉檔!')
    else:
        print('檔頭02異常，請檢查原始資料! exit!')
        exit(1) # 回傳1表示一般性錯誤
    # 檢查檔頭03
    if header_line_03.startswith('Unit: meter') :
        print('檔頭03正確，可進行後續轉檔!')
    else:
        print('檔頭03異常，請檢查原始資料! exit!')
        exit(1) # 回傳1表示一般性錯誤
    #--------------------------------------------
    #--------------------------------------------
    # 使用 np.loadtxt 載入 CSV 檔案 並強制所有內容為字串 (不含標頭)
    # dtype='str' 或 dtype=object：強制 NumPy 將每個單元格視為字串。
    # delimiter=','：指定逗號分隔。
    # skiprows=3：跳過標頭行。
    Stg_Data_Matrix = np.loadtxt(
        Input_Stg_FileName, 
        dtype='str',
        delimiter=',', 
        skiprows=3
    )    
    #--------------------------------------------
except FileNotFoundError:
    print(f"錯誤：找不到檔案 {Input_v299Scsv_FileName}")
    exit(1) # 回傳1表示一般性錯誤
except Exception as e:
    print(f"程式運行時發生錯誤: {e}")
    exit(1) # 回傳1表示一般性錯誤
#--
print('載入CSV檔案...完成!')
#--------------------------------------------
#--------------------------------------------
# 取出資料
#--
# 第 5 欄 (Index 4): 電壓電流比 V/I (單位: Ohm)
VoverI_Ohm = Stg_Data_Matrix[:, 4].astype(float)
# 第 6 欄 (Index 5): 測量誤差 Error (單位: %)
Measurement_Error_Percent = Stg_Data_Matrix[:, 5].astype(float)
# 第 7 欄 (Index 6): 輸出電流 (單位: mA)
Current_mA = Stg_Data_Matrix[:, 6].astype(float)
Current_A = Current_mA/1000
# 第 8 欄 (Index 7): 視電阻率 Apparent Resistivity (單位: Ohm-m)
App_Resistivity = Stg_Data_Matrix[:, 7].astype(float)
# --- 電極座標欄位 (重要) ---
# 因為stg常常被微幅偏移，這裡使用指定四捨五入到某位數來修正此偏移
# 設定您想要的精確度 (例如 1 代表保留到小數點後 1 位)
precision_decimals = 2
# A 電極 (電流正極)
A_x = np.round(Stg_Data_Matrix[:, 9].astype(float), decimals=precision_decimals)
A_y = np.round(Stg_Data_Matrix[:, 10].astype(float), decimals=precision_decimals)
A_z = np.round(Stg_Data_Matrix[:, 11].astype(float), decimals=precision_decimals)
# B 電極 (電流負極)
B_x = np.round(Stg_Data_Matrix[:, 12].astype(float), decimals=precision_decimals)
B_y = np.round(Stg_Data_Matrix[:, 13].astype(float), decimals=precision_decimals)
B_z = np.round(Stg_Data_Matrix[:, 14].astype(float), decimals=precision_decimals)
# M 電極 (電壓正極)
M_x = np.round(Stg_Data_Matrix[:, 15].astype(float), decimals=precision_decimals)
M_y = np.round(Stg_Data_Matrix[:, 16].astype(float), decimals=precision_decimals)
M_z = np.round(Stg_Data_Matrix[:, 17].astype(float), decimals=precision_decimals)
# N 電極 (電壓負極)
N_x = np.round(Stg_Data_Matrix[:, 18].astype(float), decimals=precision_decimals)
N_y = np.round(Stg_Data_Matrix[:, 19].astype(float), decimals=precision_decimals)
N_z = np.round(Stg_Data_Matrix[:, 20].astype(float), decimals=precision_decimals)
#--------------------------------------------
#--------------------------------------------
# 整理資料
#取得不重複的電極座標表，以及原始點對應到表的索引
all_points_raw = np.vstack([
    np.column_stack((A_x, A_z)),   # A_xz
    np.column_stack((B_x, B_z)),  # B_xz
    np.column_stack((M_x, M_z)),  # M_xz
    np.column_stack((N_x, N_z))   # N_xz
])
# 取得不重複的電極座標表，以及原始點對應到表的索引
unique_sensors, inverse_indices = np.unique(all_points_raw, axis=0, return_inverse=True)
# 分配 A, B, M, N 編號 (從 1 開始)
n_data = len(A_x)
A_ids = inverse_indices[0 : n_data] + 1
B_ids = inverse_indices[n_data : 2*n_data] + 1
M_ids = inverse_indices[2*n_data : 3*n_data] + 1
N_ids = inverse_indices[3*n_data : 4*n_data] + 1
#--------------------------------------------
#--------------------------------------------
# 輸出URF檔案
# 準備 Tx 和 Rx 清單 (通常是所有電極編號)
sensor_ids = [str(i) for i in range(1, len(unique_sensors) + 1)]
sensor_list_str = ",".join(sensor_ids)
# 輸出Urf檔案
print('輸出Urf檔案...')
Output_Urf_FileName = temp_json_data["OutputFile01_Urf_FileName"]
os.makedirs(os.path.dirname(Output_Urf_FileName), exist_ok=True)
with open(Output_Urf_FileName, 'w', encoding='utf-8') as f:
    # --- 檔頭區段 ---
    f.write("Tx\n")
    f.write(f"{sensor_list_str}\n")
    f.write("Rx\n")
    f.write(f"{sensor_list_str}\n")
    # RxP2 通常指無限遠電極，若無則留空或根據需求定義，這裡不填寫
    # f.write(f"RxP2\n{len(unique_sensors)}\n") 
    f.write("\n")
    # --- Geometry 區段 (座標) ---
    f.write(":Geometry\n")
    # URF 格式通常是: 編號, X, Y, Z
    for i, (x, z) in enumerate(unique_sensors):
        node_id = i + 1
        # 假設 2D，Y 座標設為 0
        f.write(f"{node_id},{x:.2f},0,{z:.2f}\n")    
    f.write("\n")
    # --- Measurements 區段 (觀測資料) ---
    f.write(":Measurements\n")
    # URF 觀測資料通常包含: A, B, M, N, V/I, I
    # 注意: 這裡 A, B, M, N 必須是整數編號
    for i in range(n_data):
        f.write(f"{int(A_ids[i])},{int(B_ids[i])},{int(M_ids[i])},{int(N_ids[i])},{VoverI_Ohm[i]:.5f},{Current_A[i]:.3f}\n")
#--
print('輸出Urf檔案...結束!')
#--------------------------------------------
#--------------------------------------------
# 輸出Ohm檔案
print('輸出Ohm檔案...')
Output_Ohm_FileName = temp_json_data["OutputFile02_Ohm_FileName"]
os.makedirs(os.path.dirname(Output_Ohm_FileName), exist_ok=True)
with open(Output_Ohm_FileName, 'w', encoding='utf-8') as f:
    #--
    # 前方固定內容
    f.write('#============================================================\n')
    f.write('# Data Format: unified data format(*.ohm)\n')
    f.write('# REF: http://resistivity.net/bert/data_format.html\n')
    f.write('# Description: \n')   
    f.write('#     pyGIMLI 2D ERT OHM Data\n')   
    f.write('# 注意事項:\n')   
    f.write('#   HsiupoYeh 2024-04-29整理，適用pyGIMLI v.1.5.4\n')   
    f.write('#   電極資料從編號1開始到電極數量。例如:電極數量為38，編號為1~38。\n')   
    f.write('#   編號0表示位置無限遠，留給特殊陣列使用。\n')   
    f.write('#   所有資料可以用空白或tab分隔。\n')   
    f.write('#   註解用「#」\n')   
    f.write('#============================================================\n')   
    f.write('\n')   
    f.write('#------------------------------------------------------------\n')
    f.write('# 在2D的情況下，電極定義為「#x z」。\n')   
    f.write('# x 單位公尺，側向位置向右為正。\n')
    f.write('# z 單位公尺，高程向上為正。\n')   
    f.write('# 注意: 讀檔程式不聰明，電極數量寫在本區塊某一行，其下一行必須是「#x z」。\n')
    f.write('#       這個「#x z」不是註解，讀檔要解析...\n')   
    f.write('#--\n')
    f.write('# 電極數量:\n')  
    f.write(f"{len(unique_sensors)}\n")
    f.write('#x z\n')   
    #--
    # 寫入座標清單
    for i in range(len(unique_sensors)):
        x_val = unique_sensors[i, 0]
        z_val = unique_sensors[i, 1]
        f.write(f"{x_val:.2f} {z_val:.2f}\n") # 保留兩位小數
    #--
    # 後方固定內容
    f.write('#------------------------------------------------------------\n')
    f.write('\n')
    f.write('#------------------------------------------------------------\n')
    f.write('# 注意: 讀檔程式不聰明，觀測資料數量寫在本區塊某一行，其下一行必須是「#A B M N R I」。\n')
    f.write('#       這個「#A B M N R I」不是註解，讀檔要解析...\n')
    f.write('#       A,B,M,N均為電極編號，以上方區塊電極位置的順序當作編號，第一個電極為編號1。\n')
    f.write('#       R為AB電流與MN電壓比值(V_MN/I_AB)，單位「Ohm」。\n')
    f.write('#       I為AB電流，單位「A」。\n')    
    f.write('# 觀測資料數量:\n')
    f.write(f"{n_data}\n")
    f.write("#A B M N R I\n")
    #--
    # 寫入資料
    for i in range(n_data):
        line = f"{int(A_ids[i])} {int(B_ids[i])} {int(M_ids[i])} {int(N_ids[i])} {VoverI_Ohm[i]:.5f} {Current_A[i]:.3f}\n"
        f.write(line)
    f.write("#------------------------------------------------------------\n")
    #--
#--
print('輸出Ohm檔案...結束!')
#--------------------------------------------
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
print(f"花費時間: {hours:02d}時 {minutes:02d}分 {seconds:02d}.{milliseconds:03d}秒")
print('--')
#--------------------------------------------
```
