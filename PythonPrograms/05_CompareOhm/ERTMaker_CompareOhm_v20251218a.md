# CompareOhm(ERTMaker_CompareOhm_v20251218a.py)
+ 作者: HsiupoYeh
+ 更新日期: 2025-12-18

### 版本
+ ERTMaker_CompareOhm_v20251218a.py
  + 僅支援Ohm檔案

### 開發環境
+ Windows 10
+ 使用Lite_PyGimli_Env (pygimli==1.5.4)
  + https://github.com/cgrgncu/pyGimli_dev/releases/tag/Lite_PyGimli_Env
+ 測試位置:
```
\Lite_PyGimli_Env\PythonEnv\
\Lite_PyGimli_Env\Input_ERTMaker_CompareOhm\CompareOhm.json
\Lite_PyGimli_Env\ERTMaker_CompareOhm_v20251218a.py
\Lite_PyGimli_Env\RUN_ERTMaker_CompareOhm_v20251218a.bat
```
+ 也可以放一些必要的輸入範例檔案(並非每個都有用到):
```

```
+ 呼叫方式: 運行「RUN_ERTMaker_CompareOhm_v20251218a.bat」檔案，檔案內容:
```batch
.\PythonEnv\Python.exe ERTMaker_CompareOhm_v20251218a.py
PAUSE
```
### 主程式(ERTMaker_CompareOhm_v20251218a.py)
+ 設定檔(CompareOhm.json):
```json
{
"CompareOhm_Version":"v20251218a",
"CompareOhm_Author":"HsiupoYeh",
"InputFile01_First_Ohm_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile01_First_Ohm_FileName":"Input_ERTMaker_CompareOhm/TEST001.ohm",
"InputFile02_Second_Ohm_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile02_Second_Ohm_FileName":"Input_ERTMaker_CompareOhm/TEST002.ohm",
"OutputFile01_Both_First_Ohm_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile01_Both_First_Ohm_FileName":"Output_ERTMaker_CompareOhm/TEST001.Both.ohm",
"OutputFile02_Both_Second_Ohm_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile02_Both_Second_Ohm_FileName":"Output_ERTMaker_CompareOhm/TEST002.Both.ohm",
"OutputFile03_VoverI_PNG_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile03_VoverI_PNG_FileName":"Output_ERTMaker_CompareOhm/TEST001_TEST002_VoverI.png",
"OutputFile04_Voltage_PNG_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile04_Voltage_PNG_FileName":"Output_ERTMaker_CompareOhm/TEST001_TEST002_Voltage.png",
"OutputFile05_Current_PNG_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile05_Current_PNG_FileName":"Output_ERTMaker_CompareOhm/TEST001_TEST002_Current.png"
}
```

