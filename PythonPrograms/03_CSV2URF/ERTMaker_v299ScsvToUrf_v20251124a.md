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
}
```
+ 程式碼:
```python
#**************************************************************************
#   Name: ERTMaker_v299ScsvToUrf.py
#   Copyright: 
#   Author: HsiupoYeh
#   Version: v20251124a
#   Description: 讀取 JSON 設定檔，將單源放電檔案(.v299S.csv)解算為URF檔案。
#                必須讀取指定位置「Input_ERTMaker_v299ScsvToUrf/v299ScsvToUrf.json」的JOSN檔案。
#                設定檔(v299ScsvToUrf.json)中有說明各參數意義。
#**************************************************************************

```
