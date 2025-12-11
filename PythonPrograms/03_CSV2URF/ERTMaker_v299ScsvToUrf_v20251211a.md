# v299ScsvToUrf(ERTMaker_v299ScsvToUrf_v20251211a.py)
+ 作者: HsiupoYeh
+ 更新日期: 2025-12-11

### 版本
+ ERTMaker_v299ScsvToUrf_v20251211a.py
  + 僅支援單源放電
  + 利用第三秒資料去趨勢
  + 計算SNR

### 開發環境
+ Windows 10
+ 使用Lite_PyGimli_Env (pygimli==1.5.4)
  + https://github.com/cgrgncu/pyGimli_dev/releases/tag/Lite_PyGimli_Env
+ 測試位置:
```
\Lite_PyGimli_Env\PythonEnv\
\Lite_PyGimli_Env\Input_ERTMaker_v299ScsvToUrf\v299ScsvToUrf.json
\Lite_PyGimli_Env\ERTMaker_v299ScsvToUrf_v20251211a.py
\Lite_PyGimli_Env\RUN_ERTMaker_v299ScsvToUrf_v20251211a.bat
```
+ 也可以放一些必要的輸入範例檔案(並非每個都有用到):
```

```
+ 呼叫方式: 運行「RUN_ERTMaker_v299ScsvToUrf_v20251211a.bat」檔案，檔案內容:
```batch
.\PythonEnv\Python.exe ERTMaker_v299ScsvToUrf_v20251211a.py
PAUSE
```
### 主程式(ERTMaker_v299ScsvToUrf_v20251211a.py)
+ 設定檔(v299ScsvToUrf.json):
```json
{
"v299ScsvToUrf_Version":"v20251211a",
"v299ScsvToUrf_Author":"HsiupoYeh",
"InputFile01_Geo_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile01_Geo_FileName":"Input_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel.geo",
"InputFile02_Ohm_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile02_Ohm_FileName":"Input_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel.ohm",
"InputFile03_v299Scsv_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile03_v299Scsv_FileName":"Input_ERTMaker_v299ScsvToUrf/E1-4_E1-5_SyntheticModel_CurrentFlowLinesAB.v299S.csv",
"InputFile04_Keep_ABMN_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile04_Keep_ABMN_FileName":"Input_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel.abmn",
"OutputFile01_Urf_All_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile01_Urf_All_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.urf",
"OutputFile02_Urf_All_SNR_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile02_Urf_All_SNR_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.SNR.urf",
"OutputFile03_Ohm_All_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile03_Ohm_All_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.ohm",
"OutputFile04_PNG_All_MainFileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile04_PNG_All_MainFileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S",
"OutputFile04_PNG_All_Enable_Readme":"是否啟用輸出PNG。若要啟用請填入字串Yes，若不啟用請填入字串No。輸出PNG每張圖約耗時?",
"OutputFile04_PNG_All_Enable":"No",
"OutputFile05_Urf_WS_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile05_Urf_WS_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.WS.urf",
"OutputFile06_Urf_WS_SNR_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile06_Urf_WS_SNR_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.WS.SNR.urf",
"OutputFile07_Ohm_WS_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile07_Ohm_WS_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.WS.ohm",
"OutputFile08_PNG_WS_MainFileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile08_PNG_WS_MainFileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.WS",
"OutputFile08_PNG_WS_Enable_Readme":"是否啟用輸出PNG。若要啟用請填入字串Yes，若不啟用請填入字串No。輸出PNG每張圖約耗時?",
"OutputFile08_PNG_WS_Enable":"No",
"OutputFile09_Urf_MGD_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile09_Urf_MGD_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.MGD.urf",
"OutputFile10_Urf_MGD_SNR_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile10_Urf_MGD_SNR_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.MGD.SNR.urf",
"OutputFile11_Ohm_MGD_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile11_Ohm_MGD_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.MGD.ohm",
"OutputFile12_PNG_MGD_MainFileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile12_PNG_MGD_MainFileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.MGD",
"OutputFile12_PNG_MGD_Enable_Readme":"是否啟用輸出PNG。若要啟用請填入字串Yes，若不啟用請填入字串No。輸出PNG每張圖約耗時?",
"OutputFile12_PNG_MGD_Enable":"No",
"OutputFile13_Urf_MPR_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile13_Urf_MPR_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.MPR.urf",
"OutputFile14_Urf_MPR_SNR_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile14_Urf_MPR_SNR_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.MPR.SNR.urf",
"OutputFile15_Ohm_MPR_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile15_Ohm_MPR_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.MPR.ohm",
"OutputFile16_PNG_MPR_MainFileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile16_PNG_MPR_MainFileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.MPR",
"OutputFile16_PNG_MPR_Enable_Readme":"是否啟用輸出PNG。若要啟用請填入字串Yes，若不啟用請填入字串No。輸出PNG每張圖約耗時?",
"OutputFile16_PNG_MPR_Enable":"No",
"OutputFile17_Urf_GD_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile17_Urf_GD_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.GD.urf",
"OutputFile18_Urf_GD_SNR_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile18_Urf_GD_SNR_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.GD.SNR.urf",
"OutputFile19_Ohm_GD_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile19_Ohm_GD_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.GD.ohm",
"OutputFile20_PNG_GD_MainFileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile20_PNG_GD_MainFileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.GD",
"OutputFile20_PNG_GD_Enable_Readme":"是否啟用輸出PNG。若要啟用請填入字串Yes，若不啟用請填入字串No。輸出PNG每張圖約耗時?",
"OutputFile20_PNG_GD_Enable":"No",
"Select_From_Readme":"請填入字串「All」、「WS」、「MGD」、「MPR」或「GD」。",
"Select_From":"All",
"Select_Keep_A_index_Readme":"請填入陣列。例如：「[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64]」",
"Select_Keep_A_index":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22],
"Select_Keep_B_index_Readme":"請填入陣列。例如：「[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64]」",
"Select_Keep_B_index":[23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43],
"Select_Keep_M_index_Readme":"請填入陣列。例如：「[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64]」",
"Select_Keep_M_index":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43],
"Select_Keep_N_index_Readme":"請填入陣列。例如：「[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64]」",
"Select_Keep_N_index":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43],
"Select_Keep_ABMN_Enable_Readme":"是否啟用ABMN檔案清單篩選。若要啟用請填入字串Yes，若不啟用請填入字串No。",
"Select_Keep_ABMN_Enable":"Yes",
"OutputFile21_Urf_Select_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile21_Urf_Select_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.Select.urf",
"OutputFile22_Urf_Select_SNR_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile22_Urf_Select_SNR_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.Select.SNR.urf",
"OutputFile23_Ohm_Select_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile23_Ohm_Select_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.Select.ohm",
"OutputFile24_PNG_Select_MainFileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile24_PNG_Select_MainFileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.Select",
"OutputFile24_PNG_Select_Enable_Readme":"是否啟用輸出PNG。若要啟用請填入字串Yes，若不啟用請填入字串No。輸出PNG每張圖約耗時?",
"OutputFile24_PNG_Select_Enable":"Yes"
}
```
+ 另外要準備的ABMN檔案格式(.abmn)
  + 副檔名: *.abmn
  + 內容為逗號分隔的數字，無檔頭。至少前四欄對應為A、B、M、N。
  + 例如:
    ```
    1,23,2,3
    1,23,2,4
    1,23,2,5
    1,23,2,6
    1,23,2,7
    1,23,2,8
    1,23,2,9
    1,23,2,10
    ```
    或
    ```
    1,23,2,3,1.30413,0.400,0
    1,23,2,4,1.71482,0.400,0
    1,23,2,5,1.90068,0.400,0
    1,23,2,6,1.99855,0.400,0
    1,23,2,7,2.05486,0.400,0
    1,23,2,8,2.08934,0.400,0
    1,23,2,9,2.11152,0.400,0
    1,23,2,10,2.12638,0.400,0
    ```