+ 程式碼:
```python
#**************************************************************************
#   Name: ERTMaker_CompareOhm_v20251218a.py
#   Copyright: 
#   Author: HsiupoYeh
#   Version: v20251218a
#   Description: 讀取 JSON 設定檔，比較兩個Ohm檔案並繪圖。
#                必須讀取指定位置「Input_ERTMaker_CompareOhm/CompareOhm.json」的JOSN檔案。
#                設定檔(CompareOhm.json)中有說明各參數意義。
#**************************************************************************
import json
import os
import numpy as np
from datetime import datetime
import pygimli as pg
from pygimli.physics import ert
import matplotlib.pyplot as plt

#--------------------------------------------
# 取得運行開始時間
program_start_time = datetime.now()
#--------------------------------------------
#--------------------------------------------
# 版本資訊
VERSION_STR = 'v20251218a'
# 提示畫面
print('************************************************************')
print(f'* ERTMaker_CompareOhm_v{VERSION_STR}')
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
json_file_name = 'Input_ERTMaker_CompareOhm/CompareOhm.json'
#--------------------------------------------
# 讀取檔案
# 開啟並讀取 JSON 檔案
print("讀取 .json 檔...")
with open(json_file_name, 'r', encoding='utf-8') as json_file:
    temp_json_data = json.load(json_file)
print("讀取 .json 檔...完成!")
#--------------------------------------------
#--------------------------------------------
# 讀取資料 First_Ohm
#--
print("載入First_Ohm檔案...")
Input_First_Ohm_FileName = temp_json_data["InputFile01_First_Ohm_FileName"]
First_data = ert.load(Input_First_Ohm_FileName)
if os.path.exists('invalid.data'):
    os.remove('invalid.data')
print("載入First_Ohm檔案...完成!")
#--
print(f'First_Ohm: 感應器數量 = {First_data.sensorCount()}, 資料數量 = {First_data.size()}')
#--
print("調整 First_Ohm 的 ABMN 順序與 R 值...")
# 準備需變換的索引
First_data_swap_ab_index = First_data['a'] > First_data['b']
First_data_swap_mn_index = First_data['m'] > First_data['n']
# 執行對調
First_data['a'][First_data_swap_ab_index], First_data['b'][First_data_swap_ab_index] = First_data['b'][First_data_swap_ab_index], First_data['a'][First_data_swap_ab_index]
First_data['m'][First_data_swap_mn_index], First_data['n'][First_data_swap_mn_index] = First_data['n'][First_data_swap_mn_index], First_data['m'][First_data_swap_mn_index]
# R 值的正負修正邏輯：
# 使用 XOR (互斥或)：若 AB 與 MN 其中只有一組對調，則 R 變號
# 因為R是 <class 'pgcore.libs._pygimli_.RVector'> 先建立Numpy來處理最後再更新R
First_data_r = np.array(First_data['r'])
First_data_r[(First_data_swap_ab_index^First_data_swap_mn_index)] *= -1
First_data['r'] = First_data_r
print("調整 First_Ohm 的 ABMN 順序與 R 值...完成!")
#--
First_data_electrodes_position_array = First_data.sensors().array()
#print(First_data_electrodes_position_array)
print('--')
#--------------------------------------------
#--------------------------------------------
# 讀取資料 Second_Ohm
#--
print("載入Second_Ohm檔案...")
Input_Second_Ohm_FileName = temp_json_data["InputFile02_Second_Ohm_FileName"]
Second_data = ert.load(Input_Second_Ohm_FileName)
if os.path.exists('invalid.data'):
    os.remove('invalid.data')
print("載入Second_Ohm檔案...完成!")
#--
print("調整 Second_Ohm 的 ABMN 順序與 R 值...")
# 準備需變換的索引
Second_data_swap_ab_index = Second_data['a'] > Second_data['b']
Second_data_swap_mn_index = Second_data['m'] > Second_data['n']
# 執行對調
Second_data['a'][Second_data_swap_ab_index], Second_data['b'][Second_data_swap_ab_index] = Second_data['b'][Second_data_swap_ab_index], Second_data['a'][Second_data_swap_ab_index]
Second_data['m'][Second_data_swap_mn_index], Second_data['n'][Second_data_swap_mn_index] = Second_data['n'][Second_data_swap_mn_index], Second_data['m'][Second_data_swap_mn_index]
# R 值的正負修正邏輯：
# 使用 XOR (互斥或)：若 AB 與 MN 其中只有一組對調，則 R 變號
# 因為R是 <class 'pgcore.libs._pygimli_.RVector'> 先建立Numpy來處理最後再更新R
Second_data_r = np.array(Second_data['r'])
Second_data_r[(Second_data_swap_ab_index^Second_data_swap_mn_index)] *= -1
Second_data['r'] = Second_data_r
print("調整 Second_Ohm 的 ABMN 順序與 R 值...完成!")
#--
print(f'Second_Ohm: 感應器數量 = {Second_data.sensorCount()}, 資料數量 = {Second_data.size()}')
Second_data_electrodes_position_array = Second_data.sensors().array()
#print(Second_data_electrodes_position_array)
print('--')
#--------------------------------------------
#--------------------------------------------
# 合併感應器位置
Both_data_electrodes_position_array = np.unique(np.vstack((First_data_electrodes_position_array, Second_data_electrodes_position_array)), axis=0)
#print(Both_data_electrodes_position_array)
print(f"合併感應器位置後新的唯一感應器數量: {len(Both_data_electrodes_position_array)}")
#--------------------------------------------
#--------------------------------------------
# 建立座標查找字典 (由座標 tuple 指向新編號)
sensor_to_new_id = {tuple(pos): i for i, pos in enumerate(Both_data_electrodes_position_array)}
#print(sensor_to_new_id)
#--------------------------------------------

#--------------------------------------------
# 輸出Both_First_Ohm檔案
#--
print('輸出Both_First_Ohm檔案...')
Output_First_Ohm_FileName = temp_json_data["OutputFile01_Both_First_Ohm_FileName"]
os.makedirs(os.path.dirname(Output_First_Ohm_FileName), exist_ok=True)
#--
# 建立一個陣列，索引是舊編號，值是新編號 (1-based)
First_data_old_to_new_id_map = np.zeros(First_data.sensorCount(), dtype=int)
for old_idx in range(First_data.sensorCount()):
    # 透過原始索引找到座標，再從 sensor_to_new_id 字典找到新的 ID
    First_data_old_to_new_id_map[old_idx] = sensor_to_new_id[tuple(First_data.sensor(old_idx).array())] + 1
#--
# 一次性轉換所有的 ABMN 數據為新編號 (向量化運算)
First_data_A_new = First_data_old_to_new_id_map[First_data['a'].astype(int)]
First_data_B_new = First_data_old_to_new_id_map[First_data['b'].astype(int)]
First_data_M_new = First_data_old_to_new_id_map[First_data['m'].astype(int)]
First_data_N_new = First_data_old_to_new_id_map[First_data['n'].astype(int)]
First_data_R_vals = np.array(First_data['r']) # 轉成 Numpy 讀取較快
if First_data.haveData('i'):
    First_data_I_vals = np.array(First_data['i']) # 轉成 Numpy 讀取較快
#--
with open(Output_First_Ohm_FileName, 'w', encoding='utf-8') as f:
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
    f.write(f"{len(Both_data_electrodes_position_array)}\n")
    f.write('#x z\n')   
    #--
    # 寫入座標清單
    for i in range(len(Both_data_electrodes_position_array)):
        x_val = Both_data_electrodes_position_array[i][0]
        z_val = Both_data_electrodes_position_array[i][2]
        f.write(f"{x_val:.10g} {z_val:.10g}\n")
    #--
    if First_data.haveData('i'):
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
        f.write(f"{First_data.size()}\n")    
        f.write("#A B M N R I\n")
        #--
        # 寫入資料
        for a, b, m, n, r, i_val in zip(First_data_A_new, First_data_B_new, First_data_M_new, First_data_N_new, First_data_R_vals, First_data_I_vals):
            f.write(f"{a} {b} {m} {n} {r:.5f} {i_val:.3f}\n")        
        #--
        f.write("#------------------------------------------------------------\n")
        #--
    else:
        # 後方固定內容
        f.write('#------------------------------------------------------------\n')
        f.write('\n')
        f.write('#------------------------------------------------------------\n')
        f.write('# 注意: 讀檔程式不聰明，觀測資料數量寫在本區塊某一行，其下一行必須是「#A B M N R」。\n')
        f.write('#       這個「#A B M N R」不是註解，讀檔要解析...\n')
        f.write('#       A,B,M,N均為電極編號，以上方區塊電極位置的順序當作編號，第一個電極為編號1。\n')
        f.write('#       R為AB電流與MN電壓比值(V_MN/I_AB)，單位「Ohm」。\n')
        f.write('# 觀測資料數量:\n')
        f.write(f"{First_data.size()}\n")    
        f.write("#A B M N R\n")
        #--
        # 寫入資料
        for a, b, m, n, r in zip(First_data_A_new, First_data_B_new, First_data_M_new, First_data_N_new, First_data_R_vals):
            f.write(f"{a} {b} {m} {n} {r:.5f}\n")        
        #--
        f.write("#------------------------------------------------------------\n")
        #--  
    #--
#--
print('輸出Both_First_Ohm檔案...結束!')
#--------------------------------------------
#--------------------------------------------
# 輸出Both_Second_Ohm檔案
#--
print('輸出Both_Second_Ohm檔案...')
Output_Second_Ohm_FileName = temp_json_data["OutputFile02_Both_Second_Ohm_FileName"]
os.makedirs(os.path.dirname(Output_Second_Ohm_FileName), exist_ok=True)
#--
# 建立一個陣列，索引是舊編號，值是新編號 (1-based)
Second_data_old_to_new_id_map = np.zeros(Second_data.sensorCount(), dtype=int)
for old_idx in range(Second_data.sensorCount()):
    # 透過原始索引找到座標，再從 sensor_to_new_id 字典找到新的 ID
    Second_data_old_to_new_id_map[old_idx] = sensor_to_new_id[tuple(Second_data.sensor(old_idx).array())] + 1
#--
# 一次性轉換所有的 ABMN 數據為新編號 (向量化運算)
Second_data_A_new = Second_data_old_to_new_id_map[Second_data['a'].astype(int)]
Second_data_B_new = Second_data_old_to_new_id_map[Second_data['b'].astype(int)]
Second_data_M_new = Second_data_old_to_new_id_map[Second_data['m'].astype(int)]
Second_data_N_new = Second_data_old_to_new_id_map[Second_data['n'].astype(int)]
Second_data_R_vals = np.array(Second_data['r']) # 轉成 Numpy 讀取較快
if Second_data.haveData('i'):
    Second_data_I_vals = np.array(Second_data['i']) # 轉成 Numpy 讀取較快
#--
with open(Output_Second_Ohm_FileName, 'w', encoding='utf-8') as f:
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
    f.write(f"{len(Both_data_electrodes_position_array)}\n")
    f.write('#x z\n')   
    #--
    # 寫入座標清單
    for i in range(len(Both_data_electrodes_position_array)):
        x_val = Both_data_electrodes_position_array[i][0]
        z_val = Both_data_electrodes_position_array[i][2]
        f.write(f"{x_val:.10g} {z_val:.10g}\n")
    #--
    if Second_data.haveData('i'):
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
        f.write(f"{Second_data.size()}\n")    
        f.write("#A B M N R I\n")
        #--
        # 寫入資料
        for a, b, m, n, r, i_val in zip(Second_data_A_new, Second_data_B_new, Second_data_M_new, Second_data_N_new, Second_data_R_vals, Second_data_I_vals):
            f.write(f"{a} {b} {m} {n} {r:.5f} {i_val:.3f}\n")        
        #--
        f.write("#------------------------------------------------------------\n")
        #--
    else:
        # 後方固定內容
        f.write('#------------------------------------------------------------\n')
        f.write('\n')
        f.write('#------------------------------------------------------------\n')
        f.write('# 注意: 讀檔程式不聰明，觀測資料數量寫在本區塊某一行，其下一行必須是「#A B M N R」。\n')
        f.write('#       這個「#A B M N R」不是註解，讀檔要解析...\n')
        f.write('#       A,B,M,N均為電極編號，以上方區塊電極位置的順序當作編號，第一個電極為編號1。\n')
        f.write('#       R為AB電流與MN電壓比值(V_MN/I_AB)，單位「Ohm」。\n')
        f.write('# 觀測資料數量:\n')
        f.write(f"{Second_data.size()}\n")    
        f.write("#A B M N R\n")
        #--
        # 寫入資料
        for a, b, m, n, r in zip(Second_data_A_new, Second_data_B_new, Second_data_M_new, Second_data_N_new, Second_data_R_vals):
            f.write(f"{a} {b} {m} {n} {r:.5f}\n")        
        #--
        f.write("#------------------------------------------------------------\n")
        #--  
    #--
#--
print('輸出Both_Second_Ohm檔案...結束!')
#--------------------------------------------
print('--')
#--------------------------------------------
# 讀取資料 Both_First_Ohm
#--
print("載入Both_First_Ohm檔案...")
Output_First_Ohm_FileName = temp_json_data["OutputFile01_Both_First_Ohm_FileName"]
Both_First_data = ert.load(Output_First_Ohm_FileName)
if os.path.exists('invalid.data'):
    os.remove('invalid.data')
print("載入Both_First_Ohm檔案...完成!")
#--
print(f'Both_First_Ohm: 感應器數量 = {Both_First_data.sensorCount()}, 資料數量 = {Both_First_data.size()}')
#--------------------------------------------
#--------------------------------------------
# 讀取資料 Both_Second_Ohm
#--
print("載入Both_Second_Ohm檔案...")
Output_Second_Ohm_FileName = temp_json_data["OutputFile02_Both_Second_Ohm_FileName"]
Both_Second_data = ert.load(Output_Second_Ohm_FileName)
if os.path.exists('invalid.data'):
    os.remove('invalid.data')
print("載入Both_Second_Ohm檔案...完成!")
#--
print(f'Both_Second_data: 感應器數量 = {Both_Second_data.sensorCount()}, 資料數量 = {Both_Second_data.size()}')
#--------------------------------------------
print('--')
#--------------------------------------------
# 取得兩份資料的「特徵字串」作為 UID
Both_First_data_UID = [f"{int(a)}-{int(b)}-{int(m)}-{int(n)}" for a,b,m,n in zip(Both_First_data['a'], Both_First_data['b'], Both_First_data['m'], Both_First_data['n'])]
Both_Second_data_UID = [f"{int(a)}-{int(b)}-{int(m)}-{int(n)}" for a,b,m,n in zip(Both_Second_data['a'], Both_Second_data['b'], Both_Second_data['m'], Both_Second_data['n'])]
Both_First_data_UID_array = np.array(Both_First_data_UID)
Both_Second_data_UID_array = np.array(Both_Second_data_UID)
#--------------------------------------------
# 利用 Numpy 的 isin 找出是否交集
Overlap_First_data_mask = np.isin(Both_First_data_UID_array, Both_Second_data_UID_array)
Overlap_Second_data_mask = np.isin(Both_Second_data_UID_array, Both_First_data_UID_array)
print(f"共同點數量: {np.sum(Overlap_First_data_mask)}")
print(f"共同點數量: {np.sum(Overlap_Second_data_mask)}")
# 取出共同的ABMNRI
Overlap_A = Both_First_data['a'][Overlap_First_data_mask]
Overlap_B = Both_First_data['b'][Overlap_First_data_mask]
Overlap_M = Both_First_data['m'][Overlap_First_data_mask]
Overlap_N = Both_First_data['n'][Overlap_First_data_mask]
Overlap_First_data_R = Both_First_data['r'][Overlap_First_data_mask]
if Both_First_data.haveData('i'):
    Overlap_First_data_I = Both_First_data['i'][Overlap_First_data_mask]
Overlap_Second_data_R = Both_Second_data['r'][Overlap_Second_data_mask]
if Both_Second_data.haveData('i'):
    Overlap_Second_data_I = Both_Second_data['i'][Overlap_Second_data_mask]
# 把資料排序
Overlap_A_sorted = Overlap_A[np.argsort(Both_First_data_UID_array[Overlap_First_data_mask])]
Overlap_B_sorted = Overlap_B[np.argsort(Both_First_data_UID_array[Overlap_First_data_mask])]
Overlap_M_sorted = Overlap_M[np.argsort(Both_First_data_UID_array[Overlap_First_data_mask])]
Overlap_N_sorted = Overlap_N[np.argsort(Both_First_data_UID_array[Overlap_First_data_mask])]
Overlap_First_data_R_sorted = Overlap_First_data_R[np.argsort(Both_First_data_UID_array[Overlap_First_data_mask])]
if Both_First_data.haveData('i'):
    Overlap_First_data_I_sorted = Overlap_First_data_I[np.argsort(Both_First_data_UID_array[Overlap_First_data_mask])]
    Overlap_First_data_V_sorted = Overlap_First_data_R_sorted*Overlap_First_data_I_sorted
Overlap_Second_data_R_sorted = Overlap_Second_data_R[np.argsort(Both_Second_data_UID_array[Overlap_Second_data_mask])]
if Both_Second_data.haveData('i'):
    Overlap_Second_data_I_sorted = Overlap_Second_data_I[np.argsort(Both_Second_data_UID_array[Overlap_Second_data_mask])]
    Overlap_Second_data_V_sorted = Overlap_Second_data_R_sorted*Overlap_Second_data_I_sorted
#--------------------------------------------
print('--')
#--------------------------------------------
# Cross Plot V/I
#--
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, axes = plt.subplots(1, 2, figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
#--
# 子圖1
#--
# 繪製資料點
Overlap_First_data_R_sorted_positive_positive = Overlap_First_data_R_sorted[(Overlap_First_data_R_sorted > 0) & (Overlap_Second_data_R_sorted > 0)]
Overlap_Second_data_R_sorted_positive_positive = Overlap_Second_data_R_sorted[(Overlap_First_data_R_sorted > 0) & (Overlap_Second_data_R_sorted > 0)]
axes[0].scatter(Overlap_First_data_R_sorted_positive_positive, Overlap_Second_data_R_sorted_positive_positive, alpha=0.5, s=5, c='blue',label=f'1+2+({len(Overlap_First_data_R_sorted_positive_positive)})')
Overlap_First_data_R_sorted_positive_negative = Overlap_First_data_R_sorted[(Overlap_First_data_R_sorted > 0) & (Overlap_Second_data_R_sorted < 0)]
Overlap_Second_data_R_sorted_positive_negative = Overlap_Second_data_R_sorted[(Overlap_First_data_R_sorted > 0) & (Overlap_Second_data_R_sorted < 0)]
axes[0].scatter(Overlap_First_data_R_sorted_positive_negative, Overlap_Second_data_R_sorted_positive_negative, alpha=0.5, s=5, c='blue',label=f'1+2-({len(Overlap_First_data_R_sorted_positive_negative)})')
Overlap_First_data_R_sorted_negative_negative = Overlap_First_data_R_sorted[(Overlap_First_data_R_sorted < 0) & (Overlap_Second_data_R_sorted < 0)]
Overlap_Second_data_R_sorted_negative_negative = Overlap_Second_data_R_sorted[(Overlap_First_data_R_sorted < 0) & (Overlap_Second_data_R_sorted < 0)]
axes[0].scatter(Overlap_First_data_R_sorted_negative_negative, Overlap_Second_data_R_sorted_negative_negative, alpha=0.5, s=5, c='blue',label=f'1-2-({len(Overlap_First_data_R_sorted_negative_negative)})')
Overlap_First_data_R_sorted_negative_positive = Overlap_First_data_R_sorted[(Overlap_First_data_R_sorted < 0) & (Overlap_Second_data_R_sorted > 0)]
Overlap_Second_data_R_sorted_negative_positive = Overlap_Second_data_R_sorted[(Overlap_First_data_R_sorted < 0) & (Overlap_Second_data_R_sorted > 0)]
axes[0].scatter(Overlap_First_data_R_sorted_negative_positive, Overlap_Second_data_R_sorted_negative_positive, alpha=0.5, s=5, c='blue',label=f'1-2+({len(Overlap_First_data_R_sorted_negative_positive)})')
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
axes[0].set_xlabel(f'First ({os.path.basename(Output_First_Ohm_FileName)}) V/I (Ohm)')
axes[0].set_ylabel(f'Second ({os.path.basename(Output_Second_Ohm_FileName)}) V/I (Ohm)')
axes[0].set_title(f'V/I Cross Plot(Linear)\nFirst Data Count = {Both_First_data.size()}\n Second Data Count = {Both_Second_data.size()}\nOverlap Data Count = {len(Overlap_First_data_R_sorted_positive_positive)+len(Overlap_First_data_R_sorted_positive_negative)+len(Overlap_First_data_R_sorted_negative_negative)+len(Overlap_First_data_R_sorted_negative_positive)}')
axes[0].legend(loc='upper left')
#--
# 子圖2
#--
# 繪製資料點
Overlap_First_data_R_sorted_positive_positive_abs_log10 = np.log10(np.abs(Overlap_First_data_R_sorted[(Overlap_First_data_R_sorted > 0) & (Overlap_Second_data_R_sorted > 0)]))
Overlap_Second_data_R_sorted_positive_positive_abs_log10 = np.log10(np.abs(Overlap_Second_data_R_sorted[(Overlap_First_data_R_sorted > 0) & (Overlap_Second_data_R_sorted > 0)]))
axes[1].scatter(Overlap_First_data_R_sorted_positive_positive_abs_log10, Overlap_Second_data_R_sorted_positive_positive_abs_log10, alpha=0.5, s=5, c='blue',label=f'1+2+({len(Overlap_First_data_R_sorted_positive_positive_abs_log10)})')
Overlap_First_data_R_sorted_positive_negative_abs_log10 = np.log10(np.abs(Overlap_First_data_R_sorted[(Overlap_First_data_R_sorted > 0) & (Overlap_Second_data_R_sorted < 0)]))
Overlap_Second_data_R_sorted_positive_negative_abs_log10 = np.log10(np.abs(Overlap_Second_data_R_sorted[(Overlap_First_data_R_sorted > 0) & (Overlap_Second_data_R_sorted < 0)]))
axes[1].scatter(Overlap_First_data_R_sorted_positive_negative_abs_log10, Overlap_Second_data_R_sorted_positive_negative_abs_log10, alpha=0.5, s=5, c='lightblue',label=f'1+2-({len(Overlap_First_data_R_sorted_positive_negative_abs_log10)})')
Overlap_First_data_R_sorted_negative_negative_abs_log10 = np.log10(np.abs(Overlap_First_data_R_sorted[(Overlap_First_data_R_sorted < 0) & (Overlap_Second_data_R_sorted < 0)]))
Overlap_Second_data_R_sorted_negative_negative_abs_log10 = np.log10(np.abs(Overlap_Second_data_R_sorted[(Overlap_First_data_R_sorted < 0) & (Overlap_Second_data_R_sorted < 0)]))
axes[1].scatter(Overlap_First_data_R_sorted_negative_negative_abs_log10, Overlap_Second_data_R_sorted_negative_negative_abs_log10, alpha=0.5, s=5, c='red',label=f'1-2-({len(Overlap_First_data_R_sorted_negative_negative_abs_log10)})')
Overlap_First_data_R_sorted_negative_positive_abs_log10 = np.log10(np.abs(Overlap_First_data_R_sorted[(Overlap_First_data_R_sorted < 0) & (Overlap_Second_data_R_sorted > 0)]))
Overlap_Second_data_R_sorted_negative_positive_abs_log10 = np.log10(np.abs(Overlap_Second_data_R_sorted[(Overlap_First_data_R_sorted < 0) & (Overlap_Second_data_R_sorted > 0)]))
axes[1].scatter(Overlap_First_data_R_sorted_negative_positive_abs_log10, Overlap_Second_data_R_sorted_negative_positive_abs_log10, alpha=0.5, s=5, c='lightpink',label=f'1-2+({len(Overlap_First_data_R_sorted_negative_positive_abs_log10)})')
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
axes[1].set_xlabel(f'First ({os.path.basename(Output_First_Ohm_FileName)}) abs(V/I) (Log10 Ohm)')
axes[1].set_ylabel(f'Second ({os.path.basename(Output_Second_Ohm_FileName)}) abs(V/I) (Log10 Ohm)')
axes[1].set_title(f'V/I Cross Plot(abs Log10)\nFirst Data Count = {Both_First_data.size()}\n Second Data Count = {Both_Second_data.size()}\nOverlap Data Count = {len(Overlap_First_data_R_sorted_positive_positive_abs_log10)+len(Overlap_First_data_R_sorted_positive_negative_abs_log10)+len(Overlap_First_data_R_sorted_negative_negative_abs_log10)+len(Overlap_First_data_R_sorted_negative_positive_abs_log10)}')
axes[1].legend(loc='upper left')
#--
print(f'儲存VoverI圖片...')
Output_Png_FileName = temp_json_data["OutputFile03_VoverI_PNG_FileName"]
os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_Png_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存VoverI圖片...完成!')
#--------------------------------------------
#--------------------------------------------
# Cross Plot V
#--
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, axes = plt.subplots(1, 2, figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
#--
# 子圖1
#--
# 繪製資料點
Overlap_First_data_V_sorted_positive_positive = Overlap_First_data_V_sorted[(Overlap_First_data_V_sorted > 0) & (Overlap_Second_data_V_sorted > 0)]
Overlap_Second_data_V_sorted_positive_positive = Overlap_Second_data_V_sorted[(Overlap_First_data_V_sorted > 0) & (Overlap_Second_data_V_sorted > 0)]
axes[0].scatter(Overlap_First_data_V_sorted_positive_positive, Overlap_Second_data_V_sorted_positive_positive, alpha=0.5, s=5, c='blue',label=f'1+2+({len(Overlap_First_data_V_sorted_positive_positive)})')
Overlap_First_data_V_sorted_positive_negative = Overlap_First_data_V_sorted[(Overlap_First_data_V_sorted > 0) & (Overlap_Second_data_V_sorted < 0)]
Overlap_Second_data_V_sorted_positive_negative = Overlap_Second_data_V_sorted[(Overlap_First_data_V_sorted > 0) & (Overlap_Second_data_V_sorted < 0)]
axes[0].scatter(Overlap_First_data_V_sorted_positive_negative, Overlap_Second_data_V_sorted_positive_negative, alpha=0.5, s=5, c='blue',label=f'1+2-({len(Overlap_First_data_V_sorted_positive_negative)})')
Overlap_First_data_V_sorted_negative_negative = Overlap_First_data_V_sorted[(Overlap_First_data_V_sorted < 0) & (Overlap_Second_data_V_sorted < 0)]
Overlap_Second_data_V_sorted_negative_negative = Overlap_Second_data_V_sorted[(Overlap_First_data_V_sorted < 0) & (Overlap_Second_data_V_sorted < 0)]
axes[0].scatter(Overlap_First_data_V_sorted_negative_negative, Overlap_Second_data_V_sorted_negative_negative, alpha=0.5, s=5, c='blue',label=f'1-2-({len(Overlap_First_data_V_sorted_negative_negative)})')
Overlap_First_data_V_sorted_negative_positive = Overlap_First_data_V_sorted[(Overlap_First_data_V_sorted < 0) & (Overlap_Second_data_V_sorted > 0)]
Overlap_Second_data_V_sorted_negative_positive = Overlap_Second_data_V_sorted[(Overlap_First_data_V_sorted < 0) & (Overlap_Second_data_V_sorted > 0)]
axes[0].scatter(Overlap_First_data_V_sorted_negative_positive, Overlap_Second_data_V_sorted_negative_positive, alpha=0.5, s=5, c='blue',label=f'1-2+({len(Overlap_First_data_V_sorted_negative_positive)})')
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
axes[0].set_xlabel(f'First ({os.path.basename(Output_First_Ohm_FileName)}) Voltage (V)')
axes[0].set_ylabel(f'Second ({os.path.basename(Output_Second_Ohm_FileName)}) Voltage (V)')
axes[0].set_title(f'Voltage Cross Plot(Linear)\nFirst Data Count = {Both_First_data.size()}\n Second Data Count = {Both_Second_data.size()}\nOverlap Data Count = {len(Overlap_First_data_V_sorted_positive_positive)+len(Overlap_First_data_V_sorted_positive_negative)+len(Overlap_First_data_V_sorted_negative_negative)+len(Overlap_First_data_V_sorted_negative_positive)}')
axes[0].legend(loc='upper left')
#--
# 子圖2
#--
# 繪製資料點
Overlap_First_data_V_sorted_positive_positive_abs_log10 = np.log10(np.abs(Overlap_First_data_V_sorted[(Overlap_First_data_V_sorted > 0) & (Overlap_Second_data_V_sorted > 0)]))
Overlap_Second_data_V_sorted_positive_positive_abs_log10 = np.log10(np.abs(Overlap_Second_data_V_sorted[(Overlap_First_data_V_sorted > 0) & (Overlap_Second_data_V_sorted > 0)]))
axes[1].scatter(Overlap_First_data_V_sorted_positive_positive_abs_log10, Overlap_Second_data_V_sorted_positive_positive_abs_log10, alpha=0.5, s=5, c='blue',label=f'1+2+({len(Overlap_First_data_V_sorted_positive_positive_abs_log10)})')
Overlap_First_data_V_sorted_positive_negative_abs_log10 = np.log10(np.abs(Overlap_First_data_V_sorted[(Overlap_First_data_V_sorted > 0) & (Overlap_Second_data_V_sorted < 0)]))
Overlap_Second_data_V_sorted_positive_negative_abs_log10 = np.log10(np.abs(Overlap_Second_data_V_sorted[(Overlap_First_data_V_sorted > 0) & (Overlap_Second_data_V_sorted < 0)]))
axes[1].scatter(Overlap_First_data_V_sorted_positive_negative_abs_log10, Overlap_Second_data_V_sorted_positive_negative_abs_log10, alpha=0.5, s=5, c='lightblue',label=f'1+2-({len(Overlap_First_data_V_sorted_positive_negative_abs_log10)})')
Overlap_First_data_V_sorted_negative_negative_abs_log10 = np.log10(np.abs(Overlap_First_data_V_sorted[(Overlap_First_data_V_sorted < 0) & (Overlap_Second_data_V_sorted < 0)]))
Overlap_Second_data_V_sorted_negative_negative_abs_log10 = np.log10(np.abs(Overlap_Second_data_V_sorted[(Overlap_First_data_V_sorted < 0) & (Overlap_Second_data_V_sorted < 0)]))
axes[1].scatter(Overlap_First_data_V_sorted_negative_negative_abs_log10, Overlap_Second_data_V_sorted_negative_negative_abs_log10, alpha=0.5, s=5, c='red',label=f'1-2-({len(Overlap_First_data_V_sorted_negative_negative_abs_log10)})')
Overlap_First_data_V_sorted_negative_positive_abs_log10 = np.log10(np.abs(Overlap_First_data_V_sorted[(Overlap_First_data_V_sorted < 0) & (Overlap_Second_data_V_sorted > 0)]))
Overlap_Second_data_V_sorted_negative_positive_abs_log10 = np.log10(np.abs(Overlap_Second_data_V_sorted[(Overlap_First_data_V_sorted < 0) & (Overlap_Second_data_V_sorted > 0)]))
axes[1].scatter(Overlap_First_data_V_sorted_negative_positive_abs_log10, Overlap_Second_data_V_sorted_negative_positive_abs_log10, alpha=0.5, s=5, c='lightpink',label=f'1-2+({len(Overlap_First_data_V_sorted_negative_positive_abs_log10)})')
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
axes[1].set_xlabel(f'First ({os.path.basename(Output_First_Ohm_FileName)}) abs(Voltage) (Log10 V)')
axes[1].set_ylabel(f'Second ({os.path.basename(Output_Second_Ohm_FileName)}) abs(Voltage) (Log10 V)')
axes[1].set_title(f'Voltage Cross Plot(abs Log10)\nFirst Data Count = {Both_First_data.size()}\n Second Data Count = {Both_Second_data.size()}\nSelected Data Count = {len(Overlap_First_data_V_sorted_positive_positive_abs_log10)+len(Overlap_First_data_V_sorted_positive_negative_abs_log10)+len(Overlap_First_data_V_sorted_negative_negative_abs_log10)+len(Overlap_First_data_V_sorted_negative_positive_abs_log10)}')
axes[1].legend(loc='upper left')
#--
print(f'儲存Voltage圖片...')
Output_Png_FileName = temp_json_data["OutputFile04_Voltage_PNG_FileName"]
os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_Png_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存Voltage圖片...完成!')
#--------------------------------------------
#--------------------------------------------
# Cross Plot I
#--
temp_PNG_DPI = 100
temp_PNG_Width = 1280
temp_PNG_Height = 720
#--
# 建立畫布
fig, axes = plt.subplots(1, 2, figsize=((temp_PNG_Width / temp_PNG_DPI, temp_PNG_Height / temp_PNG_DPI)))
#--
# 子圖1
#--
# 繪製資料點
Overlap_First_data_I_sorted_positive_positive = Overlap_First_data_I_sorted[(Overlap_First_data_I_sorted > 0) & (Overlap_Second_data_I_sorted > 0)]
Overlap_Second_data_I_sorted_positive_positive = Overlap_Second_data_I_sorted[(Overlap_First_data_I_sorted > 0) & (Overlap_Second_data_I_sorted > 0)]
axes[0].scatter(Overlap_First_data_I_sorted_positive_positive, Overlap_Second_data_I_sorted_positive_positive, alpha=0.5, s=5, c='blue',label=f'1+2+({len(Overlap_First_data_I_sorted_positive_positive)})')
Overlap_First_data_I_sorted_positive_negative = Overlap_First_data_I_sorted[(Overlap_First_data_I_sorted > 0) & (Overlap_Second_data_I_sorted < 0)]
Overlap_Second_data_I_sorted_positive_negative = Overlap_Second_data_I_sorted[(Overlap_First_data_I_sorted > 0) & (Overlap_Second_data_I_sorted < 0)]
axes[0].scatter(Overlap_First_data_I_sorted_positive_negative, Overlap_Second_data_I_sorted_positive_negative, alpha=0.5, s=5, c='blue',label=f'1+2-({len(Overlap_First_data_I_sorted_positive_negative)})')
Overlap_First_data_I_sorted_negative_negative = Overlap_First_data_I_sorted[(Overlap_First_data_I_sorted < 0) & (Overlap_Second_data_I_sorted < 0)]
Overlap_Second_data_I_sorted_negative_negative = Overlap_Second_data_I_sorted[(Overlap_First_data_I_sorted < 0) & (Overlap_Second_data_I_sorted < 0)]
axes[0].scatter(Overlap_First_data_I_sorted_negative_negative, Overlap_Second_data_I_sorted_negative_negative, alpha=0.5, s=5, c='blue',label=f'1-2-({len(Overlap_First_data_I_sorted_negative_negative)})')
Overlap_First_data_I_sorted_negative_positive = Overlap_First_data_I_sorted[(Overlap_First_data_I_sorted < 0) & (Overlap_Second_data_I_sorted > 0)]
Overlap_Second_data_I_sorted_negative_positive = Overlap_Second_data_I_sorted[(Overlap_First_data_I_sorted < 0) & (Overlap_Second_data_I_sorted > 0)]
axes[0].scatter(Overlap_First_data_I_sorted_negative_positive, Overlap_Second_data_I_sorted_negative_positive, alpha=0.5, s=5, c='blue',label=f'1-2+({len(Overlap_First_data_I_sorted_negative_positive)})')
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
axes[0].set_xlabel(f'First ({os.path.basename(Output_First_Ohm_FileName)}) Current (A)')
axes[0].set_ylabel(f'Second ({os.path.basename(Output_Second_Ohm_FileName)}) Current (A)')
axes[0].set_title(f'Current Cross Plot(Linear)\nFirst Data Count = {Both_First_data.size()}\n Second Data Count = {Both_Second_data.size()}\nSelected Data Count = {len(Overlap_First_data_I_sorted_positive_positive)+len(Overlap_First_data_I_sorted_positive_negative)+len(Overlap_First_data_I_sorted_negative_negative)+len(Overlap_First_data_I_sorted_negative_positive)}')
axes[0].legend(loc='upper left')
#--
# 子圖2
#--
# 繪製資料點
Overlap_First_data_I_sorted_positive_positive_abs_log10 = np.log10(np.abs(Overlap_First_data_I_sorted[(Overlap_First_data_I_sorted > 0) & (Overlap_Second_data_I_sorted > 0)]))
Overlap_Second_data_I_sorted_positive_positive_abs_log10 = np.log10(np.abs(Overlap_Second_data_I_sorted[(Overlap_First_data_I_sorted > 0) & (Overlap_Second_data_I_sorted > 0)]))
axes[1].scatter(Overlap_First_data_I_sorted_positive_positive_abs_log10, Overlap_Second_data_I_sorted_positive_positive_abs_log10, alpha=0.5, s=5, c='blue',label=f'1+2+({len(Overlap_First_data_I_sorted_positive_positive_abs_log10)})')
Overlap_First_data_I_sorted_positive_negative_abs_log10 = np.log10(np.abs(Overlap_First_data_I_sorted[(Overlap_First_data_I_sorted > 0) & (Overlap_Second_data_I_sorted < 0)]))
Overlap_Second_data_I_sorted_positive_negative_abs_log10 = np.log10(np.abs(Overlap_Second_data_I_sorted[(Overlap_First_data_I_sorted > 0) & (Overlap_Second_data_I_sorted < 0)]))
axes[1].scatter(Overlap_First_data_I_sorted_positive_negative_abs_log10, Overlap_Second_data_I_sorted_positive_negative_abs_log10, alpha=0.5, s=5, c='lightblue',label=f'1+2-({len(Overlap_First_data_I_sorted_positive_negative_abs_log10)})')
Overlap_First_data_I_sorted_negative_negative_abs_log10 = np.log10(np.abs(Overlap_First_data_I_sorted[(Overlap_First_data_I_sorted < 0) & (Overlap_Second_data_I_sorted < 0)]))
Overlap_Second_data_I_sorted_negative_negative_abs_log10 = np.log10(np.abs(Overlap_Second_data_I_sorted[(Overlap_First_data_I_sorted < 0) & (Overlap_Second_data_I_sorted < 0)]))
axes[1].scatter(Overlap_First_data_I_sorted_negative_negative_abs_log10, Overlap_Second_data_I_sorted_negative_negative_abs_log10, alpha=0.5, s=5, c='red',label=f'1-2-({len(Overlap_First_data_I_sorted_negative_negative_abs_log10)})')
Overlap_First_data_I_sorted_negative_positive_abs_log10 = np.log10(np.abs(Overlap_First_data_I_sorted[(Overlap_First_data_I_sorted < 0) & (Overlap_Second_data_I_sorted > 0)]))
Overlap_Second_data_I_sorted_negative_positive_abs_log10 = np.log10(np.abs(Overlap_Second_data_I_sorted[(Overlap_First_data_I_sorted < 0) & (Overlap_Second_data_I_sorted > 0)]))
axes[1].scatter(Overlap_First_data_I_sorted_negative_positive_abs_log10, Overlap_Second_data_I_sorted_negative_positive_abs_log10, alpha=0.5, s=5, c='lightpink',label=f'1-2+({len(Overlap_First_data_I_sorted_negative_positive_abs_log10)})')
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
axes[1].set_xlabel(f'First ({os.path.basename(Output_First_Ohm_FileName)}) abs(Current) (Log10 A)')
axes[1].set_ylabel(f'Second ({os.path.basename(Output_Second_Ohm_FileName)}) abs(Current) (Log10 A)')
axes[1].set_title(f'Current Cross Plot(abs Log10)\nFirst Data Count = {Both_First_data.size()}\n Second Data Count = {Both_Second_data.size()}\nSelected Data Count = {len(Overlap_First_data_I_sorted_positive_positive)+len(Overlap_First_data_I_sorted_positive_negative)+len(Overlap_First_data_I_sorted_negative_negative)+len(Overlap_First_data_I_sorted_negative_positive)}')
axes[1].legend(loc='upper left')
#--
print(f'儲存Current圖片...')
Output_Png_FileName = temp_json_data["OutputFile05_Current_PNG_FileName"]
os.makedirs(os.path.dirname(Output_Png_FileName), exist_ok=True)
plt.tight_layout() 
plt.savefig(Output_Png_FileName, dpi=temp_PNG_DPI)
plt.close()
print(f'儲存Current圖片...完成!')
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
print(f"花費時間: {hours:02d}時 {minutes:02d}分 {seconds:02d}.{milliseconds:03d}秒")
print('--')
#--------------------------------------------
```
