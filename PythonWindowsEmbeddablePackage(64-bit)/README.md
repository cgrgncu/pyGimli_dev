# PythonWindowsEmbeddablePackage(64-bit)
+ 作者: HsiupoYeh
+ 更新日期: 2025-09-14
+ 目標: 安裝Windows可用的PyGimli
  + Python版本: 3.12.7
  + PyGimli版本: 1.5.4


### Python
+ 官方網站:
  + https://www.python.org/
+ Windows版下載頁面:
  + https://www.python.org/downloads/windows/
+ 目標版本(Python 3.12.7)下載頁面:
  + https://www.python.org/downloads/release/python-3127/
+ 目標檔案:
  + Python 3.12.7 Windows embeddable package (64-bit)
    + https://www.python.org/ftp/python/3.12.7/python-3.12.7-embed-amd64.zip

### 步驟0
+ 在根目錄建立 **C:\PyGimli_Embed_Install** 資料夾
+ 在裡面再建立 **C:\PyGimli_Embed_Install\src** 資料夾
+ 下載 **python-3.12.7-embed-amd64.zip** 並移動到 **C:\PyGimli_Embed_Install\src\python-3.12.7-embed-amd64.zip**
  + 已經備份到src資料夾中。

### 步驟1
+ 建立一個空白的batch檔案 **C:\PyGimli_Embed_Install\Install_01.bat**
+ 修改其內容為
```batch
mkdir PythonEnv
tar -xf src/python-3.12.7-embed-amd64.zip -C PythonEnv
PAUSE
```
+ 然後雙擊運行。正常完成後，按下任意鍵結束。會看到許多檔案出現在 **PythonEnv** 資料夾中。

### 步驟2
+ 建立一個空白的batch檔案 **C:\PyGimli_Embed_Install\Install_02.bat**
+ 修改其內容為
```batch
echo python312.zip > PythonEnv\python312._pth
echo . >> PythonEnv\python312._pth
echo. >> PythonEnv\python312._pth
echo # Uncomment to run site.main() automatically >> PythonEnv\python312._pth
echo import site >> PythonEnv\python312._pth
PAUSE
```
+ 然後雙擊運行。正常完成後，按下任意鍵結束。會修改 **PythonEnv\python312._pth** 檔案。

### 步驟3
+ 下載 https://bootstrap.pypa.io/get-pip.py 並移動到 **C:\PyGimli_Embed_Install\src\get-pip.py**
  + 已經備份到src資料夾中。
+ 建立一個空白的batch檔案 **C:\PyGimli_Embed_Install\Install_03.bat**
+ 修改其內容為
```batch
PythonEnv\python.exe src\get-pip.py
PAUSE
```
+ 然後雙擊運行。正常完成後，按下任意鍵結束。會安裝pip，然後如果有警告就不要理他。
