# SimulateForTimeSeries(ERTMaker_SimulateForTimeSeries_v20251101a.py)
+ 作者: HsiupoYeh
+ 更新日期: 2025-11-01

### 版本
+ ERTMaker_SimulateForTimeSeries_v20251101a.py
  + 多執行緒(multiprocessing)，使用多核心分開繪圖，可避免記憶體無法正常釋放。
  + 但此版本使用多核心重複載入檔案，將影響工作效率，建議只有需要繪圖才使用此版本。

### 開發環境
+ Windows 10
+ 使用Lite_PyGimli_Env (pygimli==1.5.4)
  + https://github.com/cgrgncu/pyGimli_dev/releases/tag/Lite_PyGimli_Env
+ 測試位置:
```
\Lite_PyGimli_Env\PythonEnv\
\Lite_PyGimli_Env\Input_ERTMaker_SimulateForTimeSeries\Configs\...(許多檔案)
\Lite_PyGimli_Env\Input_ERTMaker_SimulateForTimeSeries\SimulateForTimeSeriesSettings.json
\Lite_PyGimli_Env\ERTMaker_SimulateForTimeSeries_v20251101a.py
\Lite_PyGimli_Env\RUN_ERTMaker_SimulateForTimeSeries_v20251101a.bat
```
+ 也可以放一些必要的輸入範例檔案(並非每個都有用到):
```
\Lite_PyGimli_Env\Input_ERTMaker_SimulateForTimeSeries\XP1_SyntheticModel.geo
\Lite_PyGimli_Env\Input_ERTMaker_SimulateForTimeSeries\XP1_SyntheticModel.ohm
\Lite_PyGimli_Env\Input_ERTMaker_SimulateForTimeSeries\XP1_SyntheticModel.png
\Lite_PyGimli_Env\Input_ERTMaker_SimulateForTimeSeries\XP1_SyntheticModel.trn
\Lite_PyGimli_Env\Input_ERTMaker_SimulateForTimeSeries\XP1_SyntheticModel.vtk
\Lite_PyGimli_Env\Input_ERTMaker_SimulateForTimeSeries\XP1_SyntheticModelBCMarkers.json
```
+ 呼叫方式: 運行「RUN_ERTMaker_SimulateForTimeSeries_v20251101a.bat」檔案，檔案內容:
```batch
.\PythonEnv\Python.exe ERTMaker_SimulateForTimeSeries_v20251101a.py
PAUSE
```