+ 程式碼:
```python
#**************************************************************************
#   Name: ERTMaker_v299ScsvToUrf_v20251211a.py
#   Copyright: 
#   Author: HsiupoYeh
#   Version: v20251211a
#   Description: 讀取 JSON 設定檔，將單源放電檔案(.v299S.csv)解算為Urf檔案。
#                必須讀取指定位置「Input_ERTMaker_v299ScsvToUrf/v299ScsvToUrf.json」的JOSN檔案。
#                設定檔(v299ScsvToUrf.json)中有說明各參數意義。
#**************************************************************************
import json
import os
import numpy as np
import re
from datetime import datetime
from scipy import signal
from scipy.interpolate import interp1d
import pygimli as pg
from pygimli.physics import ert
import math
import matplotlib.pyplot as plt

#--------------------------------------------
# 取得運行開始時間
program_start_time = datetime.now()
#--------------------------------------------
#--------------------------------------------
# 版本資訊
VERSION_STR = 'v20251211a'
ALGORITHM_VERSION_STR = 'HsiupoYeh2025'
# 提示畫面
print('************************************************************')
print(f'* ERTMaker_v299ScsvToUrf_v{VERSION_STR}')
print('* Author: HsiupoYeh')
print(f'* Version: {VERSION_STR}')
print(f'* Algorithm_Version: {ALGORITHM_VERSION_STR}')
print('************************************************************')
# 軟體說明
ERTMaker_Info = f'ERTMaker v1.0(Author: HsiupoYeh) Powered by PyGIMLi v{pg.__version__}'
print(ERTMaker_Info)
#--
print(f"程式開始運行...時間: {program_start_time.strftime('%Y-%m-%d %H:%M:%S')}")
print('--')
#--------------------------------------------
# 指定檔案名稱
json_file_name = 'Input_ERTMaker_v299ScsvToUrf/v299ScsvToUrf.json'
#--------------------------------------------
# 讀取檔案
# 開啟並讀取 JSON 檔案
print("讀取 .json 檔...")
with open(json_file_name, 'r', encoding='utf-8') as json_file:
    temp_json_data = json.load(json_file)
print("讀取 .json 檔...完成!")
#--------------------------------------------
#--------------------------------------------
print('載入Geo檔案...')
Input_Geo_FileName = temp_json_data["InputFile01_Geo_FileName"]
temp_geo_char_data = "" # 初始化變數
try:
    # 使用 'r' 模式讀取檔案，'t' 表示文字模式 (預設)，'utf-8' 為常見編碼
    # 使用 'with open(...)' 確保檔案在讀取完成後會自動關閉
    with open(Input_Geo_FileName, 'r', encoding='utf-8') as f1:
        # 讀取整個檔案的內容並儲存為單一字串
        temp_geo_char_data = f1.read()    
    print('讀取Geo檔案...完成!')    
except FileNotFoundError:
    print(f'開啟檔案失敗! return! 檔案名稱: {Input_Geo_FileName}.')
    exit(1) # 回傳1表示一般性錯誤    
except Exception as e:
    print(f'讀取檔案時發生其他錯誤: {e}')
    exit(1) # 回傳1表示一般性錯誤    
#--------------------------------------------
#--------------------------------------------
print('載入Ohm檔案...')
Input_Ohm_FileName = temp_json_data["InputFile02_Ohm_FileName"]
temp_ohm_char_data = "" # 初始化變數
try:
    # 使用 'r' 模式讀取檔案，'t' 表示文字模式 (預設)，'utf-8' 為常見編碼
    # 使用 'with open(...)' 確保檔案在讀取完成後會自動關閉
    with open(Input_Ohm_FileName, 'r', encoding='utf-8') as f1:
        # 讀取整個檔案的內容並儲存為單一字串
        temp_ohm_char_data = f1.read()    
    print('讀取Ohm檔案...完成!')    
except FileNotFoundError:
    print(f'開啟檔案失敗! return! 檔案名稱: {Input_Ohm_FileName}.')
    exit(1) # 回傳1表示一般性錯誤    
except Exception as e:
    print(f'讀取檔案時發生其他錯誤: {e}')
    exit(1) # 回傳1表示一般性錯誤    
#--------------------------------------------
# 檢查是否為假資料的OHM檔案
target_end_content =  (
    "1\n"
    "#A B M N R\n"
    "1 4 2 3 100\n"
    "#------------------------------------------------------------\n"
)
if temp_ohm_char_data.endswith(target_end_content):
    #print("這是沒有資料的Ohm檔案(*_SyntheticModel.ohm)! ")
    pass
else:
    print("錯誤!這不是沒有資料的Ohm檔案(*_SyntheticModel.ohm)! ")
    exit(1) # 回傳1表示一般性錯誤  
#--
# 刪掉假資料部分
temp_ohm_char_data = temp_ohm_char_data[:-len(target_end_content)]
#--------------------------------------------
#--------------------------------------------
print('載入CSV檔案...')
Input_v299Scsv_FileName = temp_json_data["InputFile03_v299Scsv_FileName"]
try:
    #--------------------------------------------
    # 使用 np.loadtxt 載入 CSV 檔案 並強制所有內容為字串 (不含標頭)
    # dtype='str' 或 dtype=object：強制 NumPy 將每個單元格視為字串。
    # delimiter=','：指定逗號分隔。
    # skiprows=1：跳過標頭行。
    v299Scsv_Data_Matrix = np.loadtxt(
        Input_v299Scsv_FileName, 
        dtype='str',
        delimiter=',', 
        skiprows=1
    )    
    #--------------------------------------------
    # 獨立載入標頭
    # 讀取整個檔案的第一行
    with open(Input_v299Scsv_FileName, 'r', encoding='utf-8') as f:
        header_line = f.readline().strip()
    v299Scsv_DataHeader = header_line.split(',')
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
print('載入ABMN檔案...')
Input_Keep_ABMN_FileName = temp_json_data["InputFile04_Keep_ABMN_FileName"]
try:
    #--------------------------------------------
    # 使用 np.loadtxt 載入 CSV 檔案 並強制所有內容為字串 (不含標頭)
    # dtype='str' 或 dtype=object：強制 NumPy 將每個單元格視為字串。
    # delimiter=','：指定逗號分隔。
    # skiprows=0：跳過標頭行。
    Keep_ABMN_Matrix = np.loadtxt(
        Input_Keep_ABMN_FileName, 
        dtype='str',
        delimiter=',', 
        skiprows=0
    )    
    #--------------------------------------------
except FileNotFoundError:
    print(f"錯誤：找不到檔案 {Input_Keep_ABMN_FileName}")
    exit(1) # 回傳1表示一般性錯誤
except Exception as e:
    print(f"程式運行時發生錯誤: {e}")
    exit(1) # 回傳1表示一般性錯誤
#--
print('載入ABMN檔案...完成!')
#--------------------------------------------
print(f'標頭數量: {len(v299Scsv_DataHeader)}')
if v299Scsv_Data_Matrix.ndim == 1:
    # 處理只有一行的特殊情況 (NumPy 讀取單行會是 1D 陣列)
    print('資料數量異常，請檢查原始資料! exit!')
    exit(1) # 回傳1表示一般性錯誤
else:
    v299Scsv_Data_Matrix_row_count, v299Scsv_Data_Matrix_column_count = v299Scsv_Data_Matrix.shape
    print(f'資料矩陣列數: {v299Scsv_Data_Matrix_row_count}')
    print(f'資料矩陣欄位數: {v299Scsv_Data_Matrix_column_count}')
#-------------------------------------------- 
print('--') 
#--------------------------------------------
# 檢查檔頭版本
if v299Scsv_DataHeader[0] == 'Time[ms](R2MS_Lite_v299csv_v20240510a)':    
    print('CSV檔案版本正確，可進行後續解算!')
else:
    print('CSV檔案版本正確異常，請檢查原始資料! exit!')
    exit(1) # 回傳1表示一般性錯誤
#-------------------------------------------- 
# 檢查欄位數
if (v299Scsv_Data_Matrix_column_count == 133) and (v299Scsv_Data_Matrix_row_count % 30 == 0):    
    print('資料數量正確，可進行後續解算!')
else:
    print('資料數量異常，請檢查原始資料! exit!')
    exit(1) # 回傳1表示一般性錯誤
#--------------------------------------------
print('--') 
#--------------------------------------------
# 計算放電事件次數
ERT_Tx_event_count=v299Scsv_Data_Matrix_row_count//30; # 確定是整數，所以用整數除法
print(f'本次單源智能施測共計: {ERT_Tx_event_count} 次工作事件')
#--------------------------------------------
print('--')
#--------------------------------------------
# 迴圈依序處理各次工作事件 
urf_measurement_data = [] # 用列表儲存所有事件的結果
for i_all_event_ERT_data_index in range(ERT_Tx_event_count):
    event_num = i_all_event_ERT_data_index + 1
    print(f'第 {event_num} 次工作事件處理...開始')
    #--------------------------------------------
    # 步驟 1：提取一次事件的數據
    start_row = i_all_event_ERT_data_index * 30
    end_row = start_row + 30
    temp_one_event_ERT_data_matrix = v299Scsv_Data_Matrix[start_row:end_row, :]
    #--------------------------------------------
    # 步驟 2：分析電極位置 (Tx/Rx Electrode Analysis)    
    # 原始數據的第 5 欄 (索引 4) 包含電極狀態字串，例如 '+0-v0v...'
    electrode_status_string = temp_one_event_ERT_data_matrix[0, 4].replace(' ', '')
    #print(electrode_status_string)    
    # 找出 '+'、'-'、'0' 所在的索引值 (要找出從1開始的索引值)
    # 這裡返回的是 Python 索引 (從 0 開始)，所以需要 +1 才能對應從1開始的電極編號
    tx_plus_indices = [m.start() + 1 for m in re.finditer(r'\+', electrode_status_string)]
    tx_minus_indices = [m.start() + 1 for m in re.finditer(r'\-', electrode_status_string)]
    tx_zero_indices = [m.start() + 1 for m in re.finditer(r'0', electrode_status_string)]    
    # 找出所有 Tx 使用的電極編號 (已排序)
    Tx_use_Electrode_index = sorted(tx_plus_indices + tx_minus_indices + tx_zero_indices)  
    # 找出 'v' 所在的索引值 (Rx 接收器)
    Rx_use_Electrode_index = sorted([m.start() + 1 for m in re.finditer(r'v', electrode_status_string)])
    # 檢查 Tx 數量
    if len(Tx_use_Electrode_index) == 2:
        #print('Tx數量數量正確!')
        print(f'第 {event_num} 次工作事件分析:')
        print(f'Tx數量 = {len(Tx_use_Electrode_index)} Rx數量 = {len(Rx_use_Electrode_index)}')
    else:
        print('Tx數量數量異常，請檢查原始資料!exit!')
        exit(1) # 回傳1表示一般性錯誤
    #--------------------------------------------
    # 步驟 3：分析所有量測資料為方波震幅 (Amplitude Estimation)    
    # 取出所有紀錄電壓與電流資料 (欄位6到最後，索引從0開始就是5到最後 )   
    # 由於數據是以字串形式儲存，我們需要將其轉換成浮點數矩陣
    try:
        temp_one_event_measure_data = temp_one_event_ERT_data_matrix[:, 5:].astype(float)
        #print(temp_one_event_measure_data)
    except ValueError:
        print("錯誤：量測數據欄位 (6 欄及以後) 包含非數值數據，無法轉換為浮點數！")
        exit(1) # 回傳1表示一般性錯誤        
    # 初始化一個用來存放估計資料的變數
    temp_one_event_estimate_data = np.zeros_like(temp_one_event_measure_data)
    #--------------------------------------------
    # 取出電極狀態的矩陣
    temp_one_event_status_data=temp_one_event_ERT_data_matrix[:, 4]
    #print(temp_one_event_status_data)
    #--------------------------------------------    
    #--------------------------------------------
    # 步驟 3.1：重建電流數據 (Tx Channels)   
    for i_electrode in Tx_use_Electrode_index: # i_electrode 是 1-based 電極編號
        #--------------------------------------------
        #print(f'#{i_electrode}電流極')    
        # 取得該電極在數據矩陣中的**電流**欄位索引 (Python 0-based)
        current_col_index = 2 * (i_electrode-1) + 1
        # 獲取單通道量測數據
        temp_one_channel_measure_data = temp_one_event_measure_data[:, current_col_index]
        #print(temp_one_channel_measure_data)
        #--------------------------------------------
        # 去趨勢(使用第三部分的線性趨勢外推)
        all_x_trend_data = np.arange(0, 30)
        #print(all_x_trend_data)
        part3_x_trend_data = np.arange(20, 30)
        #print(part3_x_trend_data)
        part3_y_trend_data = temp_one_channel_measure_data[20:30] - signal.detrend(temp_one_channel_measure_data[20:30], type='linear')
        #print(part3_y_trend_data)
        # 使用 interp1d 進行線性外推
        # kind='linear' 指定線性插值
        # fill_value='extrapolate' 指定外推 
        f_interp = interp1d(
            part3_x_trend_data, 
            part3_y_trend_data, 
            kind='linear', 
            fill_value='extrapolate'
        )
        # 計算外推到整個 30 點的趨勢線 L(t)
        all_y_trend_data = f_interp(all_x_trend_data)
        #print(all_y_trend_data)
        #
        temp_one_channel_measure_data = temp_one_channel_measure_data - all_y_trend_data
        #print(temp_one_channel_measure_data)
        #--------------------------------------------
        # 整理各種可能的正減負資料
        # 預先建立一個長度為 16 的 NumPy 陣列來儲存結果 
        temp_np_array = np.zeros(16)        
        temp_np_array[0] = temp_one_channel_measure_data[5] - temp_one_channel_measure_data[15] # 第6個-第16個
        temp_np_array[1] = temp_one_channel_measure_data[5] - temp_one_channel_measure_data[16] # 第6個-第17個
        temp_np_array[2] = temp_one_channel_measure_data[5] - temp_one_channel_measure_data[17] # 第6個-第18個
        temp_np_array[3] = temp_one_channel_measure_data[5] - temp_one_channel_measure_data[18] # 第6個-第19個
        temp_np_array[4] = temp_one_channel_measure_data[6] - temp_one_channel_measure_data[15] # 第7個-第16個
        temp_np_array[5] = temp_one_channel_measure_data[6] - temp_one_channel_measure_data[16] # 第7個-第17個
        temp_np_array[6] = temp_one_channel_measure_data[6] - temp_one_channel_measure_data[17] # 第7個-第18個
        temp_np_array[7] = temp_one_channel_measure_data[6] - temp_one_channel_measure_data[18] # 第7個-第19個
        temp_np_array[8] = temp_one_channel_measure_data[7] - temp_one_channel_measure_data[15] # 第8個-第16個
        temp_np_array[9] = temp_one_channel_measure_data[7] - temp_one_channel_measure_data[16] # 第8個-第17個
        temp_np_array[10] = temp_one_channel_measure_data[7] - temp_one_channel_measure_data[17] # 第8個-第18個
        temp_np_array[11] = temp_one_channel_measure_data[7] - temp_one_channel_measure_data[18] # 第8個-第19個
        temp_np_array[12] = temp_one_channel_measure_data[8] - temp_one_channel_measure_data[15] # 第9個-第16個
        temp_np_array[13] = temp_one_channel_measure_data[8] - temp_one_channel_measure_data[16] # 第9個-第17個
        temp_np_array[14] = temp_one_channel_measure_data[8] - temp_one_channel_measure_data[17] # 第9個-第18個
        temp_np_array[15] = temp_one_channel_measure_data[8] - temp_one_channel_measure_data[18] # 第9個-第19個     
        #print(temp_np_array)
        median_amplitude = np.median(temp_np_array)/2
        #print(median_amplitude)
        #--------------------------------------------
        # 重建 Part 1
        part1_median = median_amplitude
        temp_one_event_estimate_data[0:10, current_col_index] = part1_median
        #print(temp_one_event_estimate_data[:, current_col_index])
        # 重建 Part 2
        part2_median = -median_amplitude
        temp_one_event_estimate_data[10:20, current_col_index] = part2_median
        #print(temp_one_event_estimate_data[:, current_col_index])
        # 重建 Part 3
        temp_one_event_estimate_data[20:30, current_col_index] = temp_one_channel_measure_data[20:30]
        #print(temp_one_event_estimate_data[:, current_col_index])
        #--------------------------------------------
    #--------------------------------------------   
    # 步驟 3.2：重建電壓數據 (Rx Channels) - 實作「中位數法」
    for i_electrode in Rx_use_Electrode_index: # i_electrode 是 1-based 電極編號
        #--------------------------------------------
        #print(f'#{i_electrode}電位極')    
        # 取得該電極在數據矩陣中的**電流**欄位索引 (Python 0-based)
        voltage_col_index = 2 * (i_electrode-1)
        # 獲取單通道量測數據
        temp_one_channel_measure_data = temp_one_event_measure_data[:, voltage_col_index]
        #print(temp_one_channel_measure_data)        
        #--------------------------------------------
        # 去趨勢(使用第三部分的線性趨勢外推)
        all_x_trend_data = np.arange(0, 30)
        #print(all_x_trend_data)
        part3_x_trend_data = np.arange(20, 30)
        #print(part3_x_trend_data)
        part3_y_trend_data = temp_one_channel_measure_data[20:30] - signal.detrend(temp_one_channel_measure_data[20:30], type='linear')
        #print(part3_y_trend_data)
        # 使用 interp1d 進行線性外推
        # kind='linear' 指定線性插值
        # fill_value='extrapolate' 指定外推 
        f_interp = interp1d(
            part3_x_trend_data, 
            part3_y_trend_data, 
            kind='linear', 
            fill_value='extrapolate'
        )
        # 計算外推到整個 30 點的趨勢線 L(t)
        all_y_trend_data = f_interp(all_x_trend_data)
        #print(all_y_trend_data)
        #
        temp_one_channel_measure_data = temp_one_channel_measure_data - all_y_trend_data
        #print(temp_one_channel_measure_data)
        #--------------------------------------------
        # 整理各種可能的正減負資料
        # 預先建立一個長度為 16 的 NumPy 陣列來儲存結果 
        temp_np_array = np.zeros(16)        
        temp_np_array[0] = temp_one_channel_measure_data[5] - temp_one_channel_measure_data[15] # 第6個-第16個
        temp_np_array[1] = temp_one_channel_measure_data[5] - temp_one_channel_measure_data[16] # 第6個-第17個
        temp_np_array[2] = temp_one_channel_measure_data[5] - temp_one_channel_measure_data[17] # 第6個-第18個
        temp_np_array[3] = temp_one_channel_measure_data[5] - temp_one_channel_measure_data[18] # 第6個-第19個
        temp_np_array[4] = temp_one_channel_measure_data[6] - temp_one_channel_measure_data[15] # 第7個-第16個
        temp_np_array[5] = temp_one_channel_measure_data[6] - temp_one_channel_measure_data[16] # 第7個-第17個
        temp_np_array[6] = temp_one_channel_measure_data[6] - temp_one_channel_measure_data[17] # 第7個-第18個
        temp_np_array[7] = temp_one_channel_measure_data[6] - temp_one_channel_measure_data[18] # 第7個-第19個
        temp_np_array[8] = temp_one_channel_measure_data[7] - temp_one_channel_measure_data[15] # 第8個-第16個
        temp_np_array[9] = temp_one_channel_measure_data[7] - temp_one_channel_measure_data[16] # 第8個-第17個
        temp_np_array[10] = temp_one_channel_measure_data[7] - temp_one_channel_measure_data[17] # 第8個-第18個
        temp_np_array[11] = temp_one_channel_measure_data[7] - temp_one_channel_measure_data[18] # 第8個-第19個
        temp_np_array[12] = temp_one_channel_measure_data[8] - temp_one_channel_measure_data[15] # 第9個-第16個
        temp_np_array[13] = temp_one_channel_measure_data[8] - temp_one_channel_measure_data[16] # 第9個-第17個
        temp_np_array[14] = temp_one_channel_measure_data[8] - temp_one_channel_measure_data[17] # 第9個-第18個
        temp_np_array[15] = temp_one_channel_measure_data[8] - temp_one_channel_measure_data[18] # 第9個-第19個     
        #print(temp_np_array)
        median_amplitude = np.median(temp_np_array)/2
        #print(median_amplitude)
        #--------------------------------------------
        # 重建 Part 1
        part1_median = median_amplitude
        temp_one_event_estimate_data[0:10, voltage_col_index] = part1_median
        #print(temp_one_event_estimate_data[:, voltage_col_index])
        # 重建 Part 2
        part2_median = -median_amplitude
        temp_one_event_estimate_data[10:20, voltage_col_index] = part2_median
        #print(temp_one_event_estimate_data[:, voltage_col_index])
        # 重建 Part 3
        temp_one_event_estimate_data[20:30, voltage_col_index] = temp_one_channel_measure_data[20:30]
        #print(temp_one_event_estimate_data[:, voltage_col_index])
        #--------------------------------------------
    #--------------------------------------------
    # 步驟 4：依照電極位置，利用 R = dV/I 解析所需的觀測資料 (Measurement Calculation)
    # 整理簡化估計數據 (只取每秒第一個點的值作為方波的振幅)
    # 提取電壓 (V) 數據:
    temp_one_event_simple_estimate_voltage_data = temp_one_event_estimate_data[:, 0::2]     
    # 提取電流 (I) 數據:
    temp_one_event_simple_estimate_current_data = temp_one_event_estimate_data[:, 1::2]
    # 計算電流 I
    Tx_A_index_1based = Tx_use_Electrode_index[0] # A 端電極編號 (1-based)
    Tx_B_index_1based = Tx_use_Electrode_index[1] # B 端電極編號 (1-based)    
    # 在簡化矩陣中，電極 i 的電流索引為 i-1
    Tx_A_simple_index = Tx_A_index_1based - 1 
    Tx_B_simple_index = Tx_B_index_1based - 1    
    # 計算放電震幅
    Tx_I_AB_amplitude = (temp_one_event_simple_estimate_current_data[0, Tx_A_simple_index] - temp_one_event_simple_estimate_current_data[0, Tx_B_simple_index])/2
    #print(Tx_I_AB_amplitude)  
    #print('--')    
    # ----------------------------------------------------------------------
    # 步驟 4.1：計算所有 MN 組合的 V/I 與 ErrorIndex 循環組合 (M 端，N 端)
    for i_Rx_M_Electrode_index in range(len(Rx_use_Electrode_index)):
        # M端
        M_electrode_1based = Rx_use_Electrode_index[i_Rx_M_Electrode_index]
        #print(f'M={M_electrode_1based}')
        #print('--')
        # 只與後面的 N 電極組合
        for i_Rx_N_Electrode_index in range(i_Rx_M_Electrode_index + 1, len(Rx_use_Electrode_index)):
            N_electrode_1based = Rx_use_Electrode_index[i_Rx_N_Electrode_index]
            #print(f'M={M_electrode_1based},N={N_electrode_1based}')
            # 在簡化矩陣中，電極 i 的電壓索引為 i-1
            M_index = M_electrode_1based - 1
            N_index = N_electrode_1based - 1
            # 計算 dV (電壓差)
            temp_V_MN = temp_one_event_simple_estimate_voltage_data[:, M_index] - temp_one_event_simple_estimate_voltage_data[:, N_index]
            temp_V_MN_amplitude = temp_V_MN[0]
            # 計算 VoverI
            if Tx_I_AB_amplitude != 0:
                temp_VoverI = temp_V_MN_amplitude / Tx_I_AB_amplitude
            else:
                temp_VoverI = np.nan # 電流為零，電阻無效
            #--
            # 計算 SNR             
            P_Signal = np.var(temp_V_MN[0:20], ddof=0)
            #print(f'P_Signal = {P_Signal:.5f}[V^2]')
            P_Noise = np.var(temp_V_MN[20:30], ddof=0)
            #print(f'P_Noise = {P_Noise:.5f}[V^2]')
            if P_Noise == 0:
                # 1. 線性 SNR
                SNR_linear = P_Signal / np.finfo(float).eps
                #print(f'SNR(Signal-to-Noise Ratio) = {SNR_linear:.5f}[倍]')
                # 2. 分貝 (dB) SNR
                # 使用 10 * log10(X)
                SNR_dB = 10 * np.log10(SNR_linear)
                #print(f'SNR(Signal-to-Noise Ratio) = {SNR_dB:.5f}[dB]')
            else:
                # 1. 線性 SNR
                SNR_linear = P_Signal / P_Noise
                #print(f'SNR(Signal-to-Noise Ratio) = {SNR_linear:.5f}[倍]')
                # 2. 分貝 (dB) SNR
                # 使用 10 * log10(X)
                SNR_dB = 10 * np.log10(SNR_linear)
                #print(f'SNR(Signal-to-Noise Ratio) = {SNR_dB:.5f}[dB]')
            #--
            # 紀錄結果 (TxA, TxB, RxM, RxN, VoverI, I_mA, ErrorIndex)
            # MATLAB: urf_measurement_data{i_all_event_ERT_data_index,1}=[...; ...];
            urf_measurement_data.append([
                Tx_A_index_1based,
                Tx_B_index_1based,
                M_electrode_1based,
                N_electrode_1based,
                temp_VoverI,
                Tx_I_AB_amplitude,
                SNR_dB
            ])
            #print('--')
    #print(urf_measurement_data)
    print(f'觀測資料數量 = {len(urf_measurement_data)}')
    print(f'第 {event_num} 次工作事件處理...結束')
    print('--')
    # ----------------------------------------------------------------------
#--------------------------------------------
# 一次性轉換為NumPyArray
NumPyArray_urf_measurement_data=np.array(urf_measurement_data)
#--
# 取出 1based 索引的電極編號，是numpy.ndarray
NumPyArray_A_index = np.array(NumPyArray_urf_measurement_data[:,0]) 
NumPyArray_B_index = np.array(NumPyArray_urf_measurement_data[:,1]) 
NumPyArray_M_index = np.array(NumPyArray_urf_measurement_data[:,2]) 
NumPyArray_N_index = np.array(NumPyArray_urf_measurement_data[:,3]) 
#--
# 準備ERT電極排列檢測字典變數
ERT_Electrode_Array_Check={}
#--------------------------------------------

#--------------------------------------------
# (a)Wenner-Alpha(WA) Array: A,M,N,B 且distance_AM=distance_MN=distance_NB
# REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
ERT_Electrode_Array_Check["WA(AMNB)"] = ( \
    (NumPyArray_A_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_B_index) & \
    (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) & \
    (NumPyArray_N_index-NumPyArray_M_index == NumPyArray_B_index-NumPyArray_N_index) \
).astype(int)
# 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
ERT_Electrode_Array_Check["WA#1(BMNA)"] = ( \
    (NumPyArray_B_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_A_index) & \
    (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) & \
    (NumPyArray_N_index-NumPyArray_M_index == NumPyArray_A_index-NumPyArray_N_index) \
).astype(int)
# 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
ERT_Electrode_Array_Check["WA#2(ANMB)"] = ( \
    (NumPyArray_A_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_B_index) & \
    (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) & \
    (NumPyArray_M_index-NumPyArray_N_index == NumPyArray_B_index-NumPyArray_M_index) \
).astype(int)
# 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
ERT_Electrode_Array_Check["WA#3(BNMA)"] = ( \
    (NumPyArray_B_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_A_index) & \
    (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) & \
    (NumPyArray_M_index-NumPyArray_N_index == NumPyArray_A_index-NumPyArray_M_index) \
).astype(int)
#--
print(f'ERT_Electrode_Array_Check["WA(AMNB)"] count = {np.sum(ERT_Electrode_Array_Check["WA(AMNB)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["WA#1(BMNA)"] count = {np.sum(ERT_Electrode_Array_Check["WA#1(BMNA)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["WA#2(ANMB)"] count = {np.sum(ERT_Electrode_Array_Check["WA#2(ANMB)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["WA#3(BNMA)"] count = {np.sum(ERT_Electrode_Array_Check["WA#3(BNMA)"]).astype(int)}')
print('--')
#--
"""
NumPyArray_A_index_WA_AMNB = NumPyArray_A_index[np.array(ERT_Electrode_Array_Check["WA(AMNB)"]) == 1]
NumPyArray_B_index_WA_AMNB = NumPyArray_B_index[np.array(ERT_Electrode_Array_Check["WA(AMNB)"]) == 1]
NumPyArray_M_index_WA_AMNB = NumPyArray_M_index[np.array(ERT_Electrode_Array_Check["WA(AMNB)"]) == 1]
NumPyArray_N_index_WA_AMNB = NumPyArray_N_index[np.array(ERT_Electrode_Array_Check["WA(AMNB)"]) == 1]
for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
    zip(
        NumPyArray_A_index_WA_AMNB, 
        NumPyArray_B_index_WA_AMNB, 
        NumPyArray_M_index_WA_AMNB, 
        NumPyArray_N_index_WA_AMNB
    ), 
    start=1 # 讓序號從 1 開始顯示
):
    print(f'WA_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
print('--')
"""
#--------------------------------------------

#--------------------------------------------
# (b)Wenner-Beta(WB) Array: B,A,M,N 且distance_BA=distance_AM=distance_MN
# REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
ERT_Electrode_Array_Check["WB(BAMN)"] = ( \
    (NumPyArray_B_index < NumPyArray_A_index) & \
    (NumPyArray_A_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_N_index) & \
    (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_A_index) & \
    (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) \
).astype(int)
# 考慮置換情形 #1: A,B,M,N (電流反向, Current=-I)
ERT_Electrode_Array_Check["WB#1(ABMN)"] = ( \
    (NumPyArray_A_index < NumPyArray_B_index) & \
    (NumPyArray_B_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_N_index) & \
    (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_B_index) & \
    (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) \
).astype(int)
# 考慮置換情形 #2: B,A,N,M (電壓反向, Voltage=-V)
ERT_Electrode_Array_Check["WB#2(BANM)"] = ( \
    (NumPyArray_B_index < NumPyArray_A_index) & \
    (NumPyArray_A_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_M_index) & \
    (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_A_index) & \
    (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) \
).astype(int)
# 考慮置換情形 #3: A,B,N,M (電流/電壓反向, Current=-I, Voltage=-V)
ERT_Electrode_Array_Check["WB#3(ABNM)"] = ( \
    (NumPyArray_A_index < NumPyArray_B_index) & \
    (NumPyArray_B_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_M_index) & \
    (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_B_index) & \
    (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) \
).astype(int)
#--
print(f'ERT_Electrode_Array_Check["WB(BAMN)"] count = {np.sum(ERT_Electrode_Array_Check["WB(BAMN)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["WB#1(ABMN)"] count = {np.sum(ERT_Electrode_Array_Check["WB#1(ABMN)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["WB#2(BANM)"] count = {np.sum(ERT_Electrode_Array_Check["WB#2(BANM)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["WB#3(ABNM)"] count = {np.sum(ERT_Electrode_Array_Check["WB#3(ABNM)"]).astype(int)}')
print('--')
#--
"""
NumPyArray_A_index_WB_ABMN = NumPyArray_A_index[np.array(ERT_Electrode_Array_Check["WB#1(ABMN)"]) == 1]
NumPyArray_B_index_WB_ABMN = NumPyArray_B_index[np.array(ERT_Electrode_Array_Check["WB#1(ABMN)"]) == 1]
NumPyArray_M_index_WB_ABMN = NumPyArray_M_index[np.array(ERT_Electrode_Array_Check["WB#1(ABMN)"]) == 1]
NumPyArray_N_index_WB_ABMN = NumPyArray_N_index[np.array(ERT_Electrode_Array_Check["WB#1(ABMN)"]) == 1]
for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
    zip(
        NumPyArray_A_index_WB_ABMN, 
        NumPyArray_B_index_WB_ABMN, 
        NumPyArray_M_index_WB_ABMN, 
        NumPyArray_N_index_WB_ABMN
    ), 
    start=1 # 讓序號從 1 開始顯示
):
    print(f'WB_ABMN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
print('--')
"""
#--------------------------------------------
#--------------------------------------------
# (c)Wenner-Gamma(WG) Array: A,M,B,N 且distance_AM=distance_MB=distance_BN
# REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
ERT_Electrode_Array_Check["WG(AMBN)"] = ( \
    (NumPyArray_A_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_B_index) & \
    (NumPyArray_B_index < NumPyArray_N_index) & \
    (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_M_index) & \
    (NumPyArray_B_index-NumPyArray_M_index == NumPyArray_N_index-NumPyArray_B_index) \
).astype(int)
# 考慮置換情形 #1: B,M,A,N (電流反向, Current=-I)
ERT_Electrode_Array_Check["WG#1(BMAN)"] = ( \
    (NumPyArray_B_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_A_index) & \
    (NumPyArray_A_index < NumPyArray_N_index) & \
    (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_M_index) & \
    (NumPyArray_A_index-NumPyArray_M_index == NumPyArray_N_index-NumPyArray_A_index) \
).astype(int)
# 考慮置換情形 #2: A,N,B,M (電壓反向, Voltage=-V)
ERT_Electrode_Array_Check["WG#2(ANBM)"] = ( \
    (NumPyArray_A_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_B_index) & \
    (NumPyArray_B_index < NumPyArray_M_index) & \
    (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_N_index) & \
    (NumPyArray_B_index-NumPyArray_N_index == NumPyArray_M_index-NumPyArray_B_index) \
).astype(int)
# 考慮置換情形 #3: B,N,A,M (電流/電壓反向, Current=-I, Voltage=-V)
ERT_Electrode_Array_Check["WG#3(BNAM)"] = ( \
    (NumPyArray_B_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_A_index) & \
    (NumPyArray_A_index < NumPyArray_M_index) & \
    (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_N_index) & \
    (NumPyArray_A_index-NumPyArray_N_index == NumPyArray_M_index-NumPyArray_A_index) \
).astype(int)
#--
print(f'ERT_Electrode_Array_Check["WG(AMBN)"] count = {np.sum(ERT_Electrode_Array_Check["WG(AMBN)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["WG#1(BMAN)"] count = {np.sum(ERT_Electrode_Array_Check["WG#1(BMAN)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["WG#2(ANBM)"] count = {np.sum(ERT_Electrode_Array_Check["WG#2(ANBM)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["WG#3(BNAM)"] count = {np.sum(ERT_Electrode_Array_Check["WG#3(BNAM)"]).astype(int)}')
print('--')
#--
"""
NumPyArray_A_index_WG_AMBN = NumPyArray_A_index[np.array(ERT_Electrode_Array_Check["WG(AMBN)"]) == 1]
NumPyArray_B_index_WG_AMBN = NumPyArray_B_index[np.array(ERT_Electrode_Array_Check["WG(AMBN)"]) == 1]
NumPyArray_M_index_WG_AMBN = NumPyArray_M_index[np.array(ERT_Electrode_Array_Check["WG(AMBN)"]) == 1]
NumPyArray_N_index_WG_AMBN = NumPyArray_N_index[np.array(ERT_Electrode_Array_Check["WG(AMBN)"]) == 1]
for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
    zip(
        NumPyArray_A_index_WG_AMBN, 
        NumPyArray_B_index_WG_AMBN, 
        NumPyArray_M_index_WG_AMBN, 
        NumPyArray_N_index_WG_AMBN
    ), 
    start=1 # 讓序號從 1 開始顯示
):
    print(f'WG_AMBN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
print('--')
"""
#--------------------------------------------
#--------------------------------------------
# (e)Dipole-Dipole(DD) Array: B,A,M,N 且distance_BA=distance_MN=a, distance_AM=na
# REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
ERT_Electrode_Array_Check["DD(BAMN)"] = ( \
    (NumPyArray_B_index < NumPyArray_A_index) & \
    (NumPyArray_A_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_N_index) & \
    (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) & \
    ((NumPyArray_M_index-NumPyArray_A_index) % (NumPyArray_A_index-NumPyArray_B_index) == 0) \
).astype(int)
# 考慮置換情形 #1: A,B,M,N (電流反向, Current=-I)
ERT_Electrode_Array_Check["DD#1(ABMN)"] = ( \
    (NumPyArray_A_index < NumPyArray_B_index) & \
    (NumPyArray_B_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_N_index) & \
    (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) & \
    ((NumPyArray_M_index-NumPyArray_B_index) % (NumPyArray_B_index-NumPyArray_A_index) == 0) \
).astype(int)
# 考慮置換情形 #2: B,A,N,M (電壓反向, Voltage=-V)
ERT_Electrode_Array_Check["DD#2(BANM)"] = ( \
    (NumPyArray_B_index < NumPyArray_A_index) & \
    (NumPyArray_A_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_M_index) & \
    (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) & \
    ((NumPyArray_N_index-NumPyArray_A_index) % (NumPyArray_A_index-NumPyArray_B_index) == 0) \
).astype(int)
# 考慮置換情形 #3: A,B,N,M (電流/電壓反向, Current=-I, Voltage=-V)
ERT_Electrode_Array_Check["DD#3(ABNM)"] = ( \
    (NumPyArray_A_index < NumPyArray_B_index) & \
    (NumPyArray_B_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_M_index) & \
    (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) & \
    ((NumPyArray_N_index-NumPyArray_B_index) % (NumPyArray_B_index-NumPyArray_A_index) == 0) \
).astype(int)
#--
print(f'ERT_Electrode_Array_Check["DD(BAMN)"] count = {np.sum(ERT_Electrode_Array_Check["DD(BAMN)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["DD#1(ABMN)"] count = {np.sum(ERT_Electrode_Array_Check["DD#1(ABMN)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["DD#2(BANM)"] count = {np.sum(ERT_Electrode_Array_Check["DD#2(BANM)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["DD#3(ABNM)"] count = {np.sum(ERT_Electrode_Array_Check["DD#3(ABNM)"]).astype(int)}')
print('--')
#--
"""
NumPyArray_A_index_DD_ABMN = NumPyArray_A_index[np.array(ERT_Electrode_Array_Check["DD#1(ABMN)"]) == 1]
NumPyArray_B_index_DD_ABMN = NumPyArray_B_index[np.array(ERT_Electrode_Array_Check["DD#1(ABMN)"]) == 1]
NumPyArray_M_index_DD_ABMN = NumPyArray_M_index[np.array(ERT_Electrode_Array_Check["DD#1(ABMN)"]) == 1]
NumPyArray_N_index_DD_ABMN = NumPyArray_N_index[np.array(ERT_Electrode_Array_Check["DD#1(ABMN)"]) == 1]
for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
    zip(
        NumPyArray_A_index_DD_ABMN, 
        NumPyArray_B_index_DD_ABMN, 
        NumPyArray_M_index_DD_ABMN, 
        NumPyArray_N_index_DD_ABMN
    ), 
    start=1 # 讓序號從 1 開始顯示
):
    print(f'DD_ABMN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
print('--')
"""
#--------------------------------------------
#--------------------------------------------
# (g)Wenner-Schlumberger(WS) Array: A,M,N,B 且distance_MN=a, distance_AM=distance_NB=na
# REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
ERT_Electrode_Array_Check["WS(AMNB)"] = ( \
    (NumPyArray_A_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_B_index) & \
    (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_N_index) & \
    ((NumPyArray_M_index-NumPyArray_A_index) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
).astype(int)
# 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
ERT_Electrode_Array_Check["WS#1(BMNA)"] = ( \
    (NumPyArray_B_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_A_index) & \
    (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_N_index) & \
    ((NumPyArray_M_index-NumPyArray_B_index) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
).astype(int)
# 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
ERT_Electrode_Array_Check["WS#2(ANMB)"] = ( \
    (NumPyArray_A_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_B_index) & \
    (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_M_index) & \
    ((NumPyArray_N_index-NumPyArray_A_index) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
).astype(int)
# 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
ERT_Electrode_Array_Check["WS#3(BNMA)"] = ( \
    (NumPyArray_B_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_A_index) & \
    (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_M_index) & \
    ((NumPyArray_N_index-NumPyArray_B_index) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
).astype(int)
#--
print(f'ERT_Electrode_Array_Check["WS(AMNB)"] count = {np.sum(ERT_Electrode_Array_Check["WS(AMNB)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["WS#1(BMNA)"] count = {np.sum(ERT_Electrode_Array_Check["WS#1(BMNA)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["WS#2(ANMB)"] count = {np.sum(ERT_Electrode_Array_Check["WS#2(ANMB)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["WS#3(BNMA)"] count = {np.sum(ERT_Electrode_Array_Check["WS#3(BNMA)"]).astype(int)}')
print('--')
#--
"""
NumPyArray_A_index_WS_AMNB = NumPyArray_A_index[np.array(ERT_Electrode_Array_Check["WS(AMNB)"]) == 1]
NumPyArray_B_index_WS_AMNB= NumPyArray_B_index[np.array(ERT_Electrode_Array_Check["WS(AMNB)"]) == 1]
NumPyArray_M_index_WS_AMNB = NumPyArray_M_index[np.array(ERT_Electrode_Array_Check["WS(AMNB)"]) == 1]
NumPyArray_N_index_WS_AMNB = NumPyArray_N_index[np.array(ERT_Electrode_Array_Check["WS(AMNB)"]) == 1]
for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
    zip(
        NumPyArray_A_index_WS_AMNB, 
        NumPyArray_B_index_WS_AMNB, 
        NumPyArray_M_index_WS_AMNB, 
        NumPyArray_N_index_WS_AMNB
    ), 
    start=1 # 讓序號從 1 開始顯示
):
    print(f'WS_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
print('--')
"""
#--------------------------------------------

#--------------------------------------------
# (1) Gamma Array(GA): A,M,B,N 且distance_AM=distance_BN=a, distance_MB=na
# REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
ERT_Electrode_Array_Check["GA(AMBN)"] = ( \
    (NumPyArray_A_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_B_index) & \
    (NumPyArray_B_index < NumPyArray_N_index) & \
    (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_B_index) & \
    ((NumPyArray_B_index-NumPyArray_M_index) % (NumPyArray_M_index-NumPyArray_A_index) == 0) \
).astype(int)
# 考慮置換情形 #1: B,M,A,N (電流反向, Current=-I)
ERT_Electrode_Array_Check["GA#1(BMAN)"] = ( \
    (NumPyArray_B_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_A_index) & \
    (NumPyArray_A_index < NumPyArray_N_index) & \
    (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_A_index) & \
    ((NumPyArray_A_index-NumPyArray_M_index) % (NumPyArray_M_index-NumPyArray_B_index) == 0) \
).astype(int)
# 考慮置換情形 #2: A,N,B,M (電壓反向, Voltage=-V)
ERT_Electrode_Array_Check["GA#2(ANBM)"] = ( \
    (NumPyArray_A_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_B_index) & \
    (NumPyArray_B_index < NumPyArray_M_index) & \
    (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_B_index) & \
    ((NumPyArray_B_index-NumPyArray_N_index) % (NumPyArray_N_index-NumPyArray_A_index) == 0) \
).astype(int)
# 考慮置換情形 #3: B,N,A,M (電流/電壓反向, Current=-I, Voltage=-V)
ERT_Electrode_Array_Check["GA#3(BNAM)"] = ( \
    (NumPyArray_B_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_A_index) & \
    (NumPyArray_A_index < NumPyArray_M_index) & \
    (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_A_index) & \
    ((NumPyArray_A_index-NumPyArray_N_index) % (NumPyArray_N_index-NumPyArray_B_index) == 0) \
).astype(int)
#--
print(f'ERT_Electrode_Array_Check["GA(AMBN)"] count = {np.sum(ERT_Electrode_Array_Check["GA(AMBN)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["GA#1(BMAN)"] count = {np.sum(ERT_Electrode_Array_Check["GA#1(BMAN)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["GA#2(ANBM)"] count = {np.sum(ERT_Electrode_Array_Check["GA#2(ANBM)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["GA#3(BNAM)"] count = {np.sum(ERT_Electrode_Array_Check["GA#3(BNAM)"]).astype(int)}')
print('--')
#--
#--------------------------------------------

#--------------------------------------------
# (2) Multiple or Moving Gradient Array(MGD): A,M,N,B 且 distance_MN=a, distance_AB=(s+2)a -> (distance_AB-(2*distance_MN))%(distance_MN)==0
# REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
ERT_Electrode_Array_Check["MGD(AMNB)"] = ( \
    (NumPyArray_A_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_B_index) & \
    ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
).astype(int)
# 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
ERT_Electrode_Array_Check["MGD#1(BMNA)"] = ( \
    (NumPyArray_B_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_A_index) & \
    ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
).astype(int)
# 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
ERT_Electrode_Array_Check["MGD#2(ANMB)"] = ( \
    (NumPyArray_A_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_B_index) & \
    ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
).astype(int)
# 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
ERT_Electrode_Array_Check["MGD#3(BNMA)"] = ( \
    (NumPyArray_B_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_A_index) & \
    ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
).astype(int)
#--
print(f'ERT_Electrode_Array_Check["MGD(AMNB)"] count = {np.sum(ERT_Electrode_Array_Check["MGD(AMNB)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["MGD#1(BMNA)"] count = {np.sum(ERT_Electrode_Array_Check["MGD#1(BMNA)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["MGD#2(ANMB)"] count = {np.sum(ERT_Electrode_Array_Check["MGD#2(ANMB)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["MGD#3(BNMA)"] count = {np.sum(ERT_Electrode_Array_Check["MGD#3(BNMA)"]).astype(int)}')
print('--')
#--
"""
NumPyArray_A_index_MGD_AMNB = NumPyArray_A_index[np.array(ERT_Electrode_Array_Check["MGD(AMNB)"]) == 1]
NumPyArray_B_index_MGD_AMNB= NumPyArray_B_index[np.array(ERT_Electrode_Array_Check["MGD(AMNB)"]) == 1]
NumPyArray_M_index_MGD_AMNB = NumPyArray_M_index[np.array(ERT_Electrode_Array_Check["MGD(AMNB)"]) == 1]
NumPyArray_N_index_MGD_AMNB = NumPyArray_N_index[np.array(ERT_Electrode_Array_Check["MGD(AMNB)"]) == 1]
for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
    zip(
        NumPyArray_A_index_MGD_AMNB, 
        NumPyArray_B_index_MGD_AMNB, 
        NumPyArray_M_index_MGD_AMNB, 
        NumPyArray_N_index_MGD_AMNB
    ), 
    start=1 # 讓序號從 1 開始顯示
):
    print(f'MGD_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
print('--')
"""
#--------------------------------------------

#--------------------------------------------
# (3) Midpoint-Potential-Referred measurement(MPR): A,M,N,B 且 distance_MN=a, distance_AB=2(s+1)a=2sa+2a-> (distance_AB-(2*distance_MN))%(2*distance_MN)==0
# REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
ERT_Electrode_Array_Check["MPR(AMNB)"] = ( \
    (NumPyArray_A_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_B_index) & \
    ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (2*(NumPyArray_N_index-NumPyArray_M_index)) == 0) \
).astype(int)
# 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
ERT_Electrode_Array_Check["MPR#1(BMNA)"] = ( \
    (NumPyArray_B_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_A_index) & \
    ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (2*(NumPyArray_N_index-NumPyArray_M_index)) == 0) \
).astype(int)
# 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
ERT_Electrode_Array_Check["MPR#2(ANMB)"] = ( \
    (NumPyArray_A_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_B_index) & \
    ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (2*(NumPyArray_M_index-NumPyArray_N_index)) == 0) \
).astype(int)
# 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
ERT_Electrode_Array_Check["MPR#3(BNMA)"] = ( \
    (NumPyArray_B_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_A_index) & \
    ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (2*(NumPyArray_M_index-NumPyArray_N_index)) == 0) \
).astype(int)
#--
print(f'ERT_Electrode_Array_Check["MPR(AMNB)"] count = {np.sum(ERT_Electrode_Array_Check["MPR(AMNB)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["MPR#1(BMNA)"] count = {np.sum(ERT_Electrode_Array_Check["MPR#1(BMNA)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["MPR#2(ANMB)"] count = {np.sum(ERT_Electrode_Array_Check["MPR#2(ANMB)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["MPR#3(BNMA)"] count = {np.sum(ERT_Electrode_Array_Check["MPR#3(BNMA)"]).astype(int)}')
print('--')
#--
"""
NumPyArray_A_index_MPR_AMNB = NumPyArray_A_index[np.array(ERT_Electrode_Array_Check["MPR(AMNB)"]) == 1]
NumPyArray_B_index_MPR_AMNB= NumPyArray_B_index[np.array(ERT_Electrode_Array_Check["MPR(AMNB)"]) == 1]
NumPyArray_M_index_MPR_AMNB = NumPyArray_M_index[np.array(ERT_Electrode_Array_Check["MPR(AMNB)"]) == 1]
NumPyArray_N_index_MPR_AMNB = NumPyArray_N_index[np.array(ERT_Electrode_Array_Check["MPR(AMNB)"]) == 1]
for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
    zip(
        NumPyArray_A_index_MPR_AMNB, 
        NumPyArray_B_index_MPR_AMNB, 
        NumPyArray_M_index_MPR_AMNB, 
        NumPyArray_N_index_MPR_AMNB
    ), 
    start=1 # 讓序號從 1 開始顯示
):
    print(f'MPR_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
print('--')
"""
#--------------------------------------------

#--------------------------------------------
# Gradient(GD) Array: A,M,N,B
ERT_Electrode_Array_Check["GD(AMNB)"] = ( \
    (NumPyArray_A_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_B_index) \
).astype(int)
# 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
ERT_Electrode_Array_Check["GD#1(BMNA)"] = ( \
    (NumPyArray_B_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_A_index) \
).astype(int)
# 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
ERT_Electrode_Array_Check["GD#2(ANMB)"] = ( \
    (NumPyArray_A_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_B_index) \
).astype(int)
# 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
ERT_Electrode_Array_Check["GD#3(BNMA)"] = ( \
    (NumPyArray_B_index < NumPyArray_N_index) & \
    (NumPyArray_N_index < NumPyArray_M_index) & \
    (NumPyArray_M_index < NumPyArray_A_index) \
).astype(int)
#--
print(f'ERT_Electrode_Array_Check["GD(AMNB)"] count = {np.sum(ERT_Electrode_Array_Check["GD(AMNB)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["GD#1(BMNA)"] count = {np.sum(ERT_Electrode_Array_Check["GD#1(BMNA)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["GD#2(ANMB)"] count = {np.sum(ERT_Electrode_Array_Check["GD#2(ANMB)"]).astype(int)}')
print(f'ERT_Electrode_Array_Check["GD#3(BNMA)"] count = {np.sum(ERT_Electrode_Array_Check["GD#3(BNMA)"]).astype(int)}')
print('--')
#--
"""
NumPyArray_A_index_GD_AMNB = NumPyArray_A_index[np.array(ERT_Electrode_Array_Check["GD(AMNB)"]) == 1]
NumPyArray_B_index_GD_AMNB= NumPyArray_B_index[np.array(ERT_Electrode_Array_Check["GD(AMNB)"]) == 1]
NumPyArray_M_index_GD_AMNB = NumPyArray_M_index[np.array(ERT_Electrode_Array_Check["GD(AMNB)"]) == 1]
NumPyArray_N_index_GD_AMNB = NumPyArray_N_index[np.array(ERT_Electrode_Array_Check["GD(AMNB)"]) == 1]
for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
    zip(
        NumPyArray_A_index_GD_AMNB, 
        NumPyArray_B_index_GD_AMNB, 
        NumPyArray_M_index_GD_AMNB, 
        NumPyArray_N_index_GD_AMNB
    ), 
    start=1 # 讓序號從 1 開始顯示
):
    print(f'GD_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
print('--')
"""
#--------------------------------------------


#********************************************
# 輸出檔案 All
#--------------------------------------------
if len(NumPyArray_urf_measurement_data) > 0:   
    print('輸出Urf_All檔案...')
    Output_Urf_FileName = temp_json_data["OutputFile01_Urf_All_FileName"]
    os.makedirs(os.path.dirname(Output_Urf_FileName), exist_ok=True)
    # 寫入 Urf 檔案
    try:
        with open(Output_Urf_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.geo」資訊
            f1.write(temp_geo_char_data)        
            # 檢查最後一個字元是否為換行符號 (\n)
            if not temp_geo_char_data.endswith('\n'):
                f1.write('\n')            
            for row in NumPyArray_urf_measurement_data:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以逗號分隔，最後換行
                f1.write(f"{int(row[0])},{int(row[1])},{int(row[2])},{int(row[3])},{row[4]:.5f},{row[5]:.3f},0\n") 
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Urf_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Urf_All檔案...結束!')
    print('--')
    print('輸出Urf_All_SNR檔案...')
    Output_Urf_SNR_FileName = temp_json_data["OutputFile02_Urf_All_SNR_FileName"]
    os.makedirs(os.path.dirname(Output_Urf_SNR_FileName), exist_ok=True)
    # 寫入 Urf 檔案
    try:
        with open(Output_Urf_SNR_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.geo」資訊
            f1.write(temp_geo_char_data)        
            # 檢查最後一個字元是否為換行符號 (\n)
            if not temp_geo_char_data.endswith('\n'):
                f1.write('\n')            
            for row in NumPyArray_urf_measurement_data:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以逗號分隔，最後換行
                f1.write(f"{int(row[0])},{int(row[1])},{int(row[2])},{int(row[3])},{row[4]:.5f},{row[5]:.3f},{row[6]:.2f}\n")            
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Urf_SNR_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Urf_All_SNR檔案...結束!')
    print('--')
    #--------------------------------------------
    #--------------------------------------------
    # 輸出Ohm檔案
    print('輸出Ohm_All檔案...')
    Output_Ohm_FileName = temp_json_data["OutputFile03_Ohm_All_FileName"]
    os.makedirs(os.path.dirname(Output_Ohm_FileName), exist_ok=True)
    # 寫入 Ohm 檔案
    try:
        with open(Output_Ohm_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.ohm」資訊
            f1.write(temp_ohm_char_data)        
            # 寫資料
            f1.write(f"{len(NumPyArray_urf_measurement_data)}\n")
            f1.write('#A B M N R I SNR\n')
            for row in NumPyArray_urf_measurement_data:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以空格分隔，最後換行
                f1.write(f"{int(row[0])} {int(row[1])} {int(row[2])} {int(row[3])} {row[4]:.5f} {row[5]:.3f} {row[6]:.2f}\n")     
            f1.write('#------------------------------------------------------------\n')
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Ohm_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Ohm_All檔案...結束!')
    print('--')
    #--------------------------------------------
    if temp_json_data["OutputFile04_PNG_All_Enable"] == 'Yes' :
        #--------------------------------------------
        # 讀取資料
        #--
        print("載入OHM檔案...")
        data = ert.load(Output_Ohm_FileName)
        if os.path.exists('invalid.data'):
            os.remove('invalid.data')
        print("載入OHM檔案...完成!")
        print('--')
        #--------------------------------------------
        #--------------------------------------------
        # 設定設備的最大電極數量(不含參考電極)，目前固定為64
        N_electrodes = 64 
        #--------------------------------------------
        #============================================
        # VoverI 資料繪圖
        #--------------------------------------------
        print('VoverI 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        #--
        #--------------------------------------------
        # (a)Wenner-Alpha(WA) Array: A,M,N,B 且distance_AM=distance_MN=distance_NB
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WA(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_M_index == NumPyArray_B_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["WA#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_M_index == NumPyArray_A_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["WA#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_N_index == NumPyArray_B_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["WA#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_N_index == NumPyArray_A_index-NumPyArray_M_index) \
        ).astype(int)
        #--
        print(f'data["WA(AMNB)"] count = {np.sum(data["WA(AMNB)"]).astype(int)}')
        print(f'data["WA#1(BMNA)"] count = {np.sum(data["WA#1(BMNA)"]).astype(int)}')
        print(f'data["WA#2(ANMB)"] count = {np.sum(data["WA#2(ANMB)"]).astype(int)}')
        print(f'data["WA#3(BNMA)"] count = {np.sum(data["WA#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WA_AMNB = NumPyArray_A_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_B_index_WA_AMNB = NumPyArray_B_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_M_index_WA_AMNB = NumPyArray_M_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_N_index_WA_AMNB = NumPyArray_N_index[np.array(data["WA(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WA_AMNB, 
                NumPyArray_B_index_WA_AMNB, 
                NumPyArray_M_index_WA_AMNB, 
                NumPyArray_N_index_WA_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WA_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (b)Wenner-Beta(WB) Array: B,A,M,N 且distance_BA=distance_AM=distance_MN
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WB(BAMN)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #1: A,B,M,N (電流反向, Current=-I)
        data["WB#1(ABMN)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #2: B,A,N,M (電壓反向, Voltage=-V)
        data["WB#2(BANM)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #3: A,B,N,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["WB#3(ABNM)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) \
        ).astype(int)
        #--
        print(f'data["WB(BAMN)"] count = {np.sum(data["WB(BAMN)"]).astype(int)}')
        print(f'data["WB#1(ABMN)"] count = {np.sum(data["WB#1(ABMN)"]).astype(int)}')
        print(f'data["WB#2(BANM)"] count = {np.sum(data["WB#2(BANM)"]).astype(int)}')
        print(f'data["WB#3(ABNM)"] count = {np.sum(data["WB#3(ABNM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WB_ABMN = NumPyArray_A_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_B_index_WB_ABMN = NumPyArray_B_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_M_index_WB_ABMN = NumPyArray_M_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_N_index_WB_ABMN = NumPyArray_N_index[np.array(data["WB#1(ABMN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WB_ABMN, 
                NumPyArray_B_index_WB_ABMN, 
                NumPyArray_M_index_WB_ABMN, 
                NumPyArray_N_index_WB_ABMN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WB_ABMN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (c)Wenner-Gamma(WG) Array: A,M,B,N 且distance_AM=distance_MB=distance_BN
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WG(AMBN)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_M_index == NumPyArray_N_index-NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,A,N (電流反向, Current=-I)
        data["WG#1(BMAN)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_M_index == NumPyArray_N_index-NumPyArray_A_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,B,M (電壓反向, Voltage=-V)
        data["WG#2(ANBM)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_N_index == NumPyArray_M_index-NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,A,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["WG#3(BNAM)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_N_index == NumPyArray_M_index-NumPyArray_A_index) \
        ).astype(int)
        #--
        print(f'data["WG(AMBN)"] count = {np.sum(data["WG(AMBN)"]).astype(int)}')
        print(f'data["WG#1(BMAN)"] count = {np.sum(data["WG#1(BMAN)"]).astype(int)}')
        print(f'data["WG#2(ANBM)"] count = {np.sum(data["WG#2(ANBM)"]).astype(int)}')
        print(f'data["WG#3(BNAM)"] count = {np.sum(data["WG#3(BNAM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WG_AMBN = NumPyArray_A_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_B_index_WG_AMBN = NumPyArray_B_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_M_index_WG_AMBN = NumPyArray_M_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_N_index_WG_AMBN = NumPyArray_N_index[np.array(data["WG(AMBN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WG_AMBN, 
                NumPyArray_B_index_WG_AMBN, 
                NumPyArray_M_index_WG_AMBN, 
                NumPyArray_N_index_WG_AMBN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WG_AMBN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (e)Dipole-Dipole(DD) Array: B,A,M,N 且distance_BA=distance_MN=a, distance_AM=na
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["DD(BAMN)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) & \
            ((NumPyArray_M_index-NumPyArray_A_index) % (NumPyArray_A_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: A,B,M,N (電流反向, Current=-I)
        data["DD#1(ABMN)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) & \
            ((NumPyArray_M_index-NumPyArray_B_index) % (NumPyArray_B_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: B,A,N,M (電壓反向, Voltage=-V)
        data["DD#2(BANM)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) & \
            ((NumPyArray_N_index-NumPyArray_A_index) % (NumPyArray_A_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: A,B,N,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["DD#3(ABNM)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) & \
            ((NumPyArray_N_index-NumPyArray_B_index) % (NumPyArray_B_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        #--
        print(f'data["DD(BAMN)"] count = {np.sum(data["DD(BAMN)"]).astype(int)}')
        print(f'data["DD#1(ABMN)"] count = {np.sum(data["DD#1(ABMN)"]).astype(int)}')
        print(f'data["DD#2(BANM)"] count = {np.sum(data["DD#2(BANM)"]).astype(int)}')
        print(f'data["DD#3(ABNM)"] count = {np.sum(data["DD#3(ABNM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_DD_ABMN = NumPyArray_A_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_B_index_DD_ABMN = NumPyArray_B_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_M_index_DD_ABMN = NumPyArray_M_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_N_index_DD_ABMN = NumPyArray_N_index[np.array(data["DD#1(ABMN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_DD_ABMN, 
                NumPyArray_B_index_DD_ABMN, 
                NumPyArray_M_index_DD_ABMN, 
                NumPyArray_N_index_DD_ABMN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'DD_ABMN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (g)Wenner-Schlumberger(WS) Array: A,M,N,B 且distance_MN=a, distance_AM=distance_NB=na
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WS(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_N_index) & \
            ((NumPyArray_M_index-NumPyArray_A_index) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["WS#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_N_index) & \
            ((NumPyArray_M_index-NumPyArray_B_index) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["WS#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_M_index) & \
            ((NumPyArray_N_index-NumPyArray_A_index) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["WS#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_M_index) & \
            ((NumPyArray_N_index-NumPyArray_B_index) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        #--
        print(f'data["WS(AMNB)"] count = {np.sum(data["WS(AMNB)"]).astype(int)}')
        print(f'data["WS#1(BMNA)"] count = {np.sum(data["WS#1(BMNA)"]).astype(int)}')
        print(f'data["WS#2(ANMB)"] count = {np.sum(data["WS#2(ANMB)"]).astype(int)}')
        print(f'data["WS#3(BNMA)"] count = {np.sum(data["WS#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WS_AMNB = NumPyArray_A_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_B_index_WS_AMNB= NumPyArray_B_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_M_index_WS_AMNB = NumPyArray_M_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_N_index_WS_AMNB = NumPyArray_N_index[np.array(data["WS(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WS_AMNB, 
                NumPyArray_B_index_WS_AMNB, 
                NumPyArray_M_index_WS_AMNB, 
                NumPyArray_N_index_WS_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WS_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (1) Gamma Array(GA): A,M,B,N 且distance_AM=distance_BN=a, distance_MB=na
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["GA(AMBN)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_B_index) & \
            ((NumPyArray_B_index-NumPyArray_M_index) % (NumPyArray_M_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,A,N (電流反向, Current=-I)
        data["GA#1(BMAN)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_A_index) & \
            ((NumPyArray_A_index-NumPyArray_M_index) % (NumPyArray_M_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,B,M (電壓反向, Voltage=-V)
        data["GA#2(ANBM)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_B_index) & \
            ((NumPyArray_B_index-NumPyArray_N_index) % (NumPyArray_N_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,A,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["GA#3(BNAM)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_A_index) & \
            ((NumPyArray_A_index-NumPyArray_N_index) % (NumPyArray_N_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        #--
        print(f'data["GA(AMBN)"] count = {np.sum(data["GA(AMBN)"]).astype(int)}')
        print(f'data["GA#1(BMAN)"] count = {np.sum(data["GA#1(BMAN)"]).astype(int)}')
        print(f'data["GA#2(ANBM)"] count = {np.sum(data["GA#2(ANBM)"]).astype(int)}')
        print(f'data["GA#3(BNAM)"] count = {np.sum(data["GA#3(BNAM)"]).astype(int)}')
        print('--')
        #--
        #--------------------------------------------

        #--------------------------------------------
        # (2) Multiple or Moving Gradient Array(MGD): A,M,N,B 且 distance_MN=a, distance_AB=(s+2)a -> (distance_AB-(2*distance_MN))%(distance_MN)==0
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["MGD(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["MGD#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["MGD#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["MGD#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        #--
        print(f'data["MGD(AMNB)"] count = {np.sum(data["MGD(AMNB)"]).astype(int)}')
        print(f'data["MGD#1(BMNA)"] count = {np.sum(data["MGD#1(BMNA)"]).astype(int)}')
        print(f'data["MGD#2(ANMB)"] count = {np.sum(data["MGD#2(ANMB)"]).astype(int)}')
        print(f'data["MGD#3(BNMA)"] count = {np.sum(data["MGD#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_MGD_AMNB = NumPyArray_A_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_B_index_MGD_AMNB= NumPyArray_B_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_M_index_MGD_AMNB = NumPyArray_M_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_N_index_MGD_AMNB = NumPyArray_N_index[np.array(data["MGD(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_MGD_AMNB, 
                NumPyArray_B_index_MGD_AMNB, 
                NumPyArray_M_index_MGD_AMNB, 
                NumPyArray_N_index_MGD_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'MGD_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (3) Midpoint-Potential-Referred measurement(MPR): A,M,N,B 且 distance_MN=a, distance_AB=2(s+1)a=2sa+2a-> (distance_AB-(2*distance_MN))%(2*distance_MN)==0
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["MPR(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (2*(NumPyArray_N_index-NumPyArray_M_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["MPR#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (2*(NumPyArray_N_index-NumPyArray_M_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["MPR#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (2*(NumPyArray_M_index-NumPyArray_N_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["MPR#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (2*(NumPyArray_M_index-NumPyArray_N_index)) == 0) \
        ).astype(int)
        #--
        print(f'data["MPR(AMNB)"] count = {np.sum(data["MPR(AMNB)"]).astype(int)}')
        print(f'data["MPR#1(BMNA)"] count = {np.sum(data["MPR#1(BMNA)"]).astype(int)}')
        print(f'data["MPR#2(ANMB)"] count = {np.sum(data["MPR#2(ANMB)"]).astype(int)}')
        print(f'data["MPR#3(BNMA)"] count = {np.sum(data["MPR#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_MPR_AMNB = NumPyArray_A_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_B_index_MPR_AMNB= NumPyArray_B_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_M_index_MPR_AMNB = NumPyArray_M_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_N_index_MPR_AMNB = NumPyArray_N_index[np.array(data["MPR(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_MPR_AMNB, 
                NumPyArray_B_index_MPR_AMNB, 
                NumPyArray_M_index_MPR_AMNB, 
                NumPyArray_N_index_MPR_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'MPR_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # Gradient(GD) Array: A,M,N,B
        data["GD(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["GD#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["GD#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["GD#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) \
        ).astype(int)
        #--
        print(f'data["GD(AMNB)"] count = {np.sum(data["GD(AMNB)"]).astype(int)}')
        print(f'data["GD#1(BMNA)"] count = {np.sum(data["GD#1(BMNA)"]).astype(int)}')
        print(f'data["GD#2(ANMB)"] count = {np.sum(data["GD#2(ANMB)"]).astype(int)}')
        print(f'data["GD#3(BNMA)"] count = {np.sum(data["GD#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_GD_AMNB = NumPyArray_A_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_B_index_GD_AMNB= NumPyArray_B_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_M_index_GD_AMNB = NumPyArray_M_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_N_index_GD_AMNB = NumPyArray_N_index[np.array(data["GD(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_GD_AMNB, 
                NumPyArray_B_index_GD_AMNB, 
                NumPyArray_M_index_GD_AMNB, 
                NumPyArray_N_index_GD_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'GD_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["r"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='V/I (Ohm)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet') 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs V/I(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile04_PNG_All_MainFileName"]}.ABMN_vs_VoverI.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('VoverI 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # Current 資料繪圖
        #--------------------------------------------
        print('Current 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["i"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='Current (A)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet',
                vmin=0,
                vmax=NumPyArray_C_data.max()) 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs Current(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile04_PNG_All_MainFileName"]}.ABMN_vs_Current.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('Current 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # Voltage 資料繪圖
        #--------------------------------------------
        print('Voltage 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["i"]*data["r"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='Voltage (V)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet') 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs Voltage(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f})(abs(min)={np.abs(NumPyArray_C_data).min():.5f},abs(max)={np.abs(NumPyArray_C_data).max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile04_PNG_All_MainFileName"]}.ABMN_vs_Voltage.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('Voltage 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # SNR 資料繪圖
        #--------------------------------------------
        print('SNR 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["SNR"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='SNR (dB)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet',
                vmin=NumPyArray_C_data.min(),
                vmax=NumPyArray_C_data.max()) 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs SNR(min={NumPyArray_C_data.min():.2f},max={NumPyArray_C_data.max():.2f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile04_PNG_All_MainFileName"]}.ABMN_vs_SNR.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('SNR 資料繪圖...完成!')
        print('--')
        #============================================
#********************************************


#********************************************
# 輸出檔案 WS
#--------------------------------------------
NumPyArray_urf_measurement_data_WS = NumPyArray_urf_measurement_data[np.array(ERT_Electrode_Array_Check["WA(AMNB)"]) == 1]
if len(NumPyArray_urf_measurement_data_WS) > 0:  
    #--------------------------------------------
    print('輸出Urf_WS檔案...')
    Output_Urf_FileName = temp_json_data["OutputFile05_Urf_WS_FileName"]
    os.makedirs(os.path.dirname(Output_Urf_FileName), exist_ok=True)
    # 寫入 Urf 檔案
    try:
        with open(Output_Urf_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.geo」資訊
            f1.write(temp_geo_char_data)        
            # 檢查最後一個字元是否為換行符號 (\n)
            if not temp_geo_char_data.endswith('\n'):
                f1.write('\n')            
            for row in NumPyArray_urf_measurement_data_WS:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以逗號分隔，最後換行
                f1.write(f"{int(row[0])},{int(row[1])},{int(row[2])},{int(row[3])},{row[4]:.5f},{row[5]:.3f},0\n") 
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Urf_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Urf_WS檔案...結束!')
    print('--')
    print('輸出Urf_WS_SNR檔案...')
    Output_Urf_SNR_FileName = temp_json_data["OutputFile06_Urf_WS_SNR_FileName"]
    os.makedirs(os.path.dirname(Output_Urf_SNR_FileName), exist_ok=True)
    # 寫入 Urf 檔案
    try:
        with open(Output_Urf_SNR_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.geo」資訊
            f1.write(temp_geo_char_data)        
            # 檢查最後一個字元是否為換行符號 (\n)
            if not temp_geo_char_data.endswith('\n'):
                f1.write('\n')            
            for row in NumPyArray_urf_measurement_data_WS:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以逗號分隔，最後換行
                f1.write(f"{int(row[0])},{int(row[1])},{int(row[2])},{int(row[3])},{row[4]:.5f},{row[5]:.3f},{row[6]:.2f}\n")            
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Urf_SNR_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Urf_WS_SNR檔案...結束!')
    print('--')
    #--------------------------------------------
    #--------------------------------------------
    # 輸出Ohm檔案
    print('輸出Ohm_WS檔案...')
    Output_Ohm_FileName = temp_json_data["OutputFile07_Ohm_WS_FileName"]
    os.makedirs(os.path.dirname(Output_Ohm_FileName), exist_ok=True)
    # 寫入 Ohm 檔案
    try:
        with open(Output_Ohm_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.ohm」資訊
            f1.write(temp_ohm_char_data)        
            # 寫資料
            f1.write(f"{len(NumPyArray_urf_measurement_data_WS)}\n")
            f1.write('#A B M N R I SNR\n')
            for row in NumPyArray_urf_measurement_data_WS:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以空格分隔，最後換行
                f1.write(f"{int(row[0])} {int(row[1])} {int(row[2])} {int(row[3])} {row[4]:.5f} {row[5]:.3f} {row[6]:.2f}\n")     
            f1.write('#------------------------------------------------------------\n')
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Ohm_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Ohm_WS檔案...結束!')
    print('--')
    #--------------------------------------------
    if temp_json_data["OutputFile08_PNG_WS_Enable"] == 'Yes' :
        #--------------------------------------------
        # 讀取資料
        #--
        print("載入OHM檔案...")
        data = ert.load(Output_Ohm_FileName)
        if os.path.exists('invalid.data'):
            os.remove('invalid.data')
        print("載入OHM檔案...完成!")
        print('--')
        #--------------------------------------------
        #--------------------------------------------
        # 設定設備的最大電極數量(不含參考電極)，目前固定為64
        N_electrodes = 64 
        #--------------------------------------------
        #============================================
        # VoverI_WS 資料繪圖
        #--------------------------------------------
        print('VoverI_WS 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        #--
        #--------------------------------------------
        # (a)Wenner-Alpha(WA) Array: A,M,N,B 且distance_AM=distance_MN=distance_NB
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WA(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_M_index == NumPyArray_B_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["WA#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_M_index == NumPyArray_A_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["WA#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_N_index == NumPyArray_B_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["WA#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_N_index == NumPyArray_A_index-NumPyArray_M_index) \
        ).astype(int)
        #--
        print(f'data["WA(AMNB)"] count = {np.sum(data["WA(AMNB)"]).astype(int)}')
        print(f'data["WA#1(BMNA)"] count = {np.sum(data["WA#1(BMNA)"]).astype(int)}')
        print(f'data["WA#2(ANMB)"] count = {np.sum(data["WA#2(ANMB)"]).astype(int)}')
        print(f'data["WA#3(BNMA)"] count = {np.sum(data["WA#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WA_AMNB = NumPyArray_A_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_B_index_WA_AMNB = NumPyArray_B_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_M_index_WA_AMNB = NumPyArray_M_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_N_index_WA_AMNB = NumPyArray_N_index[np.array(data["WA(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WA_AMNB, 
                NumPyArray_B_index_WA_AMNB, 
                NumPyArray_M_index_WA_AMNB, 
                NumPyArray_N_index_WA_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WA_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (b)Wenner-Beta(WB) Array: B,A,M,N 且distance_BA=distance_AM=distance_MN
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WB(BAMN)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #1: A,B,M,N (電流反向, Current=-I)
        data["WB#1(ABMN)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #2: B,A,N,M (電壓反向, Voltage=-V)
        data["WB#2(BANM)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #3: A,B,N,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["WB#3(ABNM)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) \
        ).astype(int)
        #--
        print(f'data["WB(BAMN)"] count = {np.sum(data["WB(BAMN)"]).astype(int)}')
        print(f'data["WB#1(ABMN)"] count = {np.sum(data["WB#1(ABMN)"]).astype(int)}')
        print(f'data["WB#2(BANM)"] count = {np.sum(data["WB#2(BANM)"]).astype(int)}')
        print(f'data["WB#3(ABNM)"] count = {np.sum(data["WB#3(ABNM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WB_ABMN = NumPyArray_A_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_B_index_WB_ABMN = NumPyArray_B_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_M_index_WB_ABMN = NumPyArray_M_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_N_index_WB_ABMN = NumPyArray_N_index[np.array(data["WB#1(ABMN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WB_ABMN, 
                NumPyArray_B_index_WB_ABMN, 
                NumPyArray_M_index_WB_ABMN, 
                NumPyArray_N_index_WB_ABMN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WB_ABMN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (c)Wenner-Gamma(WG) Array: A,M,B,N 且distance_AM=distance_MB=distance_BN
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WG(AMBN)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_M_index == NumPyArray_N_index-NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,A,N (電流反向, Current=-I)
        data["WG#1(BMAN)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_M_index == NumPyArray_N_index-NumPyArray_A_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,B,M (電壓反向, Voltage=-V)
        data["WG#2(ANBM)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_N_index == NumPyArray_M_index-NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,A,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["WG#3(BNAM)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_N_index == NumPyArray_M_index-NumPyArray_A_index) \
        ).astype(int)
        #--
        print(f'data["WG(AMBN)"] count = {np.sum(data["WG(AMBN)"]).astype(int)}')
        print(f'data["WG#1(BMAN)"] count = {np.sum(data["WG#1(BMAN)"]).astype(int)}')
        print(f'data["WG#2(ANBM)"] count = {np.sum(data["WG#2(ANBM)"]).astype(int)}')
        print(f'data["WG#3(BNAM)"] count = {np.sum(data["WG#3(BNAM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WG_AMBN = NumPyArray_A_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_B_index_WG_AMBN = NumPyArray_B_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_M_index_WG_AMBN = NumPyArray_M_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_N_index_WG_AMBN = NumPyArray_N_index[np.array(data["WG(AMBN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WG_AMBN, 
                NumPyArray_B_index_WG_AMBN, 
                NumPyArray_M_index_WG_AMBN, 
                NumPyArray_N_index_WG_AMBN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WG_AMBN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (e)Dipole-Dipole(DD) Array: B,A,M,N 且distance_BA=distance_MN=a, distance_AM=na
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["DD(BAMN)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) & \
            ((NumPyArray_M_index-NumPyArray_A_index) % (NumPyArray_A_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: A,B,M,N (電流反向, Current=-I)
        data["DD#1(ABMN)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) & \
            ((NumPyArray_M_index-NumPyArray_B_index) % (NumPyArray_B_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: B,A,N,M (電壓反向, Voltage=-V)
        data["DD#2(BANM)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) & \
            ((NumPyArray_N_index-NumPyArray_A_index) % (NumPyArray_A_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: A,B,N,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["DD#3(ABNM)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) & \
            ((NumPyArray_N_index-NumPyArray_B_index) % (NumPyArray_B_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        #--
        print(f'data["DD(BAMN)"] count = {np.sum(data["DD(BAMN)"]).astype(int)}')
        print(f'data["DD#1(ABMN)"] count = {np.sum(data["DD#1(ABMN)"]).astype(int)}')
        print(f'data["DD#2(BANM)"] count = {np.sum(data["DD#2(BANM)"]).astype(int)}')
        print(f'data["DD#3(ABNM)"] count = {np.sum(data["DD#3(ABNM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_DD_ABMN = NumPyArray_A_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_B_index_DD_ABMN = NumPyArray_B_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_M_index_DD_ABMN = NumPyArray_M_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_N_index_DD_ABMN = NumPyArray_N_index[np.array(data["DD#1(ABMN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_DD_ABMN, 
                NumPyArray_B_index_DD_ABMN, 
                NumPyArray_M_index_DD_ABMN, 
                NumPyArray_N_index_DD_ABMN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'DD_ABMN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (g)Wenner-Schlumberger(WS) Array: A,M,N,B 且distance_MN=a, distance_AM=distance_NB=na
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WS(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_N_index) & \
            ((NumPyArray_M_index-NumPyArray_A_index) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["WS#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_N_index) & \
            ((NumPyArray_M_index-NumPyArray_B_index) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["WS#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_M_index) & \
            ((NumPyArray_N_index-NumPyArray_A_index) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["WS#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_M_index) & \
            ((NumPyArray_N_index-NumPyArray_B_index) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        #--
        print(f'data["WS(AMNB)"] count = {np.sum(data["WS(AMNB)"]).astype(int)}')
        print(f'data["WS#1(BMNA)"] count = {np.sum(data["WS#1(BMNA)"]).astype(int)}')
        print(f'data["WS#2(ANMB)"] count = {np.sum(data["WS#2(ANMB)"]).astype(int)}')
        print(f'data["WS#3(BNMA)"] count = {np.sum(data["WS#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WS_AMNB = NumPyArray_A_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_B_index_WS_AMNB= NumPyArray_B_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_M_index_WS_AMNB = NumPyArray_M_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_N_index_WS_AMNB = NumPyArray_N_index[np.array(data["WS(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WS_AMNB, 
                NumPyArray_B_index_WS_AMNB, 
                NumPyArray_M_index_WS_AMNB, 
                NumPyArray_N_index_WS_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WS_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (1) Gamma Array(GA): A,M,B,N 且distance_AM=distance_BN=a, distance_MB=na
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["GA(AMBN)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_B_index) & \
            ((NumPyArray_B_index-NumPyArray_M_index) % (NumPyArray_M_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,A,N (電流反向, Current=-I)
        data["GA#1(BMAN)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_A_index) & \
            ((NumPyArray_A_index-NumPyArray_M_index) % (NumPyArray_M_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,B,M (電壓反向, Voltage=-V)
        data["GA#2(ANBM)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_B_index) & \
            ((NumPyArray_B_index-NumPyArray_N_index) % (NumPyArray_N_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,A,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["GA#3(BNAM)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_A_index) & \
            ((NumPyArray_A_index-NumPyArray_N_index) % (NumPyArray_N_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        #--
        print(f'data["GA(AMBN)"] count = {np.sum(data["GA(AMBN)"]).astype(int)}')
        print(f'data["GA#1(BMAN)"] count = {np.sum(data["GA#1(BMAN)"]).astype(int)}')
        print(f'data["GA#2(ANBM)"] count = {np.sum(data["GA#2(ANBM)"]).astype(int)}')
        print(f'data["GA#3(BNAM)"] count = {np.sum(data["GA#3(BNAM)"]).astype(int)}')
        print('--')
        #--
        #--------------------------------------------

        #--------------------------------------------
        # (2) Multiple or Moving Gradient Array(MGD): A,M,N,B 且 distance_MN=a, distance_AB=(s+2)a -> (distance_AB-(2*distance_MN))%(distance_MN)==0
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["MGD(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["MGD#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["MGD#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["MGD#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        #--
        print(f'data["MGD(AMNB)"] count = {np.sum(data["MGD(AMNB)"]).astype(int)}')
        print(f'data["MGD#1(BMNA)"] count = {np.sum(data["MGD#1(BMNA)"]).astype(int)}')
        print(f'data["MGD#2(ANMB)"] count = {np.sum(data["MGD#2(ANMB)"]).astype(int)}')
        print(f'data["MGD#3(BNMA)"] count = {np.sum(data["MGD#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_MGD_AMNB = NumPyArray_A_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_B_index_MGD_AMNB= NumPyArray_B_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_M_index_MGD_AMNB = NumPyArray_M_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_N_index_MGD_AMNB = NumPyArray_N_index[np.array(data["MGD(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_MGD_AMNB, 
                NumPyArray_B_index_MGD_AMNB, 
                NumPyArray_M_index_MGD_AMNB, 
                NumPyArray_N_index_MGD_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'MGD_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (3) Midpoint-Potential-Referred measurement(MPR): A,M,N,B 且 distance_MN=a, distance_AB=2(s+1)a=2sa+2a-> (distance_AB-(2*distance_MN))%(2*distance_MN)==0
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["MPR(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (2*(NumPyArray_N_index-NumPyArray_M_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["MPR#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (2*(NumPyArray_N_index-NumPyArray_M_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["MPR#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (2*(NumPyArray_M_index-NumPyArray_N_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["MPR#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (2*(NumPyArray_M_index-NumPyArray_N_index)) == 0) \
        ).astype(int)
        #--
        print(f'data["MPR(AMNB)"] count = {np.sum(data["MPR(AMNB)"]).astype(int)}')
        print(f'data["MPR#1(BMNA)"] count = {np.sum(data["MPR#1(BMNA)"]).astype(int)}')
        print(f'data["MPR#2(ANMB)"] count = {np.sum(data["MPR#2(ANMB)"]).astype(int)}')
        print(f'data["MPR#3(BNMA)"] count = {np.sum(data["MPR#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_MPR_AMNB = NumPyArray_A_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_B_index_MPR_AMNB= NumPyArray_B_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_M_index_MPR_AMNB = NumPyArray_M_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_N_index_MPR_AMNB = NumPyArray_N_index[np.array(data["MPR(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_MPR_AMNB, 
                NumPyArray_B_index_MPR_AMNB, 
                NumPyArray_M_index_MPR_AMNB, 
                NumPyArray_N_index_MPR_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'MPR_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # Gradient(GD) Array: A,M,N,B
        data["GD(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["GD#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["GD#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["GD#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) \
        ).astype(int)
        #--
        print(f'data["GD(AMNB)"] count = {np.sum(data["GD(AMNB)"]).astype(int)}')
        print(f'data["GD#1(BMNA)"] count = {np.sum(data["GD#1(BMNA)"]).astype(int)}')
        print(f'data["GD#2(ANMB)"] count = {np.sum(data["GD#2(ANMB)"]).astype(int)}')
        print(f'data["GD#3(BNMA)"] count = {np.sum(data["GD#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_GD_AMNB = NumPyArray_A_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_B_index_GD_AMNB= NumPyArray_B_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_M_index_GD_AMNB = NumPyArray_M_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_N_index_GD_AMNB = NumPyArray_N_index[np.array(data["GD(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_GD_AMNB, 
                NumPyArray_B_index_GD_AMNB, 
                NumPyArray_M_index_GD_AMNB, 
                NumPyArray_N_index_GD_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'GD_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["r"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='V/I (Ohm)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet') 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs V/I(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile08_PNG_WS_MainFileName"]}.ABMN_vs_VoverI.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('VoverI_WS 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # Current_WS 資料繪圖
        #--------------------------------------------
        print('Current_WS 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["i"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='Current (A)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet',
                vmin=0,
                vmax=NumPyArray_C_data.max()) 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs Current(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile08_PNG_WS_MainFileName"]}.ABMN_vs_Current.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('Current_WS 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # Voltage_WS 資料繪圖
        #--------------------------------------------
        print('Voltage_WS 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["i"]*data["r"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='Voltage (V)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet') 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs Voltage(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f})(abs(min)={np.abs(NumPyArray_C_data).min():.5f},abs(max)={np.abs(NumPyArray_C_data).max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile08_PNG_WS_MainFileName"]}.ABMN_vs_Voltage.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('Voltage_WS 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # SNR_WS 資料繪圖
        #--------------------------------------------
        print('SNR_WS 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["SNR"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='SNR (dB)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet',
                vmin=NumPyArray_C_data.min(),
                vmax=NumPyArray_C_data.max()) 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs SNR(min={NumPyArray_C_data.min():.2f},max={NumPyArray_C_data.max():.2f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile08_PNG_WS_MainFileName"]}.ABMN_vs_SNR.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('SNR_WS 資料繪圖...完成!')
        print('--')
        #============================================
#********************************************

#********************************************
# 輸出檔案 MGD
#--------------------------------------------
NumPyArray_urf_measurement_data_MGD = NumPyArray_urf_measurement_data[np.array(ERT_Electrode_Array_Check["MGD(AMNB)"]) == 1]
if len(NumPyArray_urf_measurement_data_MGD) > 0:  
    #--------------------------------------------
    print('輸出Urf_MGD檔案...')
    Output_Urf_FileName = temp_json_data["OutputFile09_Urf_MGD_FileName"]
    os.makedirs(os.path.dirname(Output_Urf_FileName), exist_ok=True)
    # 寫入 Urf 檔案
    try:
        with open(Output_Urf_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.geo」資訊
            f1.write(temp_geo_char_data)        
            # 檢查最後一個字元是否為換行符號 (\n)
            if not temp_geo_char_data.endswith('\n'):
                f1.write('\n')            
            for row in NumPyArray_urf_measurement_data_MGD:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以逗號分隔，最後換行
                f1.write(f"{int(row[0])},{int(row[1])},{int(row[2])},{int(row[3])},{row[4]:.5f},{row[5]:.3f},0\n") 
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Urf_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Urf_MGD檔案...結束!')
    print('--')
    print('輸出Urf_MGD_SNR檔案...')
    Output_Urf_SNR_FileName = temp_json_data["OutputFile10_Urf_MGD_SNR_FileName"]
    os.makedirs(os.path.dirname(Output_Urf_SNR_FileName), exist_ok=True)
    # 寫入 Urf 檔案
    try:
        with open(Output_Urf_SNR_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.geo」資訊
            f1.write(temp_geo_char_data)        
            # 檢查最後一個字元是否為換行符號 (\n)
            if not temp_geo_char_data.endswith('\n'):
                f1.write('\n')            
            for row in NumPyArray_urf_measurement_data_MGD:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以逗號分隔，最後換行
                f1.write(f"{int(row[0])},{int(row[1])},{int(row[2])},{int(row[3])},{row[4]:.5f},{row[5]:.3f},{row[6]:.2f}\n")            
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Urf_SNR_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Urf_MGD_SNR檔案...結束!')
    print('--')
    #--------------------------------------------
    #--------------------------------------------
    # 輸出Ohm檔案
    print('輸出Ohm_MGD檔案...')
    Output_Ohm_FileName = temp_json_data["OutputFile11_Ohm_MGD_FileName"]
    os.makedirs(os.path.dirname(Output_Ohm_FileName), exist_ok=True)
    # 寫入 Ohm 檔案
    try:
        with open(Output_Ohm_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.ohm」資訊
            f1.write(temp_ohm_char_data)        
            # 寫資料
            f1.write(f"{len(NumPyArray_urf_measurement_data_MGD)}\n")
            f1.write('#A B M N R I SNR\n')
            for row in NumPyArray_urf_measurement_data_MGD:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以空格分隔，最後換行
                f1.write(f"{int(row[0])} {int(row[1])} {int(row[2])} {int(row[3])} {row[4]:.5f} {row[5]:.3f} {row[6]:.2f}\n")     
            f1.write('#------------------------------------------------------------\n')
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Ohm_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Ohm_MGD檔案...結束!')
    print('--')
    #--------------------------------------------
    if temp_json_data["OutputFile12_PNG_MGD_Enable"] == 'Yes' :
        #--------------------------------------------
        # 讀取資料
        #--
        print("載入OHM檔案...")
        data = ert.load(Output_Ohm_FileName)
        if os.path.exists('invalid.data'):
            os.remove('invalid.data')
        print("載入OHM檔案...完成!")
        print('--')
        #--------------------------------------------
        #--------------------------------------------
        # 設定設備的最大電極數量(不含參考電極)，目前固定為64
        N_electrodes = 64 
        #--------------------------------------------
        #============================================
        # VoverI_MGD 資料繪圖
        #--------------------------------------------
        print('VoverI_MGD 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        #--
        #--------------------------------------------
        # (a)Wenner-Alpha(WA) Array: A,M,N,B 且distance_AM=distance_MN=distance_NB
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WA(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_M_index == NumPyArray_B_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["WA#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_M_index == NumPyArray_A_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["WA#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_N_index == NumPyArray_B_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["WA#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_N_index == NumPyArray_A_index-NumPyArray_M_index) \
        ).astype(int)
        #--
        print(f'data["WA(AMNB)"] count = {np.sum(data["WA(AMNB)"]).astype(int)}')
        print(f'data["WA#1(BMNA)"] count = {np.sum(data["WA#1(BMNA)"]).astype(int)}')
        print(f'data["WA#2(ANMB)"] count = {np.sum(data["WA#2(ANMB)"]).astype(int)}')
        print(f'data["WA#3(BNMA)"] count = {np.sum(data["WA#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WA_AMNB = NumPyArray_A_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_B_index_WA_AMNB = NumPyArray_B_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_M_index_WA_AMNB = NumPyArray_M_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_N_index_WA_AMNB = NumPyArray_N_index[np.array(data["WA(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WA_AMNB, 
                NumPyArray_B_index_WA_AMNB, 
                NumPyArray_M_index_WA_AMNB, 
                NumPyArray_N_index_WA_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WA_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (b)Wenner-Beta(WB) Array: B,A,M,N 且distance_BA=distance_AM=distance_MN
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WB(BAMN)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #1: A,B,M,N (電流反向, Current=-I)
        data["WB#1(ABMN)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #2: B,A,N,M (電壓反向, Voltage=-V)
        data["WB#2(BANM)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #3: A,B,N,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["WB#3(ABNM)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) \
        ).astype(int)
        #--
        print(f'data["WB(BAMN)"] count = {np.sum(data["WB(BAMN)"]).astype(int)}')
        print(f'data["WB#1(ABMN)"] count = {np.sum(data["WB#1(ABMN)"]).astype(int)}')
        print(f'data["WB#2(BANM)"] count = {np.sum(data["WB#2(BANM)"]).astype(int)}')
        print(f'data["WB#3(ABNM)"] count = {np.sum(data["WB#3(ABNM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WB_ABMN = NumPyArray_A_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_B_index_WB_ABMN = NumPyArray_B_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_M_index_WB_ABMN = NumPyArray_M_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_N_index_WB_ABMN = NumPyArray_N_index[np.array(data["WB#1(ABMN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WB_ABMN, 
                NumPyArray_B_index_WB_ABMN, 
                NumPyArray_M_index_WB_ABMN, 
                NumPyArray_N_index_WB_ABMN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WB_ABMN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (c)Wenner-Gamma(WG) Array: A,M,B,N 且distance_AM=distance_MB=distance_BN
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WG(AMBN)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_M_index == NumPyArray_N_index-NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,A,N (電流反向, Current=-I)
        data["WG#1(BMAN)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_M_index == NumPyArray_N_index-NumPyArray_A_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,B,M (電壓反向, Voltage=-V)
        data["WG#2(ANBM)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_N_index == NumPyArray_M_index-NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,A,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["WG#3(BNAM)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_N_index == NumPyArray_M_index-NumPyArray_A_index) \
        ).astype(int)
        #--
        print(f'data["WG(AMBN)"] count = {np.sum(data["WG(AMBN)"]).astype(int)}')
        print(f'data["WG#1(BMAN)"] count = {np.sum(data["WG#1(BMAN)"]).astype(int)}')
        print(f'data["WG#2(ANBM)"] count = {np.sum(data["WG#2(ANBM)"]).astype(int)}')
        print(f'data["WG#3(BNAM)"] count = {np.sum(data["WG#3(BNAM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WG_AMBN = NumPyArray_A_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_B_index_WG_AMBN = NumPyArray_B_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_M_index_WG_AMBN = NumPyArray_M_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_N_index_WG_AMBN = NumPyArray_N_index[np.array(data["WG(AMBN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WG_AMBN, 
                NumPyArray_B_index_WG_AMBN, 
                NumPyArray_M_index_WG_AMBN, 
                NumPyArray_N_index_WG_AMBN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WG_AMBN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (e)Dipole-Dipole(DD) Array: B,A,M,N 且distance_BA=distance_MN=a, distance_AM=na
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["DD(BAMN)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) & \
            ((NumPyArray_M_index-NumPyArray_A_index) % (NumPyArray_A_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: A,B,M,N (電流反向, Current=-I)
        data["DD#1(ABMN)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) & \
            ((NumPyArray_M_index-NumPyArray_B_index) % (NumPyArray_B_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: B,A,N,M (電壓反向, Voltage=-V)
        data["DD#2(BANM)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) & \
            ((NumPyArray_N_index-NumPyArray_A_index) % (NumPyArray_A_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: A,B,N,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["DD#3(ABNM)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) & \
            ((NumPyArray_N_index-NumPyArray_B_index) % (NumPyArray_B_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        #--
        print(f'data["DD(BAMN)"] count = {np.sum(data["DD(BAMN)"]).astype(int)}')
        print(f'data["DD#1(ABMN)"] count = {np.sum(data["DD#1(ABMN)"]).astype(int)}')
        print(f'data["DD#2(BANM)"] count = {np.sum(data["DD#2(BANM)"]).astype(int)}')
        print(f'data["DD#3(ABNM)"] count = {np.sum(data["DD#3(ABNM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_DD_ABMN = NumPyArray_A_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_B_index_DD_ABMN = NumPyArray_B_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_M_index_DD_ABMN = NumPyArray_M_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_N_index_DD_ABMN = NumPyArray_N_index[np.array(data["DD#1(ABMN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_DD_ABMN, 
                NumPyArray_B_index_DD_ABMN, 
                NumPyArray_M_index_DD_ABMN, 
                NumPyArray_N_index_DD_ABMN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'DD_ABMN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (g)Wenner-Schlumberger(WS) Array: A,M,N,B 且distance_MN=a, distance_AM=distance_NB=na
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WS(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_N_index) & \
            ((NumPyArray_M_index-NumPyArray_A_index) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["WS#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_N_index) & \
            ((NumPyArray_M_index-NumPyArray_B_index) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["WS#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_M_index) & \
            ((NumPyArray_N_index-NumPyArray_A_index) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["WS#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_M_index) & \
            ((NumPyArray_N_index-NumPyArray_B_index) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        #--
        print(f'data["WS(AMNB)"] count = {np.sum(data["WS(AMNB)"]).astype(int)}')
        print(f'data["WS#1(BMNA)"] count = {np.sum(data["WS#1(BMNA)"]).astype(int)}')
        print(f'data["WS#2(ANMB)"] count = {np.sum(data["WS#2(ANMB)"]).astype(int)}')
        print(f'data["WS#3(BNMA)"] count = {np.sum(data["WS#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_MGD_AMNB = NumPyArray_A_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_B_index_MGD_AMNB= NumPyArray_B_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_M_index_MGD_AMNB = NumPyArray_M_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_N_index_MGD_AMNB = NumPyArray_N_index[np.array(data["WS(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_MGD_AMNB, 
                NumPyArray_B_index_MGD_AMNB, 
                NumPyArray_M_index_MGD_AMNB, 
                NumPyArray_N_index_MGD_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WS_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (1) Gamma Array(GA): A,M,B,N 且distance_AM=distance_BN=a, distance_MB=na
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["GA(AMBN)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_B_index) & \
            ((NumPyArray_B_index-NumPyArray_M_index) % (NumPyArray_M_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,A,N (電流反向, Current=-I)
        data["GA#1(BMAN)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_A_index) & \
            ((NumPyArray_A_index-NumPyArray_M_index) % (NumPyArray_M_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,B,M (電壓反向, Voltage=-V)
        data["GA#2(ANBM)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_B_index) & \
            ((NumPyArray_B_index-NumPyArray_N_index) % (NumPyArray_N_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,A,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["GA#3(BNAM)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_A_index) & \
            ((NumPyArray_A_index-NumPyArray_N_index) % (NumPyArray_N_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        #--
        print(f'data["GA(AMBN)"] count = {np.sum(data["GA(AMBN)"]).astype(int)}')
        print(f'data["GA#1(BMAN)"] count = {np.sum(data["GA#1(BMAN)"]).astype(int)}')
        print(f'data["GA#2(ANBM)"] count = {np.sum(data["GA#2(ANBM)"]).astype(int)}')
        print(f'data["GA#3(BNAM)"] count = {np.sum(data["GA#3(BNAM)"]).astype(int)}')
        print('--')
        #--
        #--------------------------------------------

        #--------------------------------------------
        # (2) Multiple or Moving Gradient Array(MGD): A,M,N,B 且 distance_MN=a, distance_AB=(s+2)a -> (distance_AB-(2*distance_MN))%(distance_MN)==0
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["MGD(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["MGD#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["MGD#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["MGD#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        #--
        print(f'data["MGD(AMNB)"] count = {np.sum(data["MGD(AMNB)"]).astype(int)}')
        print(f'data["MGD#1(BMNA)"] count = {np.sum(data["MGD#1(BMNA)"]).astype(int)}')
        print(f'data["MGD#2(ANMB)"] count = {np.sum(data["MGD#2(ANMB)"]).astype(int)}')
        print(f'data["MGD#3(BNMA)"] count = {np.sum(data["MGD#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_MGD_AMNB = NumPyArray_A_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_B_index_MGD_AMNB= NumPyArray_B_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_M_index_MGD_AMNB = NumPyArray_M_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_N_index_MGD_AMNB = NumPyArray_N_index[np.array(data["MGD(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_MGD_AMNB, 
                NumPyArray_B_index_MGD_AMNB, 
                NumPyArray_M_index_MGD_AMNB, 
                NumPyArray_N_index_MGD_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'MGD_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (3) Midpoint-Potential-Referred measurement(MPR): A,M,N,B 且 distance_MN=a, distance_AB=2(s+1)a=2sa+2a-> (distance_AB-(2*distance_MN))%(2*distance_MN)==0
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["MPR(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (2*(NumPyArray_N_index-NumPyArray_M_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["MPR#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (2*(NumPyArray_N_index-NumPyArray_M_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["MPR#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (2*(NumPyArray_M_index-NumPyArray_N_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["MPR#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (2*(NumPyArray_M_index-NumPyArray_N_index)) == 0) \
        ).astype(int)
        #--
        print(f'data["MPR(AMNB)"] count = {np.sum(data["MPR(AMNB)"]).astype(int)}')
        print(f'data["MPR#1(BMNA)"] count = {np.sum(data["MPR#1(BMNA)"]).astype(int)}')
        print(f'data["MPR#2(ANMB)"] count = {np.sum(data["MPR#2(ANMB)"]).astype(int)}')
        print(f'data["MPR#3(BNMA)"] count = {np.sum(data["MPR#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_MPR_AMNB = NumPyArray_A_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_B_index_MPR_AMNB= NumPyArray_B_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_M_index_MPR_AMNB = NumPyArray_M_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_N_index_MPR_AMNB = NumPyArray_N_index[np.array(data["MPR(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_MPR_AMNB, 
                NumPyArray_B_index_MPR_AMNB, 
                NumPyArray_M_index_MPR_AMNB, 
                NumPyArray_N_index_MPR_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'MPR_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # Gradient(GD) Array: A,M,N,B
        data["GD(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["GD#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["GD#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["GD#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) \
        ).astype(int)
        #--
        print(f'data["GD(AMNB)"] count = {np.sum(data["GD(AMNB)"]).astype(int)}')
        print(f'data["GD#1(BMNA)"] count = {np.sum(data["GD#1(BMNA)"]).astype(int)}')
        print(f'data["GD#2(ANMB)"] count = {np.sum(data["GD#2(ANMB)"]).astype(int)}')
        print(f'data["GD#3(BNMA)"] count = {np.sum(data["GD#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_GD_AMNB = NumPyArray_A_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_B_index_GD_AMNB= NumPyArray_B_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_M_index_GD_AMNB = NumPyArray_M_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_N_index_GD_AMNB = NumPyArray_N_index[np.array(data["GD(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_GD_AMNB, 
                NumPyArray_B_index_GD_AMNB, 
                NumPyArray_M_index_GD_AMNB, 
                NumPyArray_N_index_GD_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'GD_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["r"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='V/I (Ohm)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet') 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs V/I(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile12_PNG_MGD_MainFileName"]}.ABMN_vs_VoverI.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('VoverI_MGD 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # Current_MGD 資料繪圖
        #--------------------------------------------
        print('Current_MGD 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["i"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='Current (A)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet',
                vmin=0,
                vmax=NumPyArray_C_data.max()) 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs Current(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile12_PNG_MGD_MainFileName"]}.ABMN_vs_Current.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('Current_MGD 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # Voltage_MGD 資料繪圖
        #--------------------------------------------
        print('Voltage_MGD 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["i"]*data["r"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='Voltage (V)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet') 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs Voltage(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f})(abs(min)={np.abs(NumPyArray_C_data).min():.5f},abs(max)={np.abs(NumPyArray_C_data).max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile12_PNG_MGD_MainFileName"]}.ABMN_vs_Voltage.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('Voltage_MGD 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # SNR_MGD 資料繪圖
        #--------------------------------------------
        print('SNR_MGD 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["SNR"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='SNR (dB)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet',
                vmin=NumPyArray_C_data.min(),
                vmax=NumPyArray_C_data.max()) 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs SNR(min={NumPyArray_C_data.min():.2f},max={NumPyArray_C_data.max():.2f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile12_PNG_MGD_MainFileName"]}.ABMN_vs_SNR.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('SNR_MGD 資料繪圖...完成!')
        print('--')
        #============================================
#********************************************

#********************************************
# 輸出檔案 MPR
#--------------------------------------------
NumPyArray_urf_measurement_data_MPR = NumPyArray_urf_measurement_data[np.array(ERT_Electrode_Array_Check["MPR(AMNB)"]) == 1]
if len(NumPyArray_urf_measurement_data_MPR) > 0:    
    #--------------------------------------------
    print('輸出Urf_MPR檔案...')
    Output_Urf_FileName = temp_json_data["OutputFile13_Urf_MPR_FileName"]
    os.makedirs(os.path.dirname(Output_Urf_FileName), exist_ok=True)
    # 寫入 Urf 檔案
    try:
        with open(Output_Urf_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.geo」資訊
            f1.write(temp_geo_char_data)        
            # 檢查最後一個字元是否為換行符號 (\n)
            if not temp_geo_char_data.endswith('\n'):
                f1.write('\n')            
            for row in NumPyArray_urf_measurement_data_MPR:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以逗號分隔，最後換行
                f1.write(f"{int(row[0])},{int(row[1])},{int(row[2])},{int(row[3])},{row[4]:.5f},{row[5]:.3f},0\n") 
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Urf_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Urf_MPR檔案...結束!')
    print('--')
    print('輸出Urf_MPR_SNR檔案...')
    Output_Urf_SNR_FileName = temp_json_data["OutputFile14_Urf_MPR_SNR_FileName"]
    os.makedirs(os.path.dirname(Output_Urf_SNR_FileName), exist_ok=True)
    # 寫入 Urf 檔案
    try:
        with open(Output_Urf_SNR_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.geo」資訊
            f1.write(temp_geo_char_data)        
            # 檢查最後一個字元是否為換行符號 (\n)
            if not temp_geo_char_data.endswith('\n'):
                f1.write('\n')            
            for row in NumPyArray_urf_measurement_data_MPR:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以逗號分隔，最後換行
                f1.write(f"{int(row[0])},{int(row[1])},{int(row[2])},{int(row[3])},{row[4]:.5f},{row[5]:.3f},{row[6]:.2f}\n")            
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Urf_SNR_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Urf_MPR_SNR檔案...結束!')
    print('--')
    #--------------------------------------------
    #--------------------------------------------
    # 輸出Ohm檔案
    print('輸出Ohm_MPR檔案...')
    Output_Ohm_FileName = temp_json_data["OutputFile15_Ohm_MPR_FileName"]
    os.makedirs(os.path.dirname(Output_Ohm_FileName), exist_ok=True)
    # 寫入 Ohm 檔案
    try:
        with open(Output_Ohm_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.ohm」資訊
            f1.write(temp_ohm_char_data)        
            # 寫資料
            f1.write(f"{len(NumPyArray_urf_measurement_data_MPR)}\n")
            f1.write('#A B M N R I SNR\n')
            for row in NumPyArray_urf_measurement_data_MPR:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以空格分隔，最後換行
                f1.write(f"{int(row[0])} {int(row[1])} {int(row[2])} {int(row[3])} {row[4]:.5f} {row[5]:.3f} {row[6]:.2f}\n")     
            f1.write('#------------------------------------------------------------\n')
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Ohm_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Ohm_MPR檔案...結束!')
    print('--')
    #--------------------------------------------
    if temp_json_data["OutputFile16_PNG_MPR_Enable"] == 'Yes' :
        #--------------------------------------------
        # 讀取資料
        #--
        print("載入OHM檔案...")
        data = ert.load(Output_Ohm_FileName)
        if os.path.exists('invalid.data'):
            os.remove('invalid.data')
        print("載入OHM檔案...完成!")
        print('--')
        #--------------------------------------------
        #--------------------------------------------
        # 設定設備的最大電極數量(不含參考電極)，目前固定為64
        N_electrodes = 64 
        #--------------------------------------------
        #============================================
        # VoverI_MPR 資料繪圖
        #--------------------------------------------
        print('VoverI_MPR 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        #--
        #--------------------------------------------
        # (a)Wenner-Alpha(WA) Array: A,M,N,B 且distance_AM=distance_MN=distance_NB
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WA(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_M_index == NumPyArray_B_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["WA#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_M_index == NumPyArray_A_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["WA#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_N_index == NumPyArray_B_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["WA#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_N_index == NumPyArray_A_index-NumPyArray_M_index) \
        ).astype(int)
        #--
        print(f'data["WA(AMNB)"] count = {np.sum(data["WA(AMNB)"]).astype(int)}')
        print(f'data["WA#1(BMNA)"] count = {np.sum(data["WA#1(BMNA)"]).astype(int)}')
        print(f'data["WA#2(ANMB)"] count = {np.sum(data["WA#2(ANMB)"]).astype(int)}')
        print(f'data["WA#3(BNMA)"] count = {np.sum(data["WA#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WA_AMNB = NumPyArray_A_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_B_index_WA_AMNB = NumPyArray_B_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_M_index_WA_AMNB = NumPyArray_M_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_N_index_WA_AMNB = NumPyArray_N_index[np.array(data["WA(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WA_AMNB, 
                NumPyArray_B_index_WA_AMNB, 
                NumPyArray_M_index_WA_AMNB, 
                NumPyArray_N_index_WA_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WA_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (b)Wenner-Beta(WB) Array: B,A,M,N 且distance_BA=distance_AM=distance_MN
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WB(BAMN)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #1: A,B,M,N (電流反向, Current=-I)
        data["WB#1(ABMN)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #2: B,A,N,M (電壓反向, Voltage=-V)
        data["WB#2(BANM)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #3: A,B,N,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["WB#3(ABNM)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) \
        ).astype(int)
        #--
        print(f'data["WB(BAMN)"] count = {np.sum(data["WB(BAMN)"]).astype(int)}')
        print(f'data["WB#1(ABMN)"] count = {np.sum(data["WB#1(ABMN)"]).astype(int)}')
        print(f'data["WB#2(BANM)"] count = {np.sum(data["WB#2(BANM)"]).astype(int)}')
        print(f'data["WB#3(ABNM)"] count = {np.sum(data["WB#3(ABNM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WB_ABMN = NumPyArray_A_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_B_index_WB_ABMN = NumPyArray_B_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_M_index_WB_ABMN = NumPyArray_M_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_N_index_WB_ABMN = NumPyArray_N_index[np.array(data["WB#1(ABMN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WB_ABMN, 
                NumPyArray_B_index_WB_ABMN, 
                NumPyArray_M_index_WB_ABMN, 
                NumPyArray_N_index_WB_ABMN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WB_ABMN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (c)Wenner-Gamma(WG) Array: A,M,B,N 且distance_AM=distance_MB=distance_BN
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WG(AMBN)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_M_index == NumPyArray_N_index-NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,A,N (電流反向, Current=-I)
        data["WG#1(BMAN)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_M_index == NumPyArray_N_index-NumPyArray_A_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,B,M (電壓反向, Voltage=-V)
        data["WG#2(ANBM)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_N_index == NumPyArray_M_index-NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,A,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["WG#3(BNAM)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_N_index == NumPyArray_M_index-NumPyArray_A_index) \
        ).astype(int)
        #--
        print(f'data["WG(AMBN)"] count = {np.sum(data["WG(AMBN)"]).astype(int)}')
        print(f'data["WG#1(BMAN)"] count = {np.sum(data["WG#1(BMAN)"]).astype(int)}')
        print(f'data["WG#2(ANBM)"] count = {np.sum(data["WG#2(ANBM)"]).astype(int)}')
        print(f'data["WG#3(BNAM)"] count = {np.sum(data["WG#3(BNAM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WG_AMBN = NumPyArray_A_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_B_index_WG_AMBN = NumPyArray_B_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_M_index_WG_AMBN = NumPyArray_M_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_N_index_WG_AMBN = NumPyArray_N_index[np.array(data["WG(AMBN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WG_AMBN, 
                NumPyArray_B_index_WG_AMBN, 
                NumPyArray_M_index_WG_AMBN, 
                NumPyArray_N_index_WG_AMBN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WG_AMBN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (e)Dipole-Dipole(DD) Array: B,A,M,N 且distance_BA=distance_MN=a, distance_AM=na
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["DD(BAMN)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) & \
            ((NumPyArray_M_index-NumPyArray_A_index) % (NumPyArray_A_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: A,B,M,N (電流反向, Current=-I)
        data["DD#1(ABMN)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) & \
            ((NumPyArray_M_index-NumPyArray_B_index) % (NumPyArray_B_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: B,A,N,M (電壓反向, Voltage=-V)
        data["DD#2(BANM)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) & \
            ((NumPyArray_N_index-NumPyArray_A_index) % (NumPyArray_A_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: A,B,N,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["DD#3(ABNM)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) & \
            ((NumPyArray_N_index-NumPyArray_B_index) % (NumPyArray_B_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        #--
        print(f'data["DD(BAMN)"] count = {np.sum(data["DD(BAMN)"]).astype(int)}')
        print(f'data["DD#1(ABMN)"] count = {np.sum(data["DD#1(ABMN)"]).astype(int)}')
        print(f'data["DD#2(BANM)"] count = {np.sum(data["DD#2(BANM)"]).astype(int)}')
        print(f'data["DD#3(ABNM)"] count = {np.sum(data["DD#3(ABNM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_DD_ABMN = NumPyArray_A_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_B_index_DD_ABMN = NumPyArray_B_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_M_index_DD_ABMN = NumPyArray_M_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_N_index_DD_ABMN = NumPyArray_N_index[np.array(data["DD#1(ABMN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_DD_ABMN, 
                NumPyArray_B_index_DD_ABMN, 
                NumPyArray_M_index_DD_ABMN, 
                NumPyArray_N_index_DD_ABMN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'DD_ABMN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (g)Wenner-Schlumberger(WS) Array: A,M,N,B 且distance_MN=a, distance_AM=distance_NB=na
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WS(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_N_index) & \
            ((NumPyArray_M_index-NumPyArray_A_index) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["WS#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_N_index) & \
            ((NumPyArray_M_index-NumPyArray_B_index) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["WS#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_M_index) & \
            ((NumPyArray_N_index-NumPyArray_A_index) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["WS#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_M_index) & \
            ((NumPyArray_N_index-NumPyArray_B_index) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        #--
        print(f'data["WS(AMNB)"] count = {np.sum(data["WS(AMNB)"]).astype(int)}')
        print(f'data["WS#1(BMNA)"] count = {np.sum(data["WS#1(BMNA)"]).astype(int)}')
        print(f'data["WS#2(ANMB)"] count = {np.sum(data["WS#2(ANMB)"]).astype(int)}')
        print(f'data["WS#3(BNMA)"] count = {np.sum(data["WS#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_MPR_AMNB = NumPyArray_A_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_B_index_MPR_AMNB= NumPyArray_B_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_M_index_MPR_AMNB = NumPyArray_M_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_N_index_MPR_AMNB = NumPyArray_N_index[np.array(data["WS(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_MPR_AMNB, 
                NumPyArray_B_index_MPR_AMNB, 
                NumPyArray_M_index_MPR_AMNB, 
                NumPyArray_N_index_MPR_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WS_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (1) Gamma Array(GA): A,M,B,N 且distance_AM=distance_BN=a, distance_MB=na
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["GA(AMBN)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_B_index) & \
            ((NumPyArray_B_index-NumPyArray_M_index) % (NumPyArray_M_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,A,N (電流反向, Current=-I)
        data["GA#1(BMAN)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_A_index) & \
            ((NumPyArray_A_index-NumPyArray_M_index) % (NumPyArray_M_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,B,M (電壓反向, Voltage=-V)
        data["GA#2(ANBM)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_B_index) & \
            ((NumPyArray_B_index-NumPyArray_N_index) % (NumPyArray_N_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,A,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["GA#3(BNAM)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_A_index) & \
            ((NumPyArray_A_index-NumPyArray_N_index) % (NumPyArray_N_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        #--
        print(f'data["GA(AMBN)"] count = {np.sum(data["GA(AMBN)"]).astype(int)}')
        print(f'data["GA#1(BMAN)"] count = {np.sum(data["GA#1(BMAN)"]).astype(int)}')
        print(f'data["GA#2(ANBM)"] count = {np.sum(data["GA#2(ANBM)"]).astype(int)}')
        print(f'data["GA#3(BNAM)"] count = {np.sum(data["GA#3(BNAM)"]).astype(int)}')
        print('--')
        #--
        #--------------------------------------------

        #--------------------------------------------
        # (2) Multiple or Moving Gradient Array(MGD): A,M,N,B 且 distance_MN=a, distance_AB=(s+2)a -> (distance_AB-(2*distance_MN))%(distance_MN)==0
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["MGD(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["MGD#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["MGD#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["MGD#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        #--
        print(f'data["MGD(AMNB)"] count = {np.sum(data["MGD(AMNB)"]).astype(int)}')
        print(f'data["MGD#1(BMNA)"] count = {np.sum(data["MGD#1(BMNA)"]).astype(int)}')
        print(f'data["MGD#2(ANMB)"] count = {np.sum(data["MGD#2(ANMB)"]).astype(int)}')
        print(f'data["MGD#3(BNMA)"] count = {np.sum(data["MGD#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_MPR_AMNB = NumPyArray_A_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_B_index_MPR_AMNB= NumPyArray_B_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_M_index_MPR_AMNB = NumPyArray_M_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_N_index_MPR_AMNB = NumPyArray_N_index[np.array(data["MGD(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_MPR_AMNB, 
                NumPyArray_B_index_MPR_AMNB, 
                NumPyArray_M_index_MPR_AMNB, 
                NumPyArray_N_index_MPR_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'MGD_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (3) Midpoint-Potential-Referred measurement(MPR): A,M,N,B 且 distance_MN=a, distance_AB=2(s+1)a=2sa+2a-> (distance_AB-(2*distance_MN))%(2*distance_MN)==0
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["MPR(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (2*(NumPyArray_N_index-NumPyArray_M_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["MPR#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (2*(NumPyArray_N_index-NumPyArray_M_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["MPR#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (2*(NumPyArray_M_index-NumPyArray_N_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["MPR#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (2*(NumPyArray_M_index-NumPyArray_N_index)) == 0) \
        ).astype(int)
        #--
        print(f'data["MPR(AMNB)"] count = {np.sum(data["MPR(AMNB)"]).astype(int)}')
        print(f'data["MPR#1(BMNA)"] count = {np.sum(data["MPR#1(BMNA)"]).astype(int)}')
        print(f'data["MPR#2(ANMB)"] count = {np.sum(data["MPR#2(ANMB)"]).astype(int)}')
        print(f'data["MPR#3(BNMA)"] count = {np.sum(data["MPR#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_MPR_AMNB = NumPyArray_A_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_B_index_MPR_AMNB= NumPyArray_B_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_M_index_MPR_AMNB = NumPyArray_M_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_N_index_MPR_AMNB = NumPyArray_N_index[np.array(data["MPR(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_MPR_AMNB, 
                NumPyArray_B_index_MPR_AMNB, 
                NumPyArray_M_index_MPR_AMNB, 
                NumPyArray_N_index_MPR_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'MPR_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # Gradient(GD) Array: A,M,N,B
        data["GD(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["GD#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["GD#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["GD#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) \
        ).astype(int)
        #--
        print(f'data["GD(AMNB)"] count = {np.sum(data["GD(AMNB)"]).astype(int)}')
        print(f'data["GD#1(BMNA)"] count = {np.sum(data["GD#1(BMNA)"]).astype(int)}')
        print(f'data["GD#2(ANMB)"] count = {np.sum(data["GD#2(ANMB)"]).astype(int)}')
        print(f'data["GD#3(BNMA)"] count = {np.sum(data["GD#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_GD_AMNB = NumPyArray_A_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_B_index_GD_AMNB= NumPyArray_B_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_M_index_GD_AMNB = NumPyArray_M_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_N_index_GD_AMNB = NumPyArray_N_index[np.array(data["GD(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_GD_AMNB, 
                NumPyArray_B_index_GD_AMNB, 
                NumPyArray_M_index_GD_AMNB, 
                NumPyArray_N_index_GD_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'GD_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["r"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='V/I (Ohm)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet') 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs V/I(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile16_PNG_MPR_MainFileName"]}.ABMN_vs_VoverI.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('VoverI_MPR 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # Current_MPR 資料繪圖
        #--------------------------------------------
        print('Current_MPR 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["i"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='Current (A)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet',
                vmin=0,
                vmax=NumPyArray_C_data.max()) 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs Current(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile16_PNG_MPR_MainFileName"]}.ABMN_vs_Current.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('Current_MPR 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # Voltage_MPR 資料繪圖
        #--------------------------------------------
        print('Voltage_MPR 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["i"]*data["r"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='Voltage (V)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet') 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs Voltage(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f})(abs(min)={np.abs(NumPyArray_C_data).min():.5f},abs(max)={np.abs(NumPyArray_C_data).max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile16_PNG_MPR_MainFileName"]}.ABMN_vs_Voltage.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('Voltage_MPR 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # SNR_MPR 資料繪圖
        #--------------------------------------------
        print('SNR_MPR 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["SNR"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='SNR (dB)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet',
                vmin=NumPyArray_C_data.min(),
                vmax=NumPyArray_C_data.max()) 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs SNR(min={NumPyArray_C_data.min():.2f},max={NumPyArray_C_data.max():.2f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile16_PNG_MPR_MainFileName"]}.ABMN_vs_SNR.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('SNR_MPR 資料繪圖...完成!')
        print('--')
        #============================================
#********************************************

#********************************************
# 輸出檔案 GD
#--------------------------------------------
NumPyArray_urf_measurement_data_GD = NumPyArray_urf_measurement_data[np.array(ERT_Electrode_Array_Check["GD(AMNB)"]) == 1]
if len(NumPyArray_urf_measurement_data_GD) > 0:    
    #--------------------------------------------
    print('輸出Urf_GD檔案...')
    Output_Urf_FileName = temp_json_data["OutputFile17_Urf_GD_FileName"]
    os.makedirs(os.path.dirname(Output_Urf_FileName), exist_ok=True)
    # 寫入 Urf 檔案
    try:
        with open(Output_Urf_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.geo」資訊
            f1.write(temp_geo_char_data)        
            # 檢查最後一個字元是否為換行符號 (\n)
            if not temp_geo_char_data.endswith('\n'):
                f1.write('\n')            
            for row in NumPyArray_urf_measurement_data_GD:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以逗號分隔，最後換行
                f1.write(f"{int(row[0])},{int(row[1])},{int(row[2])},{int(row[3])},{row[4]:.5f},{row[5]:.3f},0\n") 
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Urf_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Urf_GD檔案...結束!')
    print('--')
    print('輸出Urf_GD_SNR檔案...')
    Output_Urf_SNR_FileName = temp_json_data["OutputFile18_Urf_GD_SNR_FileName"]
    os.makedirs(os.path.dirname(Output_Urf_SNR_FileName), exist_ok=True)
    # 寫入 Urf 檔案
    try:
        with open(Output_Urf_SNR_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.geo」資訊
            f1.write(temp_geo_char_data)        
            # 檢查最後一個字元是否為換行符號 (\n)
            if not temp_geo_char_data.endswith('\n'):
                f1.write('\n')            
            for row in NumPyArray_urf_measurement_data_GD:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以逗號分隔，最後換行
                f1.write(f"{int(row[0])},{int(row[1])},{int(row[2])},{int(row[3])},{row[4]:.5f},{row[5]:.3f},{row[6]:.2f}\n")            
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Urf_SNR_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Urf_GD_SNR檔案...結束!')
    print('--')
    #--------------------------------------------
    #--------------------------------------------
    # 輸出Ohm檔案
    print('輸出Ohm_GD檔案...')
    Output_Ohm_FileName = temp_json_data["OutputFile19_Ohm_GD_FileName"]
    os.makedirs(os.path.dirname(Output_Ohm_FileName), exist_ok=True)
    # 寫入 Ohm 檔案
    try:
        with open(Output_Ohm_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.ohm」資訊
            f1.write(temp_ohm_char_data)        
            # 寫資料
            f1.write(f"{len(NumPyArray_urf_measurement_data_GD)}\n")
            f1.write('#A B M N R I SNR\n')
            for row in NumPyArray_urf_measurement_data_GD:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以空格分隔，最後換行
                f1.write(f"{int(row[0])} {int(row[1])} {int(row[2])} {int(row[3])} {row[4]:.5f} {row[5]:.3f} {row[6]:.2f}\n")     
            f1.write('#------------------------------------------------------------\n')
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Ohm_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Ohm_GD檔案...結束!')
    print('--')
    #--------------------------------------------
    if temp_json_data["OutputFile20_PNG_GD_Enable"] == 'Yes' :
        #--------------------------------------------
        # 讀取資料
        #--
        print("載入OHM檔案...")
        data = ert.load(Output_Ohm_FileName)
        if os.path.exists('invalid.data'):
            os.remove('invalid.data')
        print("載入OHM檔案...完成!")
        print('--')
        #--------------------------------------------
        #--------------------------------------------
        # 設定設備的最大電極數量(不含參考電極)，目前固定為64
        N_electrodes = 64 
        #--------------------------------------------
        #============================================
        # VoverI_GD 資料繪圖
        #--------------------------------------------
        print('VoverI_GD 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        #--
        #--------------------------------------------
        # (a)Wenner-Alpha(WA) Array: A,M,N,B 且distance_AM=distance_MN=distance_NB
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WA(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_M_index == NumPyArray_B_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["WA#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_M_index == NumPyArray_A_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["WA#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_N_index == NumPyArray_B_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["WA#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_N_index == NumPyArray_A_index-NumPyArray_M_index) \
        ).astype(int)
        #--
        print(f'data["WA(AMNB)"] count = {np.sum(data["WA(AMNB)"]).astype(int)}')
        print(f'data["WA#1(BMNA)"] count = {np.sum(data["WA#1(BMNA)"]).astype(int)}')
        print(f'data["WA#2(ANMB)"] count = {np.sum(data["WA#2(ANMB)"]).astype(int)}')
        print(f'data["WA#3(BNMA)"] count = {np.sum(data["WA#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WA_AMNB = NumPyArray_A_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_B_index_WA_AMNB = NumPyArray_B_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_M_index_WA_AMNB = NumPyArray_M_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_N_index_WA_AMNB = NumPyArray_N_index[np.array(data["WA(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WA_AMNB, 
                NumPyArray_B_index_WA_AMNB, 
                NumPyArray_M_index_WA_AMNB, 
                NumPyArray_N_index_WA_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WA_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (b)Wenner-Beta(WB) Array: B,A,M,N 且distance_BA=distance_AM=distance_MN
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WB(BAMN)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #1: A,B,M,N (電流反向, Current=-I)
        data["WB#1(ABMN)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #2: B,A,N,M (電壓反向, Voltage=-V)
        data["WB#2(BANM)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #3: A,B,N,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["WB#3(ABNM)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) \
        ).astype(int)
        #--
        print(f'data["WB(BAMN)"] count = {np.sum(data["WB(BAMN)"]).astype(int)}')
        print(f'data["WB#1(ABMN)"] count = {np.sum(data["WB#1(ABMN)"]).astype(int)}')
        print(f'data["WB#2(BANM)"] count = {np.sum(data["WB#2(BANM)"]).astype(int)}')
        print(f'data["WB#3(ABNM)"] count = {np.sum(data["WB#3(ABNM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WB_ABMN = NumPyArray_A_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_B_index_WB_ABMN = NumPyArray_B_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_M_index_WB_ABMN = NumPyArray_M_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_N_index_WB_ABMN = NumPyArray_N_index[np.array(data["WB#1(ABMN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WB_ABMN, 
                NumPyArray_B_index_WB_ABMN, 
                NumPyArray_M_index_WB_ABMN, 
                NumPyArray_N_index_WB_ABMN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WB_ABMN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (c)Wenner-Gamma(WG) Array: A,M,B,N 且distance_AM=distance_MB=distance_BN
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WG(AMBN)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_M_index == NumPyArray_N_index-NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,A,N (電流反向, Current=-I)
        data["WG#1(BMAN)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_M_index == NumPyArray_N_index-NumPyArray_A_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,B,M (電壓反向, Voltage=-V)
        data["WG#2(ANBM)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_N_index == NumPyArray_M_index-NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,A,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["WG#3(BNAM)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_N_index == NumPyArray_M_index-NumPyArray_A_index) \
        ).astype(int)
        #--
        print(f'data["WG(AMBN)"] count = {np.sum(data["WG(AMBN)"]).astype(int)}')
        print(f'data["WG#1(BMAN)"] count = {np.sum(data["WG#1(BMAN)"]).astype(int)}')
        print(f'data["WG#2(ANBM)"] count = {np.sum(data["WG#2(ANBM)"]).astype(int)}')
        print(f'data["WG#3(BNAM)"] count = {np.sum(data["WG#3(BNAM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WG_AMBN = NumPyArray_A_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_B_index_WG_AMBN = NumPyArray_B_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_M_index_WG_AMBN = NumPyArray_M_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_N_index_WG_AMBN = NumPyArray_N_index[np.array(data["WG(AMBN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WG_AMBN, 
                NumPyArray_B_index_WG_AMBN, 
                NumPyArray_M_index_WG_AMBN, 
                NumPyArray_N_index_WG_AMBN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WG_AMBN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (e)Dipole-Dipole(DD) Array: B,A,M,N 且distance_BA=distance_MN=a, distance_AM=na
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["DD(BAMN)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) & \
            ((NumPyArray_M_index-NumPyArray_A_index) % (NumPyArray_A_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: A,B,M,N (電流反向, Current=-I)
        data["DD#1(ABMN)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) & \
            ((NumPyArray_M_index-NumPyArray_B_index) % (NumPyArray_B_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: B,A,N,M (電壓反向, Voltage=-V)
        data["DD#2(BANM)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) & \
            ((NumPyArray_N_index-NumPyArray_A_index) % (NumPyArray_A_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: A,B,N,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["DD#3(ABNM)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) & \
            ((NumPyArray_N_index-NumPyArray_B_index) % (NumPyArray_B_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        #--
        print(f'data["DD(BAMN)"] count = {np.sum(data["DD(BAMN)"]).astype(int)}')
        print(f'data["DD#1(ABMN)"] count = {np.sum(data["DD#1(ABMN)"]).astype(int)}')
        print(f'data["DD#2(BANM)"] count = {np.sum(data["DD#2(BANM)"]).astype(int)}')
        print(f'data["DD#3(ABNM)"] count = {np.sum(data["DD#3(ABNM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_DD_ABMN = NumPyArray_A_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_B_index_DD_ABMN = NumPyArray_B_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_M_index_DD_ABMN = NumPyArray_M_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_N_index_DD_ABMN = NumPyArray_N_index[np.array(data["DD#1(ABMN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_DD_ABMN, 
                NumPyArray_B_index_DD_ABMN, 
                NumPyArray_M_index_DD_ABMN, 
                NumPyArray_N_index_DD_ABMN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'DD_ABMN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (g)Wenner-Schlumberger(WS) Array: A,M,N,B 且distance_MN=a, distance_AM=distance_NB=na
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WS(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_N_index) & \
            ((NumPyArray_M_index-NumPyArray_A_index) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["WS#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_N_index) & \
            ((NumPyArray_M_index-NumPyArray_B_index) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["WS#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_M_index) & \
            ((NumPyArray_N_index-NumPyArray_A_index) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["WS#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_M_index) & \
            ((NumPyArray_N_index-NumPyArray_B_index) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        #--
        print(f'data["WS(AMNB)"] count = {np.sum(data["WS(AMNB)"]).astype(int)}')
        print(f'data["WS#1(BMNA)"] count = {np.sum(data["WS#1(BMNA)"]).astype(int)}')
        print(f'data["WS#2(ANMB)"] count = {np.sum(data["WS#2(ANMB)"]).astype(int)}')
        print(f'data["WS#3(BNMA)"] count = {np.sum(data["WS#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_GD_AMNB = NumPyArray_A_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_B_index_GD_AMNB= NumPyArray_B_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_M_index_GD_AMNB = NumPyArray_M_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_N_index_GD_AMNB = NumPyArray_N_index[np.array(data["WS(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_GD_AMNB, 
                NumPyArray_B_index_GD_AMNB, 
                NumPyArray_M_index_GD_AMNB, 
                NumPyArray_N_index_GD_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WS_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (1) Gamma Array(GA): A,M,B,N 且distance_AM=distance_BN=a, distance_MB=na
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["GA(AMBN)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_B_index) & \
            ((NumPyArray_B_index-NumPyArray_M_index) % (NumPyArray_M_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,A,N (電流反向, Current=-I)
        data["GA#1(BMAN)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_A_index) & \
            ((NumPyArray_A_index-NumPyArray_M_index) % (NumPyArray_M_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,B,M (電壓反向, Voltage=-V)
        data["GA#2(ANBM)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_B_index) & \
            ((NumPyArray_B_index-NumPyArray_N_index) % (NumPyArray_N_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,A,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["GA#3(BNAM)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_A_index) & \
            ((NumPyArray_A_index-NumPyArray_N_index) % (NumPyArray_N_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        #--
        print(f'data["GA(AMBN)"] count = {np.sum(data["GA(AMBN)"]).astype(int)}')
        print(f'data["GA#1(BMAN)"] count = {np.sum(data["GA#1(BMAN)"]).astype(int)}')
        print(f'data["GA#2(ANBM)"] count = {np.sum(data["GA#2(ANBM)"]).astype(int)}')
        print(f'data["GA#3(BNAM)"] count = {np.sum(data["GA#3(BNAM)"]).astype(int)}')
        print('--')
        #--
        #--------------------------------------------

        #--------------------------------------------
        # (2) Multiple or Moving Gradient Array(MGD): A,M,N,B 且 distance_MN=a, distance_AB=(s+2)a -> (distance_AB-(2*distance_MN))%(distance_MN)==0
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["MGD(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["MGD#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["MGD#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["MGD#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        #--
        print(f'data["MGD(AMNB)"] count = {np.sum(data["MGD(AMNB)"]).astype(int)}')
        print(f'data["MGD#1(BMNA)"] count = {np.sum(data["MGD#1(BMNA)"]).astype(int)}')
        print(f'data["MGD#2(ANMB)"] count = {np.sum(data["MGD#2(ANMB)"]).astype(int)}')
        print(f'data["MGD#3(BNMA)"] count = {np.sum(data["MGD#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_GD_AMNB = NumPyArray_A_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_B_index_GD_AMNB= NumPyArray_B_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_M_index_GD_AMNB = NumPyArray_M_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_N_index_GD_AMNB = NumPyArray_N_index[np.array(data["MGD(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_GD_AMNB, 
                NumPyArray_B_index_GD_AMNB, 
                NumPyArray_M_index_GD_AMNB, 
                NumPyArray_N_index_GD_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'MGD_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (3) Midpoint-Potential-Referred measurement(MPR): A,M,N,B 且 distance_MN=a, distance_AB=2(s+1)a=2sa+2a-> (distance_AB-(2*distance_MN))%(2*distance_MN)==0
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["MPR(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (2*(NumPyArray_N_index-NumPyArray_M_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["MPR#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (2*(NumPyArray_N_index-NumPyArray_M_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["MPR#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (2*(NumPyArray_M_index-NumPyArray_N_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["MPR#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (2*(NumPyArray_M_index-NumPyArray_N_index)) == 0) \
        ).astype(int)
        #--
        print(f'data["MPR(AMNB)"] count = {np.sum(data["MPR(AMNB)"]).astype(int)}')
        print(f'data["MPR#1(BMNA)"] count = {np.sum(data["MPR#1(BMNA)"]).astype(int)}')
        print(f'data["MPR#2(ANMB)"] count = {np.sum(data["MPR#2(ANMB)"]).astype(int)}')
        print(f'data["MPR#3(BNMA)"] count = {np.sum(data["MPR#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_GD_AMNB = NumPyArray_A_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_B_index_GD_AMNB= NumPyArray_B_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_M_index_GD_AMNB = NumPyArray_M_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_N_index_GD_AMNB = NumPyArray_N_index[np.array(data["MPR(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_GD_AMNB, 
                NumPyArray_B_index_GD_AMNB, 
                NumPyArray_M_index_GD_AMNB, 
                NumPyArray_N_index_GD_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'MPR_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # Gradient(GD) Array: A,M,N,B
        data["GD(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["GD#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["GD#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["GD#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) \
        ).astype(int)
        #--
        print(f'data["GD(AMNB)"] count = {np.sum(data["GD(AMNB)"]).astype(int)}')
        print(f'data["GD#1(BMNA)"] count = {np.sum(data["GD#1(BMNA)"]).astype(int)}')
        print(f'data["GD#2(ANMB)"] count = {np.sum(data["GD#2(ANMB)"]).astype(int)}')
        print(f'data["GD#3(BNMA)"] count = {np.sum(data["GD#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_GD_AMNB = NumPyArray_A_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_B_index_GD_AMNB= NumPyArray_B_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_M_index_GD_AMNB = NumPyArray_M_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_N_index_GD_AMNB = NumPyArray_N_index[np.array(data["GD(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_GD_AMNB, 
                NumPyArray_B_index_GD_AMNB, 
                NumPyArray_M_index_GD_AMNB, 
                NumPyArray_N_index_GD_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'GD_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["r"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='V/I (Ohm)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet') 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs V/I(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile20_PNG_GD_MainFileName"]}.ABMN_vs_VoverI.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('VoverI_GD 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # Current_GD 資料繪圖
        #--------------------------------------------
        print('Current_GD 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["i"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='Current (A)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet',
                vmin=0,
                vmax=NumPyArray_C_data.max()) 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs Current(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile20_PNG_GD_MainFileName"]}.ABMN_vs_Current.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('Current_GD 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # Voltage_GD 資料繪圖
        #--------------------------------------------
        print('Voltage_GD 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["i"]*data["r"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='Voltage (V)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet') 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs Voltage(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f})(abs(min)={np.abs(NumPyArray_C_data).min():.5f},abs(max)={np.abs(NumPyArray_C_data).max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile20_PNG_GD_MainFileName"]}.ABMN_vs_Voltage.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('Voltage_GD 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # SNR_GD 資料繪圖
        #--------------------------------------------
        print('SNR_GD 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["SNR"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='SNR (dB)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet',
                vmin=NumPyArray_C_data.min(),
                vmax=NumPyArray_C_data.max()) 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs SNR(min={NumPyArray_C_data.min():.2f},max={NumPyArray_C_data.max():.2f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile20_PNG_GD_MainFileName"]}.ABMN_vs_SNR.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('SNR_GD 資料繪圖...完成!')
        print('--')
        #============================================
#********************************************

#********************************************
# 輸出檔案 Select
#--------------------------------------------
if temp_json_data["Select_From"] == 'All':
    NumPyArray_urf_measurement_data_Select = NumPyArray_urf_measurement_data.copy()
elif temp_json_data["Select_From"] == 'WS':
    NumPyArray_urf_measurement_data_Select = NumPyArray_urf_measurement_data_WS.copy()
elif temp_json_data["Select_From"] == 'MGD':
    NumPyArray_urf_measurement_data_Select = NumPyArray_urf_measurement_data_MGD.copy()
elif temp_json_data["Select_From"] == 'MPR':
    NumPyArray_urf_measurement_data_Select = NumPyArray_urf_measurement_data_MPR.copy()
elif temp_json_data["Select_From"] == 'GD':
    NumPyArray_urf_measurement_data_Select = NumPyArray_urf_measurement_data_GD.copy()
else:
    NumPyArray_urf_measurement_data_Select = NumPyArray_urf_measurement_data.copy()
#--------------------------------------------
# 依照單獨A、B、M、N進行初步篩選
#--
# 取出 1based 索引的電極編號，是numpy.ndarray
NumPyArray_A_index = np.array(NumPyArray_urf_measurement_data_Select[:,0]) 
NumPyArray_B_index = np.array(NumPyArray_urf_measurement_data_Select[:,1]) 
NumPyArray_M_index = np.array(NumPyArray_urf_measurement_data_Select[:,2]) 
NumPyArray_N_index = np.array(NumPyArray_urf_measurement_data_Select[:,3]) 
NumPyArray_Select_Keep_A_index = np.array(temp_json_data["Select_Keep_A_index"])
mask_Select_Keep_A_index = (np.isin(NumPyArray_A_index, NumPyArray_Select_Keep_A_index))
NumPyArray_Select_Keep_B_index = np.array(temp_json_data["Select_Keep_B_index"])
mask_Select_Keep_B_index = (np.isin(NumPyArray_B_index, NumPyArray_Select_Keep_B_index))
NumPyArray_Select_Keep_M_index = np.array(temp_json_data["Select_Keep_M_index"])
mask_Select_Keep_M_index = (np.isin(NumPyArray_M_index, NumPyArray_Select_Keep_M_index))
NumPyArray_Select_Keep_N_index = np.array(temp_json_data["Select_Keep_N_index"])
mask_Select_Keep_N_index = (np.isin(NumPyArray_N_index, NumPyArray_Select_Keep_N_index))
mask_Select_Keep_ABMN_index = mask_Select_Keep_A_index & mask_Select_Keep_B_index & mask_Select_Keep_M_index & mask_Select_Keep_N_index
#--
NumPyArray_urf_measurement_data_Select = NumPyArray_urf_measurement_data_Select[mask_Select_Keep_ABMN_index]
#--
# 依照單獨A、B、M、N進行初步篩選...完成!
#--------------------------------------------
#--------------------------------------------
# 依照指定ABMN清單進行進一步篩選
if temp_json_data["Select_Keep_ABMN_Enable"] == 'Yes':    
    #--
    NumPyArray_ABMN_combo = NumPyArray_urf_measurement_data_Select[:, :4].astype(int).copy()
    Keep_ABMN_Matrix_int = Keep_ABMN_Matrix[:, :4].astype(int).copy()
    # 準備set
    Keep_ABMN_set = set(map(tuple, Keep_ABMN_Matrix_int))
    # 將當前數據的 ABMN 組合轉換為元組列表
    NumPyArray_ABMN_combo_tuples = list(map(tuple, NumPyArray_ABMN_combo))
    # 逐行比較，生成遮罩
    mask_Select_Keep_ABMN_combo = np.array([
        combo_tuple in Keep_ABMN_set 
        for combo_tuple in NumPyArray_ABMN_combo_tuples
    ])
    # 應用遮罩進行篩選
    NumPyArray_urf_measurement_data_Select = NumPyArray_urf_measurement_data_Select[mask_Select_Keep_ABMN_combo]
    #--
# 依照指定ABMN清單進行進一步篩選...完成!
#--------------------------------------------
if len(NumPyArray_urf_measurement_data_Select) > 0:    
    #--------------------------------------------
    print('輸出Urf_Select檔案...')
    Output_Urf_FileName = temp_json_data["OutputFile21_Urf_Select_FileName"]
    os.makedirs(os.path.dirname(Output_Urf_FileName), exist_ok=True)
    # 寫入 Urf 檔案
    try:
        with open(Output_Urf_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.geo」資訊
            f1.write(temp_geo_char_data)        
            # 檢查最後一個字元是否為換行符號 (\n)
            if not temp_geo_char_data.endswith('\n'):
                f1.write('\n')            
            for row in NumPyArray_urf_measurement_data_Select:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以逗號分隔，最後換行
                f1.write(f"{int(row[0])},{int(row[1])},{int(row[2])},{int(row[3])},{row[4]:.5f},{row[5]:.3f},0\n") 
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Urf_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Urf_Select檔案...結束!')
    print('--')
    print('輸出Urf_Select_SNR檔案...')
    Output_Urf_SNR_FileName = temp_json_data["OutputFile22_Urf_Select_SNR_FileName"]
    os.makedirs(os.path.dirname(Output_Urf_SNR_FileName), exist_ok=True)
    # 寫入 Urf 檔案
    try:
        with open(Output_Urf_SNR_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.geo」資訊
            f1.write(temp_geo_char_data)        
            # 檢查最後一個字元是否為換行符號 (\n)
            if not temp_geo_char_data.endswith('\n'):
                f1.write('\n')            
            for row in NumPyArray_urf_measurement_data_Select:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以逗號分隔，最後換行
                f1.write(f"{int(row[0])},{int(row[1])},{int(row[2])},{int(row[3])},{row[4]:.5f},{row[5]:.3f},{row[6]:.2f}\n")            
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Urf_SNR_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Urf_Select_SNR檔案...結束!')
    print('--')
    #--------------------------------------------
    #--------------------------------------------
    # 輸出Ohm檔案
    print('輸出Ohm_Select檔案...')
    Output_Ohm_FileName = temp_json_data["OutputFile23_Ohm_Select_FileName"]
    os.makedirs(os.path.dirname(Output_Ohm_FileName), exist_ok=True)
    # 寫入 Ohm 檔案
    try:
        with open(Output_Ohm_FileName, 'w', encoding='utf-8') as f1:
            # 寫「*.ohm」資訊
            f1.write(temp_ohm_char_data)        
            # 寫資料
            f1.write(f"{len(NumPyArray_urf_measurement_data_Select)}\n")
            f1.write('#A B M N R I SNR\n')
            for row in NumPyArray_urf_measurement_data_Select:
                # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以空格分隔，最後換行
                f1.write(f"{int(row[0])} {int(row[1])} {int(row[2])} {int(row[3])} {row[4]:.5f} {row[5]:.3f} {row[6]:.2f}\n")     
            f1.write('#------------------------------------------------------------\n')
    except IOError as e:
        print(f'開啟檔案失敗! return! 檔案名稱: {Output_Ohm_FileName}.')
        print(f'錯誤: {e}')
        exit(1) # 回傳1表示一般性錯誤
    print('輸出Ohm_Select檔案...結束!')
    print('--')
    #--------------------------------------------
    if temp_json_data["OutputFile24_PNG_Select_Enable"] == 'Yes' :
        #--------------------------------------------
        # 讀取資料
        #--
        print("載入OHM檔案...")
        data = ert.load(Output_Ohm_FileName)
        if os.path.exists('invalid.data'):
            os.remove('invalid.data')
        print("載入OHM檔案...完成!")
        print('--')
        #--------------------------------------------
        #--------------------------------------------
        # 設定設備的最大電極數量(不含參考電極)，目前固定為64
        N_electrodes = 64 
        #--------------------------------------------
        #============================================
        # VoverI_Select 資料繪圖
        #--------------------------------------------
        print('VoverI_Select 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        #--
        #--------------------------------------------
        # (a)Wenner-Alpha(WA) Array: A,M,N,B 且distance_AM=distance_MN=distance_NB
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WA(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_M_index == NumPyArray_B_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["WA#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_M_index == NumPyArray_A_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["WA#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_N_index == NumPyArray_B_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["WA#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_N_index == NumPyArray_A_index-NumPyArray_M_index) \
        ).astype(int)
        #--
        print(f'data["WA(AMNB)"] count = {np.sum(data["WA(AMNB)"]).astype(int)}')
        print(f'data["WA#1(BMNA)"] count = {np.sum(data["WA#1(BMNA)"]).astype(int)}')
        print(f'data["WA#2(ANMB)"] count = {np.sum(data["WA#2(ANMB)"]).astype(int)}')
        print(f'data["WA#3(BNMA)"] count = {np.sum(data["WA#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WA_AMNB = NumPyArray_A_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_B_index_WA_AMNB = NumPyArray_B_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_M_index_WA_AMNB = NumPyArray_M_index[np.array(data["WA(AMNB)"]) == 1]
        NumPyArray_N_index_WA_AMNB = NumPyArray_N_index[np.array(data["WA(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WA_AMNB, 
                NumPyArray_B_index_WA_AMNB, 
                NumPyArray_M_index_WA_AMNB, 
                NumPyArray_N_index_WA_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WA_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (b)Wenner-Beta(WB) Array: B,A,M,N 且distance_BA=distance_AM=distance_MN
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WB(BAMN)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #1: A,B,M,N (電流反向, Current=-I)
        data["WB#1(ABMN)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) \
        ).astype(int)
        # 考慮置換情形 #2: B,A,N,M (電壓反向, Voltage=-V)
        data["WB#2(BANM)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) \
        ).astype(int)
        # 考慮置換情形 #3: A,B,N,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["WB#3(ABNM)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) \
        ).astype(int)
        #--
        print(f'data["WB(BAMN)"] count = {np.sum(data["WB(BAMN)"]).astype(int)}')
        print(f'data["WB#1(ABMN)"] count = {np.sum(data["WB#1(ABMN)"]).astype(int)}')
        print(f'data["WB#2(BANM)"] count = {np.sum(data["WB#2(BANM)"]).astype(int)}')
        print(f'data["WB#3(ABNM)"] count = {np.sum(data["WB#3(ABNM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WB_ABMN = NumPyArray_A_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_B_index_WB_ABMN = NumPyArray_B_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_M_index_WB_ABMN = NumPyArray_M_index[np.array(data["WB#1(ABMN)"]) == 1]
        NumPyArray_N_index_WB_ABMN = NumPyArray_N_index[np.array(data["WB#1(ABMN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WB_ABMN, 
                NumPyArray_B_index_WB_ABMN, 
                NumPyArray_M_index_WB_ABMN, 
                NumPyArray_N_index_WB_ABMN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WB_ABMN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (c)Wenner-Gamma(WG) Array: A,M,B,N 且distance_AM=distance_MB=distance_BN
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WG(AMBN)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_M_index == NumPyArray_N_index-NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,A,N (電流反向, Current=-I)
        data["WG#1(BMAN)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_M_index == NumPyArray_N_index-NumPyArray_A_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,B,M (電壓反向, Voltage=-V)
        data["WG#2(ANBM)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_N_index == NumPyArray_M_index-NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,A,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["WG#3(BNAM)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_N_index == NumPyArray_M_index-NumPyArray_A_index) \
        ).astype(int)
        #--
        print(f'data["WG(AMBN)"] count = {np.sum(data["WG(AMBN)"]).astype(int)}')
        print(f'data["WG#1(BMAN)"] count = {np.sum(data["WG#1(BMAN)"]).astype(int)}')
        print(f'data["WG#2(ANBM)"] count = {np.sum(data["WG#2(ANBM)"]).astype(int)}')
        print(f'data["WG#3(BNAM)"] count = {np.sum(data["WG#3(BNAM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_WG_AMBN = NumPyArray_A_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_B_index_WG_AMBN = NumPyArray_B_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_M_index_WG_AMBN = NumPyArray_M_index[np.array(data["WG(AMBN)"]) == 1]
        NumPyArray_N_index_WG_AMBN = NumPyArray_N_index[np.array(data["WG(AMBN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_WG_AMBN, 
                NumPyArray_B_index_WG_AMBN, 
                NumPyArray_M_index_WG_AMBN, 
                NumPyArray_N_index_WG_AMBN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WG_AMBN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (e)Dipole-Dipole(DD) Array: B,A,M,N 且distance_BA=distance_MN=a, distance_AM=na
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["DD(BAMN)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_M_index) & \
            ((NumPyArray_M_index-NumPyArray_A_index) % (NumPyArray_A_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: A,B,M,N (電流反向, Current=-I)
        data["DD#1(ABMN)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_M_index) & \
            ((NumPyArray_M_index-NumPyArray_B_index) % (NumPyArray_B_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: B,A,N,M (電壓反向, Voltage=-V)
        data["DD#2(BANM)"] = ( \
            (NumPyArray_B_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_A_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_N_index) & \
            ((NumPyArray_N_index-NumPyArray_A_index) % (NumPyArray_A_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: A,B,N,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["DD#3(ABNM)"] = ( \
            (NumPyArray_A_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_B_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_N_index) & \
            ((NumPyArray_N_index-NumPyArray_B_index) % (NumPyArray_B_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        #--
        print(f'data["DD(BAMN)"] count = {np.sum(data["DD(BAMN)"]).astype(int)}')
        print(f'data["DD#1(ABMN)"] count = {np.sum(data["DD#1(ABMN)"]).astype(int)}')
        print(f'data["DD#2(BANM)"] count = {np.sum(data["DD#2(BANM)"]).astype(int)}')
        print(f'data["DD#3(ABNM)"] count = {np.sum(data["DD#3(ABNM)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_DD_ABMN = NumPyArray_A_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_B_index_DD_ABMN = NumPyArray_B_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_M_index_DD_ABMN = NumPyArray_M_index[np.array(data["DD#1(ABMN)"]) == 1]
        NumPyArray_N_index_DD_ABMN = NumPyArray_N_index[np.array(data["DD#1(ABMN)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_DD_ABMN, 
                NumPyArray_B_index_DD_ABMN, 
                NumPyArray_M_index_DD_ABMN, 
                NumPyArray_N_index_DD_ABMN
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'DD_ABMN[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--------------------------------------------
        # (g)Wenner-Schlumberger(WS) Array: A,M,N,B 且distance_MN=a, distance_AM=distance_NB=na
        # REF: Loke, M. H. (2004). Tutorial: 2-D and 3-D electrical imaging surveys. Figure 1.4
        data["WS(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_N_index) & \
            ((NumPyArray_M_index-NumPyArray_A_index) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["WS#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_N_index) & \
            ((NumPyArray_M_index-NumPyArray_B_index) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["WS#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_B_index-NumPyArray_M_index) & \
            ((NumPyArray_N_index-NumPyArray_A_index) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["WS#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_A_index-NumPyArray_M_index) & \
            ((NumPyArray_N_index-NumPyArray_B_index) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        #--
        print(f'data["WS(AMNB)"] count = {np.sum(data["WS(AMNB)"]).astype(int)}')
        print(f'data["WS#1(BMNA)"] count = {np.sum(data["WS#1(BMNA)"]).astype(int)}')
        print(f'data["WS#2(ANMB)"] count = {np.sum(data["WS#2(ANMB)"]).astype(int)}')
        print(f'data["WS#3(BNMA)"] count = {np.sum(data["WS#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_Select_AMNB = NumPyArray_A_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_B_index_Select_AMNB= NumPyArray_B_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_M_index_Select_AMNB = NumPyArray_M_index[np.array(data["WS(AMNB)"]) == 1]
        NumPyArray_N_index_Select_AMNB = NumPyArray_N_index[np.array(data["WS(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_Select_AMNB, 
                NumPyArray_B_index_Select_AMNB, 
                NumPyArray_M_index_Select_AMNB, 
                NumPyArray_N_index_Select_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'WS_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (1) Gamma Array(GA): A,M,B,N 且distance_AM=distance_BN=a, distance_MB=na
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["GA(AMBN)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_A_index == NumPyArray_N_index-NumPyArray_B_index) & \
            ((NumPyArray_B_index-NumPyArray_M_index) % (NumPyArray_M_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,A,N (電流反向, Current=-I)
        data["GA#1(BMAN)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_M_index-NumPyArray_B_index == NumPyArray_N_index-NumPyArray_A_index) & \
            ((NumPyArray_A_index-NumPyArray_M_index) % (NumPyArray_M_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,B,M (電壓反向, Voltage=-V)
        data["GA#2(ANBM)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_A_index == NumPyArray_M_index-NumPyArray_B_index) & \
            ((NumPyArray_B_index-NumPyArray_N_index) % (NumPyArray_N_index-NumPyArray_A_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,A,M (電流/電壓反向, Current=-I, Voltage=-V)
        data["GA#3(BNAM)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_N_index-NumPyArray_B_index == NumPyArray_M_index-NumPyArray_A_index) & \
            ((NumPyArray_A_index-NumPyArray_N_index) % (NumPyArray_N_index-NumPyArray_B_index) == 0) \
        ).astype(int)
        #--
        print(f'data["GA(AMBN)"] count = {np.sum(data["GA(AMBN)"]).astype(int)}')
        print(f'data["GA#1(BMAN)"] count = {np.sum(data["GA#1(BMAN)"]).astype(int)}')
        print(f'data["GA#2(ANBM)"] count = {np.sum(data["GA#2(ANBM)"]).astype(int)}')
        print(f'data["GA#3(BNAM)"] count = {np.sum(data["GA#3(BNAM)"]).astype(int)}')
        print('--')
        #--
        #--------------------------------------------

        #--------------------------------------------
        # (2) Multiple or Moving Gradient Array(MGD): A,M,N,B 且 distance_MN=a, distance_AB=(s+2)a -> (distance_AB-(2*distance_MN))%(distance_MN)==0
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["MGD(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["MGD#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (NumPyArray_N_index-NumPyArray_M_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["MGD#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["MGD#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (NumPyArray_M_index-NumPyArray_N_index) == 0) \
        ).astype(int)
        #--
        print(f'data["MGD(AMNB)"] count = {np.sum(data["MGD(AMNB)"]).astype(int)}')
        print(f'data["MGD#1(BMNA)"] count = {np.sum(data["MGD#1(BMNA)"]).astype(int)}')
        print(f'data["MGD#2(ANMB)"] count = {np.sum(data["MGD#2(ANMB)"]).astype(int)}')
        print(f'data["MGD#3(BNMA)"] count = {np.sum(data["MGD#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_Select_AMNB = NumPyArray_A_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_B_index_Select_AMNB= NumPyArray_B_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_M_index_Select_AMNB = NumPyArray_M_index[np.array(data["MGD(AMNB)"]) == 1]
        NumPyArray_N_index_Select_AMNB = NumPyArray_N_index[np.array(data["MGD(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_Select_AMNB, 
                NumPyArray_B_index_Select_AMNB, 
                NumPyArray_M_index_Select_AMNB, 
                NumPyArray_N_index_Select_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'MGD_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # (3) Midpoint-Potential-Referred measurement(MPR): A,M,N,B 且 distance_MN=a, distance_AB=2(s+1)a=2sa+2a-> (distance_AB-(2*distance_MN))%(2*distance_MN)==0
        # REF: Dahlin, T., & Zhou, B. (2004). A numerical comparison of 2D resistivity imaging with 10 electrode arrays. Geophysical prospecting, 52(5), 379-398.
        data["MPR(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (2*(NumPyArray_N_index-NumPyArray_M_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["MPR#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_N_index-NumPyArray_M_index)) ) % (2*(NumPyArray_N_index-NumPyArray_M_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["MPR#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) & \
            ( ( (NumPyArray_B_index-NumPyArray_A_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (2*(NumPyArray_M_index-NumPyArray_N_index)) == 0) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["MPR#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) & \
            ( ( (NumPyArray_A_index-NumPyArray_B_index)-(2*(NumPyArray_M_index-NumPyArray_N_index)) ) % (2*(NumPyArray_M_index-NumPyArray_N_index)) == 0) \
        ).astype(int)
        #--
        print(f'data["MPR(AMNB)"] count = {np.sum(data["MPR(AMNB)"]).astype(int)}')
        print(f'data["MPR#1(BMNA)"] count = {np.sum(data["MPR#1(BMNA)"]).astype(int)}')
        print(f'data["MPR#2(ANMB)"] count = {np.sum(data["MPR#2(ANMB)"]).astype(int)}')
        print(f'data["MPR#3(BNMA)"] count = {np.sum(data["MPR#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_Select_AMNB = NumPyArray_A_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_B_index_Select_AMNB= NumPyArray_B_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_M_index_Select_AMNB = NumPyArray_M_index[np.array(data["MPR(AMNB)"]) == 1]
        NumPyArray_N_index_Select_AMNB = NumPyArray_N_index[np.array(data["MPR(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_Select_AMNB, 
                NumPyArray_B_index_Select_AMNB, 
                NumPyArray_M_index_Select_AMNB, 
                NumPyArray_N_index_Select_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'MPR_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------

        #--------------------------------------------
        # Gradient(GD) Array: A,M,N,B
        data["GD(AMNB)"] = ( \
            (NumPyArray_A_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #1: B,M,N,A (電流反向, Current=-I)
        data["GD#1(BMNA)"] = ( \
            (NumPyArray_B_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_A_index) \
        ).astype(int)
        # 考慮置換情形 #2: A,N,M,B (電壓反向, Voltage=-V)
        data["GD#2(ANMB)"] = ( \
            (NumPyArray_A_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_B_index) \
        ).astype(int)
        # 考慮置換情形 #3: B,N,M,A (電流/電壓反向, Current=-I, Voltage=-V)
        data["GD#3(BNMA)"] = ( \
            (NumPyArray_B_index < NumPyArray_N_index) & \
            (NumPyArray_N_index < NumPyArray_M_index) & \
            (NumPyArray_M_index < NumPyArray_A_index) \
        ).astype(int)
        #--
        print(f'data["GD(AMNB)"] count = {np.sum(data["GD(AMNB)"]).astype(int)}')
        print(f'data["GD#1(BMNA)"] count = {np.sum(data["GD#1(BMNA)"]).astype(int)}')
        print(f'data["GD#2(ANMB)"] count = {np.sum(data["GD#2(ANMB)"]).astype(int)}')
        print(f'data["GD#3(BNMA)"] count = {np.sum(data["GD#3(BNMA)"]).astype(int)}')
        print('--')
        #--
        """
        NumPyArray_A_index_Select_AMNB = NumPyArray_A_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_B_index_Select_AMNB= NumPyArray_B_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_M_index_Select_AMNB = NumPyArray_M_index[np.array(data["GD(AMNB)"]) == 1]
        NumPyArray_N_index_Select_AMNB = NumPyArray_N_index[np.array(data["GD(AMNB)"]) == 1]
        for idx, (a_idx, b_idx, m_idx, n_idx) in enumerate(
            zip(
                NumPyArray_A_index_Select_AMNB, 
                NumPyArray_B_index_Select_AMNB, 
                NumPyArray_M_index_Select_AMNB, 
                NumPyArray_N_index_Select_AMNB
            ), 
            start=1 # 讓序號從 1 開始顯示
        ):
            print(f'GD_AMNB[{idx}]: {a_idx:2},{b_idx:2},{m_idx:2},{n_idx:2}')
        print('--')
        """
        #--------------------------------------------
        #--
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["r"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='V/I (Ohm)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet') 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs V/I(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile24_PNG_Select_MainFileName"]}.ABMN_vs_VoverI.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('VoverI_Select 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # Current_Select 資料繪圖
        #--------------------------------------------
        print('Current_Select 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["i"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='Current (A)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet',
                vmin=0,
                vmax=NumPyArray_C_data.max()) 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs Current(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile24_PNG_Select_MainFileName"]}.ABMN_vs_Current.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('Current_Select 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # Voltage_Select 資料繪圖
        #--------------------------------------------
        print('Voltage_Select 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["i"]*data["r"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='Voltage (V)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet') 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs Voltage(min={NumPyArray_C_data.min():.5f},max={NumPyArray_C_data.max():.5f})(abs(min)={np.abs(NumPyArray_C_data).min():.5f},abs(max)={np.abs(NumPyArray_C_data).max():.5f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile24_PNG_Select_MainFileName"]}.ABMN_vs_Voltage.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('Voltage_Select 資料繪圖...完成!')
        print('--')
        #============================================
        #============================================
        # SNR_Select 資料繪圖
        #--------------------------------------------
        print('SNR_Select 資料繪圖...')
        # 整理資料
        #--
        # 轉換為 1 索引的電極編號，是numpy.ndarray
        NumPyArray_A_index = np.array(data["a"]) + 1
        NumPyArray_B_index = np.array(data["b"]) + 1
        NumPyArray_M_index = np.array(data["m"]) + 1
        NumPyArray_N_index = np.array(data["n"]) + 1
        # 強度資料，是numpy.ndarray
        NumPyArray_C_data = np.array(data["SNR"])
        # 計算數量
        int_C_data_count = len(NumPyArray_C_data)
        print(f"共有 {int_C_data_count} 筆「ABMN資料」。")
        #--
        # 建立特定AB的清單，命名為100*A+B。(例如: A=1,B=4,AB_key=104; A=10,B=4,AB_key=1004;)
        NumPyArray_AB_key = NumPyArray_A_index * 100 + NumPyArray_B_index
        # 找出所有獨特的 AB 組合
        NumPyArray_unique_AB_key = np.unique(NumPyArray_AB_key)
        # 計算數量
        int_unique_AB_key_count = len(NumPyArray_unique_AB_key)
        print(f"共有 {int_unique_AB_key_count} 種「AB放電組合」。")
        #--------------------------------------------
        #--------------------------------------------
        # 整理為特定AB與對應之矩陣
        #--
        # 建立各種放電組合的字典變數，可透過鍵值方式操作內容
        Dictionary_AB_matrix_list = {}
        # 迴圈初始化所有MN內容矩陣
        for key in NumPyArray_unique_AB_key:
            Dictionary_AB_matrix_list[key] = np.full((N_electrodes, N_electrodes), np.nan)
        # 迴圈填充所有強度資料
        for i in range(int_C_data_count):
            #print(f'第{i}筆資料的AB放電組合為: {NumPyArray_AB_key[i]}')
            Dictionary_AB_matrix_list[NumPyArray_AB_key[i]][NumPyArray_M_index[i]-1,NumPyArray_N_index[i]-1]=NumPyArray_C_data[i]
        # 計算數量
        int_AB_matrix_count=len(Dictionary_AB_matrix_list)
        print(f'矩陣數量 = {int_AB_matrix_count}')
        #--------------------------------------------
        #--------------------------------------------
        # 計算需要輸出的子圖配置及整張圖片尺寸
        #--
        int_subplot_row_count = math.floor(np.sqrt(int_AB_matrix_count+3))
        int_subplot_col_count = math.ceil((int_AB_matrix_count+3) / int_subplot_row_count)
        if int_subplot_col_count < 15:
            int_subplot_col_count = 15
        print(f'準備的子圖配置(Col x Row) = {int_subplot_col_count} x {int_subplot_row_count} = {(int_subplot_row_count*int_subplot_col_count)}')
        #--------------------------------------------
        #--------------------------------------------
        # 創建所有的子圖
        Output_PNG_DPI = 100
        Output_PNG_Width = 300
        Output_PNG_Height = 300
        fig, axes = plt.subplots(int_subplot_row_count, int_subplot_col_count, figsize=(Output_PNG_Width*int_subplot_col_count/Output_PNG_DPI, Output_PNG_Height*int_subplot_row_count/Output_PNG_DPI), squeeze=False)
        #--
        # 計算標題所需的精確頂部空間
        # 假設標題 (fontsize=16) 總共需要 0.25 英寸 (inch) 的垂直空間 (包含標題本身和間隙)
        TITLE_HEIGHT_INCH = 0.5
        # 計算新的 top 座標： (總高 - 標題所需高) / 總高
        new_top = 1.0 - (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_top_y = 1.0 - ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom = (TITLE_HEIGHT_INCH / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        new_bottom_y = ((TITLE_HEIGHT_INCH-0.35) / (Output_PNG_Height * int_subplot_row_count / Output_PNG_DPI))
        # 調整邊緣空間
        fig.subplots_adjust(left=0.01, right=0.99, bottom=new_bottom, top=new_top)
        #--
        # 刪除多餘的子圖
        for i in range(int_AB_matrix_count, int_subplot_row_count*int_subplot_col_count): 
            #print(f'刪除第{i}個子圖，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            fig.delaxes(axes[(i // int_subplot_col_count), (i % int_subplot_col_count)])
        #--------------------------------------------
        #--------------------------------------------
        # 迴圈繪製每個子圖
        print(f'繪圖...')
        cbar_title_str='SNR (dB)'
        for i, key in enumerate(NumPyArray_unique_AB_key):
            #print(f'繪製第{i}個子圖(矩陣關鍵字={key})，子圖軸=[{i // int_subplot_col_count},{i % int_subplot_col_count}]...')
            temp_imshow_handle=axes[i // int_subplot_col_count, i % int_subplot_col_count].imshow(
                Dictionary_AB_matrix_list[key],  
                interpolation='nearest', 
                cmap='jet',
                vmin=NumPyArray_C_data.min(),
                vmax=NumPyArray_C_data.max()) 
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_ylabel('M',labelpad=0, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='y',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_xlabel('N',labelpad=-3, fontsize=9)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].tick_params(axis='x',direction='in', pad=2)
            axes[i // int_subplot_col_count, i % int_subplot_col_count].set_title(f'A={key//100},B={key%100},Data Count={np.sum(~np.isnan(Dictionary_AB_matrix_list[key]))}',y=0.98, fontsize=9)
            cax = axes[i // int_subplot_col_count, i % int_subplot_col_count].inset_axes([0.1, 0.16, 0.50, 0.05]) 
            cbar = plt.colorbar(temp_imshow_handle, cax=cax, orientation='horizontal')
            cbar.set_label(f'{cbar_title_str}', labelpad=-38) 
        #--
        # 填入總標題
        main_title_str=f'ABMN vs SNR(min={NumPyArray_C_data.min():.2f},max={NumPyArray_C_data.max():.2f}), Data Count = {int_C_data_count}, WA(AMNB) count = {np.sum(data["WA(AMNB)"]).astype(int)}, WB(ABMN) count = {np.sum(data["WB#1(ABMN)"]).astype(int)}, WG(AMBN) count = {np.sum(data["WG(AMBN)"]).astype(int)}, DD(ABMN) count = {np.sum(data["DD#1(ABMN)"]).astype(int)}, WS(AMNB) count = {np.sum(data["WS(AMNB)"]).astype(int)}, GA(AMBN) count = {np.sum(data["GA(AMBN)"]).astype(int)}, MGD(AMNB) count = {np.sum(data["MGD(AMNB)"]).astype(int)}, MPR(AMNB) count = {np.sum(data["MPR(AMNB)"]).astype(int)}, GD(AMNB) count = {np.sum(data["GD(AMNB)"]).astype(int)}'
        fig.suptitle(main_title_str, fontsize=16, fontweight='bold', y=new_top_y)
        # 填入版本資訊
        fig.text(0.98, new_bottom_y, ERTMaker_Info, ha='right', va='bottom', fontsize=16, color='gray')
        #--
        print(f'繪圖...完成!')
        #--------------------------------------------
        #--------------------------------------------
        # 儲存圖片
        print(f'儲存圖片...')
        Output_Png_FileName = f'{temp_json_data["OutputFile24_PNG_Select_MainFileName"]}.ABMN_vs_SNR.png'
        os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
        plt.savefig(Output_Png_FileName, dpi=Output_PNG_DPI)
        plt.close()
        print(f'儲存圖片...完成!')
        #--------------------------------------------
        print('SNR_Select 資料繪圖...完成!')
        print('--')
        #============================================
#********************************************

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
