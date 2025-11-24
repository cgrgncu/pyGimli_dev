# v299ScsvToUrf(ERTMaker_v299ScsvToUrf_v20251124a.py)
+ 作者: HsiupoYeh
+ 更新日期: 2025-11-24

### 版本
+ ERTMaker_v299ScsvToUrf_v20251124a.py
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
\Lite_PyGimli_Env\ERTMaker_v299ScsvToUrf_v20251124a.py
\Lite_PyGimli_Env\RUN_ERTMaker_v299ScsvToUrf_v20251124a.bat
```
+ 也可以放一些必要的輸入範例檔案(並非每個都有用到):
```

```
+ 呼叫方式: 運行「RUN_ERTMaker_SimulateForTimeSeries_v20251101a.bat」檔案，檔案內容:
```batch
.\PythonEnv\Python.exe ERTMaker_SimulateForTimeSeries_v20251101a.py
PAUSE
```

### 主程式(ERTMaker_v299ScsvToUrf_v20251124a.py)
+ 設定檔(v299ScsvToUrf.json):
```json
{
"v299ScsvToUrf_Version":"v20251124a",
"v299ScsvToUrf_Author":"HsiupoYeh",
"InputFile01_Geo_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile01_Geo_FileName":"Input_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel.geo",
"InputFile02_v299Scsv_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile02_v299Scsv_FileName":"Input_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.csv",
"OutputFile01_Urf_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile01_Urf_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.urf",
"OutputFile02_Urf_SNR_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"OutputFile02_Urf_SNR_FileName":"Output_ERTMaker_v299ScsvToUrf/XP1_SyntheticModel_CurrentFlowLinesAB.v299S.SNR.urf"
}
```
+ 程式碼:
```python
#**************************************************************************
#   Name: ERTMaker_v299ScsvToUrf_v20251124a.py
#   Copyright: 
#   Author: HsiupoYeh
#   Version: v20251124a
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
#--------------------------------------------
# 取得運行開始時間
program_start_time = datetime.now()
#--------------------------------------------
# 版本資訊
VERSION_STR = 'v20251124a'
ALGORITHM_VERSION_STR = 'HsiupoYeh2025'
# 提示畫面
print('************************************************************')
print(f'* ERTMaker_v299ScsvToUrf_v{VERSION_STR}')
print('* Author: HsiupoYeh')
print(f'* Version: {VERSION_STR}')
print(f'* Algorithm_Version: {ALGORITHM_VERSION_STR}')
print('************************************************************')
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
print('載入GEO檔案...')
Input_Geo_FileName = temp_json_data["InputFile01_Geo_FileName"]
temp_geo_char_data = "" # 初始化變數
try:
    # 使用 'r' 模式讀取檔案，'t' 表示文字模式 (預設)，'utf-8' 為常見編碼
    # 使用 'with open(...)' 確保檔案在讀取完成後會自動關閉
    with open(Input_Geo_FileName, 'r', encoding='utf-8') as f1:
        # 讀取整個檔案的內容並儲存為單一字串
        temp_geo_char_data = f1.read()    
    print('讀取GEO檔案...完成!')    
except FileNotFoundError:
    print(f'開啟檔案失敗! return! 檔案名稱: {Input_Geo_FileName}.')
    exit(1) # 回傳1表示一般性錯誤    
except Exception as e:
    print(f'讀取檔案時發生其他錯誤: {e}')
    exit(1) # 回傳1表示一般性錯誤    
#--------------------------------------------
#--------------------------------------------
print('載入CSV檔案...')
Input_v299Scsv_FileName = temp_json_data["InputFile02_v299Scsv_FileName"]
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
#--------------------------------------------
print('輸出Urf檔案...')
Output_Urf_FileName = temp_json_data["OutputFile01_Urf_FileName"]
os.makedirs(os.path.dirname(Output_Urf_FileName), exist_ok=True)
# 寫入 Urf 檔案
try:
    with open(Output_Urf_FileName, 'w', encoding='utf-8') as f1:
        # 寫「*.geo」資訊
        f1.write(temp_geo_char_data)        
        # 檢查最後一個字元是否為換行符號 (\n)
        if not temp_geo_char_data.endswith('\n'):
            f1.write('\n')            
        for row in urf_measurement_data:
            # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以逗號分隔，最後換行
            f1.write(f"{int(row[0])},{int(row[1])},{int(row[2])},{int(row[3])},{row[4]:.5f},{row[5]:.3f},0\n")            
except IOError as e:
    print(f'開啟檔案失敗! return! 檔案名稱: {Output_Urf_FileName}.')
    print(f'錯誤: {e}')
    exit(1) # 回傳1表示一般性錯誤
print('輸出Urf檔案...結束!')
print('--')
print('輸出Urf_SNR檔案...')
Output_Urf_SNR_FileName = temp_json_data["OutputFile02_Urf_SNR_FileName"]
os.makedirs(os.path.dirname(Output_Urf_SNR_FileName), exist_ok=True)
# 寫入 Urf 檔案
try:
    with open(Output_Urf_SNR_FileName, 'w', encoding='utf-8') as f1:
        # 寫「*.geo」資訊
        f1.write(temp_geo_char_data)        
        # 檢查最後一個字元是否為換行符號 (\n)
        if not temp_geo_char_data.endswith('\n'):
            f1.write('\n')            
        for row in urf_measurement_data:
            # 格式化輸出：4個整數, 3個浮點數 (5位精度), 以逗號分隔，最後換行
            f1.write(f"{int(row[0])},{int(row[1])},{int(row[2])},{int(row[3])},{row[4]:.5f},{row[5]:.3f},{row[6]:.2f}\n")            
except IOError as e:
    print(f'開啟檔案失敗! return! 檔案名稱: {Output_Urf_SNR_FileName}.')
    print(f'錯誤: {e}')
    exit(1) # 回傳1表示一般性錯誤
print('輸出Urf檔案...結束!')
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