### 主程式(ERTMaker_SimulateForTimeSeries_v20251101a.py)
+ 設定檔(CreateMeshSettings.json):
```json
{
"SimulateForTimeSeriesSettings_Version":"v20251101a",
"SimulateForTimeSeriesSettings_Author":"HsiupoYeh",
"InputFile01_MeshVTK_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile01_MeshVTK_FileName":"Input_ERTMaker_SimulateForTimeSeries/XP1_SyntheticModel.vtk",
"InputFile02_MeshBCMarkersJSON_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile02_MeshBCMarkersJSON_FileName":"Input_ERTMaker_SimulateForTimeSeries/XP1_SyntheticModelBCMarkers.json",
"InputFile03_OHM_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile03_OHM_FileName":"Input_ERTMaker_SimulateForTimeSeries/XP1_SyntheticModel.ohm",
"InputFile04_CurrentMode_FileName_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。",
"InputFile04_CurrentMode_FileName":"Input_ERTMaker_SimulateForTimeSeries/Configs/v299_S64NCurrentMode/Current Mode.csv",
"MeshPNG_DPI_Readme":"圖片輸出的DPI，建議:100。",
"MeshPNG_DPI":100,
"MeshPNG_Width_Readme":"圖片輸出的寬度，建議:1280。",
"MeshPNG_Width":1280,
"MeshPNG_Height_Readme":"圖片輸出的寬度，建議:720。",
"MeshPNG_Height":720,
"MeshPNG_Title_Readme":"圖片的標題。",
"MeshPNG_Title":"XP1 Synthetic Model",
"MeshPNG_ColorBarResistivityMin_Readme":"電阻率色階下限，線性數值，必為正數。建議:1。",
"MeshPNG_ColorBarResistivityMin":1,
"MeshPNG_ColorBarResistivityMax_Readme":"電阻率色階下限，線性數值，必為正數。建議:10000。",
"MeshPNG_ColorBarResistivityMax":10000,
"OutputFolderPath_Readme":"不論Winodws或Linux或MAC作業系統一律使用「/」描述檔案路徑與資料夾路徑。務必要使用「/」在結尾，表示資料夾。",
"OutputFolderPath":"Output_ERTMaker_SimulateForTimeSeries/",
"Output_MainFileName_Readme":"會產生很多檔案，這些檔案的主要檔名。",
"Output_MainFileName":"XP1_SyntheticModel",
"Output_PNG_Enable_Readme":"是否啟用輸出PNG。若要啟用請填入字串Yes，若不啟用請填入字串No。輸出PNG每張圖約耗時",
"Output_PNG_Enable":"Yes",
"ElectrodeIndexAB_TxVoltageMax_Readme":"AB電極的發射器最大電壓，單位[V]",
"ElectrodeIndexAB_TxVoltageMax":400,
"ElectrodeIndexAB_TxCurrentMax_Readme":"AB電極的發射器最大電流，單位[A]",
"ElectrodeIndexAB_TxCurrentMax":0.5,
"ElectrodeIndexAB_Resistance_Readme":"AB電極的接地電阻，單位[Ohm]",
"ElectrodeIndexAB_Resistance":1000
}
```
+ 程式碼:
```python
#**************************************************************************
#   Name: ERTMaker_SimulateForTimeSeries.py
#   Copyright: 
#   Author: HsiupoYeh
#   Version: v20251031a
#   Description: 讀取 JSON 設定檔，建立電極與包含邊界填充區域的二維地形網格，
#                並設定單元 (Cell) 和邊界 (Boundary) Marker，輸出為
#                PNG, VTK, JSON, GEO, TRN 檔案。
#                必須讀取指定位置「Input_ERTMaker_CreateAndModifyMesh/CreateAndModifyMeshSettings.json」的JOSN檔案。
#                設定檔(CreateAndModifyMeshSettings.json)中有說明各參數意義。
#**************************************************************************
import json
import os
import shutil
import numpy as np
from scipy.interpolate import interp1d
import pygimli as pg
import matplotlib.pyplot as plt
from pygimli.physics import ert
from pygimli.viewer.mpl import drawStreams
#--------------------------------------------
print('--')
print('ERTMaker_SimulateForTimeSeries運作開始!')
#--------------------------------------------
# 軟體說明
ERTMaker_Info = f'ERTMaker v1.0(Author: HsiupoYeh) Powered by PyGIMLi v{pg.__version__}'
print(ERTMaker_Info)
#--------------------------------------------
# 指定檔案名稱
json_file_name = 'Input_ERTMaker_SimulateForTimeSeries/SimulateForTimeSeriesSettings.json'
#--------------------------------------------
# 讀取檔案
# 開啟並讀取 JSON 檔案
print("讀取 .json 檔...")
with open(json_file_name, 'r', encoding='utf-8') as json_file:
    temp_json_data = json.load(json_file)
print("讀取 .json 檔...完成!")
#--------------------------------------------
# 若指定輸出檔案資料夾不存在，則創建資料夾，若存在，則刪除。
#--
# TempFile01_BasicMeshPNG_FileName
temp_foldername=temp_json_data["OutputFolderPath"]
if os.path.exists(temp_foldername):
    # 使用 shutil.rmtree() 遞迴刪除資料夾及其所有內容
    shutil.rmtree(temp_foldername)
os.makedirs(temp_foldername, exist_ok=True)
#--
#--------------------------------------------

#--------------------------------------------
# 建立網格
mesh = pg.Mesh(2)
# 使用計算出的節點座標創建網格
print("讀取 .vtk 檔...")
mesh.load(temp_json_data["InputFile01_MeshVTK_FileName"])
print("讀取 .vtk 檔...完成!")
# 確保正確性，重新計算log10的電阻率
mesh['Resistivity_(log10)'] = np.log10(mesh['Resistivity'])
#--------------------------------------------
# 讀取並設定 MeshBCMarkers
print("讀取 MeshBCMarkersJSON 檔...")
# 開啟並讀取 JSON 檔案
with open(temp_json_data["InputFile02_MeshBCMarkersJSON_FileName"], 'r', encoding='utf-8') as json_file:
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
#--------------------------------------------
# 讀取Ohm檔案
print("載入OHM檔案...")
# Load data
data = ert.load(temp_json_data["InputFile03_OHM_FileName"])
print("載入OHM檔案...完成!")
# 展示並確認資料內容:
print('觀測資料(ohm檔案)資訊:')
print(data)
ABMN_count=data.size()
print('檢查ABMN數量...')
if ABMN_count>1000 :
    print('錯誤!觀測資料數量超過指定最大處理數量(ABMN_count > 1000)')
    exit(1)
print('檢查ABMN數量...完成!')
#--------------------------------------------
# 讀取Current Mode檔案
print("載入CurrentMode檔案...")
# Load data
CurrentMode_array = np.loadtxt(temp_json_data["InputFile04_CurrentMode_FileName"], delimiter=',', dtype=int)
print("載入CurrentMode檔案...完成!")
# 展示並確認資料內容:
print('CurrentMode資訊:')
#print(CurrentMode_array)
CurrentMode_array_channels, CurrentMode_array_events = CurrentMode_array.shape
print(f'頻道數量 = {CurrentMode_array_channels}, 事件數量 = {CurrentMode_array_events}')
#--------------------------------------------
if CurrentMode_array_channels  != 64:
    print("錯誤!頻道數量不是64!")
    exit()
if CurrentMode_array_events % 3 != 0:
    # 執行不符合條件時的操作 (例如：印出錯誤訊息)
    print("錯誤!事件數量不是3的倍數!")
    exit()
#--
# 準備空的想要的AB列表
ElectrodeIndexAB_List = []
# 取出代表性事件
new_CurrentMode_array=CurrentMode_array[:, 0::3].T  
# 迴圈填入AB列表
for event_index, channel_value_array in enumerate(new_CurrentMode_array):
    idx_1 = np.where(channel_value_array == 1)[0]
    if idx_1.size > 0:
        channel_number_1 = idx_1[0] + 1
        #print(f"找到第一個 1 位於頻道: {channel_number_1}")        
    else:
        print('錯誤!找不到目標1。')
        exit()
    idx_2 = np.where(channel_value_array == 2)[0]
    if idx_2.size > 0:
        channel_number_2 = idx_2[0] + 1
        #print(f"找到第一個 2 位於頻道: {channel_number_2}")        
    else:
        print('錯誤!找不到目標2。')
        exit()
    ElectrodeIndexAB_List.append([channel_number_1, channel_number_2])
#print(ElectrodeIndexAB_List)   
# 轉換成np陣列
ab_array=np.array(ElectrodeIndexAB_List)
print(ab_array)
#--------------------------------------------
# 運行順推，只計算各感應器位置的電位分布
print('運行順推...')
electric_potential = ert.simulate(mesh, scheme=data, res=mesh['Resistivity'], calcOnly=True, returnFields=True, verbose=False)
print('運行順推...完成!')
#--
# 轉換成np陣列
#electric_potential = np.array(electric_potential)
#--
# 使用 np.save 儲存數據
#output_npy_filename = 'electric_potential_RMatrix_data.npy'
#np.save(output_npy_filename, electric_potential)
#--------------------------------------------
print(f'感應器位置數量: {data.sensorCount()}')
sensor_positions = data.sensorPositions()
print(sensor_positions)
#--------------------------------------------
# Ohm檔案的索引編號是從1開始，PyGimli內建的是從0開始，所以調整一下
if ab_array.size == 0 :
    print('AB陣列數量: 0')
else :
    ab_array=ab_array-1
    print(f'AB陣列數量: {len(ab_array[:,1])}')
#--------------------------------------------
# 依序模擬放電情境
for i_ab_idx, ab in enumerate(ab_array):
    print(f'AB電極對 #{i_ab_idx+1}/{len(ab_array[:,1])} 索引: A={ab[0]+1}(X={sensor_positions[ab[0]][0]:.2f},Z={sensor_positions[ab[0]][2]:.2f}), B={ab[1]+1}(X={sensor_positions[ab[1]][0]:.2f},Z={sensor_positions[ab[1]][2]:.2f})')
    pointA = [sensor_positions[ab[0]][0],sensor_positions[ab[0]][2]]
    pointB = [sensor_positions[ab[1]][0],sensor_positions[ab[1]][2]]
    pointRef = [sensor_positions[-1][0],sensor_positions[-1][2]]
    #--
    print(f'無窮遠處電位為0[V]時，第{i_ab_idx+1}組電極對，A注入B回收的電位分布圖...')    
    #--------------------------------------------
    # 展示並儲存(不希望使用互動式視窗，將立即關閉plt) 
    # 目前是 CurrentFlowLines AB
    temp_output_filename = os.path.join(temp_json_data['OutputFolderPath'],f'{temp_json_data["OutputPNG_MainFileName"]}_CurrentFlowLinesAB_{(i_ab_idx+1):04d}.png')
    ax, _ = pg.show(mesh, data=mesh['Resistivity_(log10)'], 
        markers=False,
        showMesh=True,
        cMap='jet', 
        cMin=np.log10(temp_json_data['MeshPNG_ColorBarResistivityMin']),
        cMax=np.log10(temp_json_data['MeshPNG_ColorBarResistivityMax']),
        label="Resistivity(log10)(Ohm-m)",
        figsize=(temp_json_data['MeshPNG_Width'] / temp_json_data['MeshPNG_DPI'], temp_json_data['MeshPNG_Height'] / temp_json_data['MeshPNG_DPI']), 
        dpi=temp_json_data['MeshPNG_DPI'])
    #--
    # 電流方向與電場梯度相反，提供負的電場梯度
    potential = electric_potential[ab[0]]-electric_potential[ab[1]]
    neg_potential = -potential
    drawStreams(
        ax,
        mesh,
        neg_potential,
        coarseMesh=mesh,
        color='Black'
    )
    #--
    # 繪製所有感應器位置
    ax.plot(
        pg.x(sensor_positions),
        pg.z(sensor_positions), 
        marker="o", 
        linestyle='None', 
        fillstyle='none', 
        color='magenta', 
        markersize=6,
        label='Electrode Nodes')
    # 繪製並標註點 A
    ax.plot(pointA[0], pointA[1], marker=".", color='red', ms=10)
    ax.annotate('A', xy=pointA, ha="center", fontsize=10,
                bbox=dict(boxstyle="round", fc=(0.8, 0.8, 0.8), ec='red'),
                xytext=(0, 20), textcoords='offset points',
                arrowprops=dict(arrowstyle="wedge, tail_width=.5", fc='red', ec='red', patchA=None, alpha=0.75))
    #--
    # 繪製並標註點 B
    ax.plot(pointB[0], pointB[1], marker=".", color='red', ms=10)
    ax.annotate('B', xy=pointB, ha="center", fontsize=10,
                bbox=dict(boxstyle="round", fc=(0.8, 0.8, 0.8), ec='red'),
                xytext=(0, 20), textcoords='offset points',
                arrowprops=dict(arrowstyle="wedge, tail_width=.5", fc='red', ec='red', patchA=None, alpha=0.75))
    #--
    R_AB = temp_json_data['ElectrodeIndexAB_Resistance'] 
    # 計算理論電流
    I_theory = temp_json_data['ElectrodeIndexAB_TxVoltageMax'] / R_AB    
    # 實際輸出電流 I_out 受 I_max 限制 ( 實際電流取 I_max 和 I_theory 中的最小值 )
    I_out = np.minimum(temp_json_data['ElectrodeIndexAB_TxCurrentMax'], I_theory)    
    # 實際輸出電壓 V_out
    V_out = I_out * R_AB  
    ax.set_title(f'CurrentFlowLines Map ElectrodePair(AB)#{i_ab_idx+1}/{len(ab_array[:,1])}:\n A=({pointA[0]:.2f},{pointA[1]:.2f}) B=({pointB[0]:.2f},{pointB[1]:.2f}) Tx={V_out}[V]/{I_out}[A] AB_Resistance={R_AB}[Ohm]',pad=15)  
    #--
    ax.set_xlabel('Distance (m)')
    ax.set_ylabel('Elevation (m)')
    ax.legend()
    ax.figure.text(0.98, 0.01, ERTMaker_Info, ha='right', va='bottom', fontsize=8, color='gray')
    #--
    # 調整邊界
    x_min, x_max = ax.get_xlim()
    y_min, y_max = ax.get_ylim()
    x_range = x_max - x_min
    y_range = y_max - y_min
    ax.set_ylim(y_min , y_max + 0.1 * y_range)
    # 存圖
    plt.tight_layout() 
    plt.savefig(temp_output_filename)
    plt.close()
    #--
    print(f'無窮遠處電位為0[V]時，第{i_ab_idx+1}組電極對，A注入B回收的電位分布圖的電流方向圖...繪製完成!')
    #--
    print(f'無窮遠處電位為0[V]時，第{i_ab_idx+1}組電極對，模擬R2MS_Lite量測結果...')
    # 輸出CSV檔案
    temp_output_filename = os.path.join(temp_json_data['OutputFolderPath'],f'{temp_json_data["OutputPNG_MainFileName"]}_CurrentFlowLinesAB_{(i_ab_idx+1):04d}.v299S.csv')
    #print('儲存CSV檔案...')
    with open(temp_output_filename, 'w', encoding='utf-8') as f:
        #--
        # 前方固定內容
        f.write('Time[ms](R2MS_Lite_v299csv_v20240510a),Tx_Voltage[V],Rx_Current[A],Mode_Index,Electrode_Status(v/+/-),CH01_Voltage[V],CH01_Current[A],CH02_Voltage[V],CH02_Current[A],CH03_Voltage[V],CH03_Current[A],CH04_Voltage[V],CH04_Current[A],CH05_Voltage[V],CH05_Current[A],CH06_Voltage[V],CH06_Current[A],CH07_Voltage[V],CH07_Current[A],CH08_Voltage[V],CH08_Current[A],CH09_Voltage[V],CH09_Current[A],CH10_Voltage[V],CH10_Current[A],CH11_Voltage[V],CH11_Current[A],CH12_Voltage[V],CH12_Current[A],CH13_Voltage[V],CH13_Current[A],CH14_Voltage[V],CH14_Current[A],CH15_Voltage[V],CH15_Current[A],CH16_Voltage[V],CH16_Current[A],CH17_Voltage[V],CH17_Current[A],CH18_Voltage[V],CH18_Current[A],CH19_Voltage[V],CH19_Current[A],CH20_Voltage[V],CH20_Current[A],CH21_Voltage[V],CH21_Current[A],CH22_Voltage[V],CH22_Current[A],CH23_Voltage[V],CH23_Current[A],CH24_Voltage[V],CH24_Current[A],CH25_Voltage[V],CH25_Current[A],CH26_Voltage[V],CH26_Current[A],CH27_Voltage[V],CH27_Current[A],CH28_Voltage[V],CH28_Current[A],CH29_Voltage[V],CH29_Current[A],CH30_Voltage[V],CH30_Current[A],CH31_Voltage[V],CH31_Current[A],CH32_Voltage[V],CH32_Current[A],CH33_Voltage[V],CH33_Current[A],CH34_Voltage[V],CH34_Current[A],CH35_Voltage[V],CH35_Current[A],CH36_Voltage[V],CH36_Current[A],CH37_Voltage[V],CH37_Current[A],CH38_Voltage[V],CH38_Current[A],CH39_Voltage[V],CH39_Current[A],CH40_Voltage[V],CH40_Current[A],CH41_Voltage[V],CH41_Current[A],CH42_Voltage[V],CH42_Current[A],CH43_Voltage[V],CH43_Current[A],CH44_Voltage[V],CH44_Current[A],CH45_Voltage[V],CH45_Current[A],CH46_Voltage[V],CH46_Current[A],CH47_Voltage[V],CH47_Current[A],CH48_Voltage[V],CH48_Current[A],CH49_Voltage[V],CH49_Current[A],CH50_Voltage[V],CH50_Current[A],CH51_Voltage[V],CH51_Current[A],CH52_Voltage[V],CH52_Current[A],CH53_Voltage[V],CH53_Current[A],CH54_Voltage[V],CH54_Current[A],CH55_Voltage[V],CH55_Current[A],CH56_Voltage[V],CH56_Current[A],CH57_Voltage[V],CH57_Current[A],CH58_Voltage[V],CH58_Current[A],CH59_Voltage[V],CH59_Current[A],CH60_Voltage[V],CH60_Current[A],CH61_Voltage[V],CH61_Current[A],CH62_Voltage[V],CH62_Current[A],CH63_Voltage[V],CH63_Current[A],CH64_Voltage[V],CH64_Current[A]\n')
        #--
        # 組成一列文字
        temp_Electrode_Status='vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv'
        # 要更換的索引
        index_to_change = ab[0]+1
        # 更換為+
        temp_Electrode_Status = temp_Electrode_Status[:index_to_change-1] + '+' + temp_Electrode_Status[index_to_change:]
        # 要更換的索引
        index_to_change = ab[1]+1
        # 更換為-
        temp_Electrode_Status = temp_Electrode_Status[:index_to_change-1] + '-' + temp_Electrode_Status[index_to_change:]
        #--
        # 準備資料        
        delta_V_All = np.zeros(64)
        delta_A_All = np.zeros(64)
        # 修改
        number_to_modify = data.sensorCount()
        if number_to_modify > 64:
            number_to_modify = 64
        for i_idx in range(number_to_modify):
            pointM = [sensor_positions[i_idx][0],sensor_positions[i_idx][2]]
            delta_V_All[i_idx] = potential[mesh.findNearestNode(pg.RVector(pointM))]-potential[mesh.findNearestNode(pg.RVector(pointRef))]
            delta_V_All[i_idx] = delta_V_All[i_idx]*I_out
            if pointM == pointA:
                delta_V_All[i_idx]=0
                delta_A_All[i_idx]=I_out
            if pointM == pointB:
                delta_V_All[i_idx]=0
                delta_A_All[i_idx]=-I_out        
        # 填入
        combined_data_string = ",".join(f"{item:.8f}" for v, a in zip(delta_V_All, delta_A_All) for item in (v, a))
        #--
        # 寫入
        line = f'0.1,{V_out},{I_out},0, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'0.2,{V_out},{I_out},0, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'0.3,{V_out},{I_out},0, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'0.4,{V_out},{I_out},0, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'0.5,{V_out},{I_out},0, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'0.6,{V_out},{I_out},0, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'0.7,{V_out},{I_out},0, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'0.8,{V_out},{I_out},0, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'0.9,{V_out},{I_out},0, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'1.0,{V_out},{I_out},0, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        #--
        # 組成一列文字
        temp_Electrode_Status='vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv'
        # 要更換的索引
        index_to_change = ab[0]+1
        # 更換為+
        temp_Electrode_Status = temp_Electrode_Status[:index_to_change-1] + '-' + temp_Electrode_Status[index_to_change:]
        # 要更換的索引
        index_to_change = ab[1]+1
        # 更換為-
        temp_Electrode_Status = temp_Electrode_Status[:index_to_change-1] + '+' + temp_Electrode_Status[index_to_change:]
        #--
        # 準備資料        
        delta_V_All = np.zeros(64)
        delta_A_All = np.zeros(64)
        # 修改
        number_to_modify = data.sensorCount()
        if number_to_modify > 64:
            number_to_modify = 64
        for i_idx in range(number_to_modify):
            pointM = [sensor_positions[i_idx][0],sensor_positions[i_idx][2]]
            delta_V_All[i_idx] = potential[mesh.findNearestNode(pg.RVector(pointM))]-potential[mesh.findNearestNode(pg.RVector(pointRef))]
            delta_V_All[i_idx] = -delta_V_All[i_idx]*I_out
            if pointM == pointA:
                delta_V_All[i_idx]=0
                delta_A_All[i_idx]=-I_out
            if pointM == pointB:
                delta_V_All[i_idx]=0
                delta_A_All[i_idx]=I_out        
        # 填入
        combined_data_string = ",".join(f"{item:.8f}" for v, a in zip(delta_V_All, delta_A_All) for item in (v, a))
        #--
        # 寫入
        line = f'1.1,{V_out},{I_out},1, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'1.2,{V_out},{I_out},1, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'1.3,{V_out},{I_out},1, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'1.4,{V_out},{I_out},1, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'1.5,{V_out},{I_out},1, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'1.6,{V_out},{I_out},1, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'1.7,{V_out},{I_out},1, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'1.8,{V_out},{I_out},1, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'1.9,{V_out},{I_out},1, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'2.0,{V_out},{I_out},1, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        #--
        # 組成一列文字
        temp_Electrode_Status='vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv'
        #--
        # 準備資料        
        delta_V_All = np.zeros(64)
        delta_A_All = np.zeros(64)            
        # 填入
        combined_data_string = ",".join(f"{item:.8f}" for v, a in zip(delta_V_All, delta_A_All) for item in (v, a))
        #--
        # 寫入
        line = f'2.1,{V_out},{I_out},2, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'2.2,{V_out},{I_out},2, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'2.3,{V_out},{I_out},2, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'2.4,{V_out},{I_out},2, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'2.5,{V_out},{I_out},2, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'2.6,{V_out},{I_out},2, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'2.7,{V_out},{I_out},2, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'2.8,{V_out},{I_out},2, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'2.9,{V_out},{I_out},2, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        line = f'3.0,{V_out},{I_out},2, {temp_Electrode_Status},{combined_data_string}\n'
        f.write(line)
        #--
    #print('儲存CSV檔案...完成!')
    print(f'無窮遠處電位為0[V]時，第{i_ab_idx+1}組電極對，模擬R2MS_Lite量測結果...完成!') 
    #--    
#--------------------------------------------
print('ERTMaker_SimulateForTimeSeries運作結束!')
print('--')
#--------------------------------------------
```
