# SimulateForTimeSeries
+ 作者: HsiupoYeh
+ 更新日期: 2025-11-01

### 版本
+ RUN_ERTMaker_SimulateForTimeSeries_v20251031a.py
  + 單執行緒，重複使用繪圖似乎記憶體控管很差。

### 開發環境
+ Windows 10
+ 使用Lite_PyGimli_Env (pygimli==1.5.4)
  + https://github.com/cgrgncu/pyGimli_dev/releases/tag/Lite_PyGimli_Env
+ 測試位置:
```
\Lite_PyGimli_Env\PythonEnv\
\Lite_PyGimli_Env\Input_ERTMaker_SimulateForTimeSeries\Configs\...(許多檔案)
\Lite_PyGimli_Env\Input_ERTMaker_SimulateForTimeSeries\SimulateForTimeSeriesSettings.json
\Lite_PyGimli_Env\ERTMaker_SimulateForTimeSeries_v20251031a.py
\Lite_PyGimli_Env\RUN_ERTMaker_SimulateForTimeSeries_v20251031a.bat
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
+ 呼叫方式: 運行「RUN_ERTMaker_SimulateForTimeSeries_v20251031a.bat」檔案，檔案內容:
```batch
.\PythonEnv\Python.exe RUN_ERTMaker_SimulateForTimeSeries_v20251031a.py
PAUSE
```

### 主程式(RUN_ERTMaker_SimulateForTimeSeries_v20251031a.py)
+ 設定檔(CreateMeshSettings.json):
```json

```
+ 程式碼:
```python
```
