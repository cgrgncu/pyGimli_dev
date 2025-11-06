# PythonWindowsEmbeddablePackage(64-bit)
+ 作者: HsiupoYeh
+ 更新日期: 2025-09-14
+ 目標: 安裝Windows可用的PyGimli
  + Python版本: 3.12.7 (64-bit)
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
+ **PythonEnv** 資料夾容量約為21.3[MB]

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
+ **PythonEnv** 資料夾容量約為21.3[MB]

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
+ **PythonEnv** 資料夾容量約為31.3[MB]

### 步驟4
+ 建立一個空白的batch檔案 **C:\PyGimli_Embed_Install\Install_04.bat**
+ 修改其內容為
```batch
PythonEnv\python.exe -m pip install pygimli==1.5.4
PAUSE
```
+ 然後雙擊運行。正常完成後，按下任意鍵結束。會安裝 **pygimli v1.5.4** 相關套件。安裝完之後的提示訊息如下:
```
Successfully installed MarkupSafe-3.0.2 aiohappyeyeballs-2.6.1 aiohttp-3.12.15 aiosignal-1.4.0 anyio-4.10.0 argon2-cffi-25.1.0 argon2-cffi-bindings-25.1.0 arrow-1.3.0 asttokens-3.0.0 attrs-25.3.0 beautifulsoup4-4.13.5 bleach-6.2.0 certifi-2025.8.3 cffi-2.0.0 charset_normalizer-3.4.3 cmcrameri-1.9 cmocean-4.0.3 colorama-0.4.6 colorcet-3.1.0 comm-0.2.3 contourpy-1.3.3 cycler-0.12.1 decorator-5.2.1 defusedxml-0.7.1 executing-2.2.1 fastjsonschema-2.21.2 fonttools-4.59.2 fqdn-1.5.1 frozenlist-1.7.0 idna-3.10 imageio-2.37.0 iniconfig-2.1.0 ipython-9.5.0 ipython-pygments-lexers-1.1.1 ipywidgets-8.1.7 isoduration-20.11.0 jedi-0.19.2 jinja2-3.1.6 jsonpointer-3.0.0 jsonschema-4.25.1 jsonschema-specifications-2025.9.1 jupyter-client-8.6.3 jupyter-core-5.8.1 jupyter-events-0.12.0 jupyter-server-2.17.0 jupyter-server-proxy-4.4.0 jupyter-server-terminals-0.5.3 jupyterlab-pygments-0.3.0 jupyterlab_widgets-3.0.15 kiwisolver-1.4.9 lark-1.2.2 markdown-it-py-4.0.0 matplotlib-3.10.6 matplotlib-inline-0.1.7 mdurl-0.1.2 meshio-5.3.5 mistune-3.1.4 more-itertools-10.8.0 msgpack-1.1.1 multidict-6.6.4 nbclient-0.10.2 nbconvert-7.16.6 nbformat-5.10.4 nest_asyncio-1.6.0 numpy-2.3.3 packaging-25.0 pandocfilters-1.5.1 parso-0.8.5 pgcore-1.5.3.post1 pillow-11.3.0 platformdirs-4.4.0 pluggy-1.6.0 pooch-1.8.2 prometheus-client-0.22.1 prompt_toolkit-3.0.52 propcache-0.3.2 pure-eval-0.2.3 pycparser-2.23 pygimli-1.5.4 pygments-2.19.2 pyparsing-3.2.4 pytest-8.4.2 python-dateutil-2.9.0.post0 python-json-logger-3.3.0 pyvista-0.46.3 pywin32-311 pywinpty-3.0.0 pyyaml-6.0.2 pyzmq-27.1.0 referencing-0.36.2 requests-2.32.5 rfc3339-validator-0.1.4 rfc3986-validator-0.1.1 rfc3987-syntax-1.1.0 rich-14.1.0 rpds-py-0.27.1 scipy-1.16.2 scooby-0.10.1 send2trash-1.8.3 simpervisor-1.0.0 six-1.17.0 sniffio-1.3.1 soupsieve-2.8 stack_data-0.6.3 terminado-0.18.1 tetgen-0.6.7 tinycss2-1.4.0 tornado-6.5.2 tqdm-4.67.1 traitlets-5.14.3 trame-3.12.0 trame-client-3.10.2 trame-common-1.0.1 trame-server-3.6.0 trame-vtk-2.9.1 trame-vuetify-3.0.3 types-python-dateutil-2.9.0.20250822 typing-extensions-4.15.0 uri-template-1.3.0 urllib3-2.5.0 vtk-9.5.1 wcwidth-0.2.13 webcolors-24.11.1 webencodings-0.5.1 websocket-client-1.8.0 widgetsnbextension-4.0.14 wslink-2.4.0 yarl-1.20.1
```
+ **PythonEnv** 資料夾容量約為741[MB]

### 步驟5
+ 建立一個空白的batch檔案 **C:\PyGimli_Embed_Install\Install_05.bat**
+ 修改其內容為
```batch
PythonEnv\python.exe -m pip show pygimli
PAUSE
```
+ 然後雙擊運行。正常完成後，按下任意鍵結束。會顯示已經安裝的 **pygimli v1.5.4** 資訊。提示訊息如下:
```
Name: pygimli
Version: 1.5.4
Summary: Geophysical modelling and inversion library
Home-page: http://www.pygimli.org
Author: Carsten Rücker, Thomas Günther, Florian Wagner
Author-email: mail@pygimli.org
License: Apache 2.0
Location: C:\PyGimli_Embed_Install\PythonEnv\Lib\site-packages
Requires: matplotlib, numpy, pgcore, pytest, pyvista, scipy, scooby, tetgen, tqdm
Required-by:
```
+ **PythonEnv** 資料夾容量約為741[MB]

### 步驟6(目前測試是不需要此步驟)
+ 建立一個空白的batch檔案 **C:\PyGimli_Embed_Install\Install_06(No_Need).bat**
+ 修改其內容為
```batch
PythonEnv\python.exe -m pip uninstall -y numpy
PythonEnv\python.exe -m pip install numpy==1.26.4
PAUSE
```
+ 然後雙擊運行。正常完成後，按下任意鍵結束。會把 **numpy** 降版本。運行PyGimli有問題時才需要這個步驟。

### 步驟7
+ 建立一個空白的batch檔案 **C:\PyGimli_Embed_Install\Install_07.bat**
+ 修改其內容為
```batch
PythonEnv\python.exe -m pip install pipdeptree
PAUSE
```
+ 然後雙擊運行。正常完成後，按下任意鍵結束。會安裝 **pipdeptree** 。
+ **PythonEnv** 資料夾容量約為741[MB]

### 步驟8
+ 建立一個空白的batch檔案 **C:\PyGimli_Embed_Install\Install_08.bat**
+ 修改其內容為
```batch
PythonEnv\python.exe -m pipdeptree --packages pygimli
PAUSE
```
+ 然後雙擊運行。正常完成後，按下任意鍵結束。會顯示 **pygimli** 所需要的相關套件及目前安裝版本 。
```
pygimli==1.5.4
├── pgcore [required: >=1.5, installed: 1.5.3.post1]
│   └── numpy [required: >=2.1, installed: 2.3.3]
├── numpy [required: >=2.1, installed: 2.3.3]
├── matplotlib [required: >=3.7, installed: 3.10.6]
│   ├── contourpy [required: >=1.0.1, installed: 1.3.3]
│   │   └── numpy [required: >=1.25, installed: 2.3.3]
│   ├── cycler [required: >=0.10, installed: 0.12.1]
│   ├── fonttools [required: >=4.22.0, installed: 4.59.2]
│   ├── kiwisolver [required: >=1.3.1, installed: 1.4.9]
│   ├── numpy [required: >=1.23, installed: 2.3.3]
│   ├── packaging [required: >=20.0, installed: 25.0]
│   ├── pillow [required: >=8, installed: 11.3.0]
│   ├── pyparsing [required: >=2.3.1, installed: 3.2.4]
│   └── python-dateutil [required: >=2.7, installed: 2.9.0.post0]
│       └── six [required: >=1.5, installed: 1.17.0]
├── scipy [required: >=1.14, installed: 1.16.2]
│   └── numpy [required: >=1.25.2,<2.6, installed: 2.3.3]
├── scooby [required: Any, installed: 0.10.1]
├── pyvista [required: >=0.44, installed: 0.46.3]
│   ├── matplotlib [required: >=3.0.1, installed: 3.10.6]
│   │   ├── contourpy [required: >=1.0.1, installed: 1.3.3]
│   │   │   └── numpy [required: >=1.25, installed: 2.3.3]
│   │   ├── cycler [required: >=0.10, installed: 0.12.1]
│   │   ├── fonttools [required: >=4.22.0, installed: 4.59.2]
│   │   ├── kiwisolver [required: >=1.3.1, installed: 1.4.9]
│   │   ├── numpy [required: >=1.23, installed: 2.3.3]
│   │   ├── packaging [required: >=20.0, installed: 25.0]
│   │   ├── pillow [required: >=8, installed: 11.3.0]
│   │   ├── pyparsing [required: >=2.3.1, installed: 3.2.4]
│   │   └── python-dateutil [required: >=2.7, installed: 2.9.0.post0]
│   │       └── six [required: >=1.5, installed: 1.17.0]
│   ├── numpy [required: >=1.21.0, installed: 2.3.3]
│   ├── pillow [required: Any, installed: 11.3.0]
│   ├── pooch [required: Any, installed: 1.8.2]
│   │   ├── platformdirs [required: >=2.5.0, installed: 4.4.0]
│   │   ├── packaging [required: >=20.0, installed: 25.0]
│   │   └── requests [required: >=2.19.0, installed: 2.32.5]
│   │       ├── charset-normalizer [required: >=2,<4, installed: 3.4.3]
│   │       ├── idna [required: >=2.5,<4, installed: 3.10]
│   │       ├── urllib3 [required: >=1.21.1,<3, installed: 2.5.0]
│   │       └── certifi [required: >=2017.4.17, installed: 2025.8.3]
│   ├── scooby [required: >=0.5.1, installed: 0.10.1]
│   ├── typing_extensions [required: >=4.10, installed: 4.15.0]
│   ├── vtk [required: !=9.4.0, installed: 9.5.1]
│   │   └── matplotlib [required: >=2.0.0, installed: 3.10.6]
│   │       ├── contourpy [required: >=1.0.1, installed: 1.3.3]
│   │       │   └── numpy [required: >=1.25, installed: 2.3.3]
│   │       ├── cycler [required: >=0.10, installed: 0.12.1]
│   │       ├── fonttools [required: >=4.22.0, installed: 4.59.2]
│   │       ├── kiwisolver [required: >=1.3.1, installed: 1.4.9]
│   │       ├── numpy [required: >=1.23, installed: 2.3.3]
│   │       ├── packaging [required: >=20.0, installed: 25.0]
│   │       ├── pillow [required: >=8, installed: 11.3.0]
│   │       ├── pyparsing [required: >=2.3.1, installed: 3.2.4]
│   │       └── python-dateutil [required: >=2.7, installed: 2.9.0.post0]
│   │           └── six [required: >=1.5, installed: 1.17.0]
│   ├── vtk [required: !=9.4.1, installed: 9.5.1]
│   │   └── matplotlib [required: >=2.0.0, installed: 3.10.6]
│   │       ├── contourpy [required: >=1.0.1, installed: 1.3.3]
│   │       │   └── numpy [required: >=1.25, installed: 2.3.3]
│   │       ├── cycler [required: >=0.10, installed: 0.12.1]
│   │       ├── fonttools [required: >=4.22.0, installed: 4.59.2]
│   │       ├── kiwisolver [required: >=1.3.1, installed: 1.4.9]
│   │       ├── numpy [required: >=1.23, installed: 2.3.3]
│   │       ├── packaging [required: >=20.0, installed: 25.0]
│   │       ├── pillow [required: >=8, installed: 11.3.0]
│   │       ├── pyparsing [required: >=2.3.1, installed: 3.2.4]
│   │       └── python-dateutil [required: >=2.7, installed: 2.9.0.post0]
│   │           └── six [required: >=1.5, installed: 1.17.0]
│   └── vtk [required: <9.6.0, installed: 9.5.1]
│       └── matplotlib [required: >=2.0.0, installed: 3.10.6]
│           ├── contourpy [required: >=1.0.1, installed: 1.3.3]
│           │   └── numpy [required: >=1.25, installed: 2.3.3]
│           ├── cycler [required: >=0.10, installed: 0.12.1]
│           ├── fonttools [required: >=4.22.0, installed: 4.59.2]
│           ├── kiwisolver [required: >=1.3.1, installed: 1.4.9]
│           ├── numpy [required: >=1.23, installed: 2.3.3]
│           ├── packaging [required: >=20.0, installed: 25.0]
│           ├── pillow [required: >=8, installed: 11.3.0]
│           ├── pyparsing [required: >=2.3.1, installed: 3.2.4]
│           └── python-dateutil [required: >=2.7, installed: 2.9.0.post0]
│               └── six [required: >=1.5, installed: 1.17.0]
├── tetgen [required: >=0.6.5, installed: 0.6.7]
│   ├── numpy [required: >=2,<3, installed: 2.3.3]
│   └── pyvista [required: >=0.31.0, installed: 0.46.3]
│       ├── matplotlib [required: >=3.0.1, installed: 3.10.6]
│       │   ├── contourpy [required: >=1.0.1, installed: 1.3.3]
│       │   │   └── numpy [required: >=1.25, installed: 2.3.3]
│       │   ├── cycler [required: >=0.10, installed: 0.12.1]
│       │   ├── fonttools [required: >=4.22.0, installed: 4.59.2]
│       │   ├── kiwisolver [required: >=1.3.1, installed: 1.4.9]
│       │   ├── numpy [required: >=1.23, installed: 2.3.3]
│       │   ├── packaging [required: >=20.0, installed: 25.0]
│       │   ├── pillow [required: >=8, installed: 11.3.0]
│       │   ├── pyparsing [required: >=2.3.1, installed: 3.2.4]
│       │   └── python-dateutil [required: >=2.7, installed: 2.9.0.post0]
│       │       └── six [required: >=1.5, installed: 1.17.0]
│       ├── numpy [required: >=1.21.0, installed: 2.3.3]
│       ├── pillow [required: Any, installed: 11.3.0]
│       ├── pooch [required: Any, installed: 1.8.2]
│       │   ├── platformdirs [required: >=2.5.0, installed: 4.4.0]
│       │   ├── packaging [required: >=20.0, installed: 25.0]
│       │   └── requests [required: >=2.19.0, installed: 2.32.5]
│       │       ├── charset-normalizer [required: >=2,<4, installed: 3.4.3]
│       │       ├── idna [required: >=2.5,<4, installed: 3.10]
│       │       ├── urllib3 [required: >=1.21.1,<3, installed: 2.5.0]
│       │       └── certifi [required: >=2017.4.17, installed: 2025.8.3]
│       ├── scooby [required: >=0.5.1, installed: 0.10.1]
│       ├── typing_extensions [required: >=4.10, installed: 4.15.0]
│       ├── vtk [required: !=9.4.0, installed: 9.5.1]
│       │   └── matplotlib [required: >=2.0.0, installed: 3.10.6]
│       │       ├── contourpy [required: >=1.0.1, installed: 1.3.3]
│       │       │   └── numpy [required: >=1.25, installed: 2.3.3]
│       │       ├── cycler [required: >=0.10, installed: 0.12.1]
│       │       ├── fonttools [required: >=4.22.0, installed: 4.59.2]
│       │       ├── kiwisolver [required: >=1.3.1, installed: 1.4.9]
│       │       ├── numpy [required: >=1.23, installed: 2.3.3]
│       │       ├── packaging [required: >=20.0, installed: 25.0]
│       │       ├── pillow [required: >=8, installed: 11.3.0]
│       │       ├── pyparsing [required: >=2.3.1, installed: 3.2.4]
│       │       └── python-dateutil [required: >=2.7, installed: 2.9.0.post0]
│       │           └── six [required: >=1.5, installed: 1.17.0]
│       ├── vtk [required: !=9.4.1, installed: 9.5.1]
│       │   └── matplotlib [required: >=2.0.0, installed: 3.10.6]
│       │       ├── contourpy [required: >=1.0.1, installed: 1.3.3]
│       │       │   └── numpy [required: >=1.25, installed: 2.3.3]
│       │       ├── cycler [required: >=0.10, installed: 0.12.1]
│       │       ├── fonttools [required: >=4.22.0, installed: 4.59.2]
│       │       ├── kiwisolver [required: >=1.3.1, installed: 1.4.9]
│       │       ├── numpy [required: >=1.23, installed: 2.3.3]
│       │       ├── packaging [required: >=20.0, installed: 25.0]
│       │       ├── pillow [required: >=8, installed: 11.3.0]
│       │       ├── pyparsing [required: >=2.3.1, installed: 3.2.4]
│       │       └── python-dateutil [required: >=2.7, installed: 2.9.0.post0]
│       │           └── six [required: >=1.5, installed: 1.17.0]
│       └── vtk [required: <9.6.0, installed: 9.5.1]
│           └── matplotlib [required: >=2.0.0, installed: 3.10.6]
│               ├── contourpy [required: >=1.0.1, installed: 1.3.3]
│               │   └── numpy [required: >=1.25, installed: 2.3.3]
│               ├── cycler [required: >=0.10, installed: 0.12.1]
│               ├── fonttools [required: >=4.22.0, installed: 4.59.2]
│               ├── kiwisolver [required: >=1.3.1, installed: 1.4.9]
│               ├── numpy [required: >=1.23, installed: 2.3.3]
│               ├── packaging [required: >=20.0, installed: 25.0]
│               ├── pillow [required: >=8, installed: 11.3.0]
│               ├── pyparsing [required: >=2.3.1, installed: 3.2.4]
│               └── python-dateutil [required: >=2.7, installed: 2.9.0.post0]
│                   └── six [required: >=1.5, installed: 1.17.0]
├── tqdm [required: Any, installed: 4.67.1]
│   └── colorama [required: Any, installed: 0.4.6]
└── pytest [required: Any, installed: 8.4.2]
    ├── colorama [required: >=0.4, installed: 0.4.6]
    ├── iniconfig [required: >=1, installed: 2.1.0]
    ├── packaging [required: >=20, installed: 25.0]
    ├── pluggy [required: >=1.5,<2, installed: 1.6.0]
    └── Pygments [required: >=2.7.2, installed: 2.19.2]
```
+ **PythonEnv** 資料夾容量約為741[MB]

### 步驟9(想要互動式Matplotlib的GUI才需要)
+ 建立一個空白的batch檔案 **C:\PyGimli_Embed_Install\Install_09(If_Want).bat**
+ 修改其內容為
```batch
PythonEnv\python.exe -m pip install PyQt5
PAUSE
```
+ 然後雙擊運行。正常完成後，按下任意鍵結束。會安裝 **PyQt5** 。
+ **PythonEnv** 資料夾容量約為884[MB]
+ 壓縮為 **Full_PyGimli_Env.zip** 容量約為299[MB]

### 可以正常使用PyGimli
+ 找個範例來跑
+ 下載 https://www.pygimli.org/_downloads/4ebf8621b32df7e39496a39a44dbf15c/plot_01_ert_2d_mod_inv.py 到 **C:\PyGimli_Embed_Install\plot_01_ert_2d_mod_inv.py**
+ 建立一個空白的batch檔案 **C:\PyGimli_Embed_Install\plot_01_ert_2d_mod_inv.bat**
+ 修改其內容為
```batch
.\PythonEnv\python.exe plot_01_ert_2d_mod_inv.py
PAUSE
```
+ 然後雙擊運行。正常完成後，按下任意鍵結束。有裝PyQt5就會看到一堆互動視窗，沒裝也會看到輸出了一個 **simple.dat** 檔案
+ 至此，可以把 **PythonEnv** 資料夾搬去任何你想要執行PyGimli的電腦或路徑了，然後搭配正確的呼叫方式。但是目前有點肥大，需要884[MB]。

### 步驟10(不使用互動式Matplotlib的GUI並精簡套件)
+ 建立一個空白的batch檔案 **C:\PyGimli_Embed_Install\Install_10(If_Want).bat**
+ 修改其內容為
```batch
PythonEnv\python.exe -m pip uninstall -y aiohappyeyeballs
PythonEnv\python.exe -m pip uninstall -y aiohttp
PythonEnv\python.exe -m pip uninstall -y aiosignal
PythonEnv\python.exe -m pip uninstall -y anyio
PythonEnv\python.exe -m pip uninstall -y argon2-cffi
PythonEnv\python.exe -m pip uninstall -y argon2-cffi-bindings
PythonEnv\python.exe -m pip uninstall -y arrow
PythonEnv\python.exe -m pip uninstall -y asttokens
PythonEnv\python.exe -m pip uninstall -y attrs
PythonEnv\python.exe -m pip uninstall -y beautifulsoup4
PythonEnv\python.exe -m pip uninstall -y bleach
PythonEnv\python.exe -m pip uninstall -y certifi
PythonEnv\python.exe -m pip uninstall -y cffi
PythonEnv\python.exe -m pip uninstall -y charset-normalizer
PythonEnv\python.exe -m pip uninstall -y cmcrameri
PythonEnv\python.exe -m pip uninstall -y cmocean
PythonEnv\python.exe -m pip uninstall -y colorama
PythonEnv\python.exe -m pip uninstall -y colorcet
PythonEnv\python.exe -m pip uninstall -y comm
PythonEnv\python.exe -m pip uninstall -y contourpy
PythonEnv\python.exe -m pip uninstall -y decorator
PythonEnv\python.exe -m pip uninstall -y defusedxml
PythonEnv\python.exe -m pip uninstall -y executing
PythonEnv\python.exe -m pip uninstall -y fastjsonschema
PythonEnv\python.exe -m pip uninstall -y fqdn
PythonEnv\python.exe -m pip uninstall -y frozenlist
PythonEnv\python.exe -m pip uninstall -y idna
PythonEnv\python.exe -m pip uninstall -y iniconfig
PythonEnv\python.exe -m pip uninstall -y ipython
PythonEnv\python.exe -m pip uninstall -y ipython_pygments_lexers
PythonEnv\python.exe -m pip uninstall -y ipywidgets
PythonEnv\python.exe -m pip uninstall -y isoduration
PythonEnv\python.exe -m pip uninstall -y jedi
PythonEnv\python.exe -m pip uninstall -y Jinja2
PythonEnv\python.exe -m pip uninstall -y jsonpointer
PythonEnv\python.exe -m pip uninstall -y jsonschema
PythonEnv\python.exe -m pip uninstall -y jsonschema-specifications
PythonEnv\python.exe -m pip uninstall -y jupyter_client
PythonEnv\python.exe -m pip uninstall -y jupyter_core
PythonEnv\python.exe -m pip uninstall -y jupyter-events
PythonEnv\python.exe -m pip uninstall -y jupyter_server
PythonEnv\python.exe -m pip uninstall -y jupyter_server_proxy
PythonEnv\python.exe -m pip uninstall -y jupyter_server_terminals
PythonEnv\python.exe -m pip uninstall -y jupyterlab_pygments
PythonEnv\python.exe -m pip uninstall -y jupyterlab_widgets
PythonEnv\python.exe -m pip uninstall -y lark
PythonEnv\python.exe -m pip uninstall -y markdown-it-py
PythonEnv\python.exe -m pip uninstall -y MarkupSafe
PythonEnv\python.exe -m pip uninstall -y matplotlib-inline
PythonEnv\python.exe -m pip uninstall -y mdurl
PythonEnv\python.exe -m pip uninstall -y meshio
PythonEnv\python.exe -m pip uninstall -y mistune
PythonEnv\python.exe -m pip uninstall -y more-itertools
PythonEnv\python.exe -m pip uninstall -y msgpack
PythonEnv\python.exe -m pip uninstall -y multidict
PythonEnv\python.exe -m pip uninstall -y nbclient
PythonEnv\python.exe -m pip uninstall -y nbconvert
PythonEnv\python.exe -m pip uninstall -y nbformat
PythonEnv\python.exe -m pip uninstall -y nest-asyncio
PythonEnv\python.exe -m pip uninstall -y pandocfilters
PythonEnv\python.exe -m pip uninstall -y parso
PythonEnv\python.exe -m pip uninstall -y platformdirs
PythonEnv\python.exe -m pip uninstall -y pluggy
PythonEnv\python.exe -m pip uninstall -y prometheus_client
PythonEnv\python.exe -m pip uninstall -y prompt_toolkit
PythonEnv\python.exe -m pip uninstall -y propcache
PythonEnv\python.exe -m pip uninstall -y pure_eval
PythonEnv\python.exe -m pip uninstall -y pycparser
PythonEnv\python.exe -m pip uninstall -y Pygments
PythonEnv\python.exe -m pip uninstall -y pytest
PythonEnv\python.exe -m pip uninstall -y python-json-logger
PythonEnv\python.exe -m pip uninstall -y pyvista
PythonEnv\python.exe -m pip uninstall -y pywin32
PythonEnv\python.exe -m pip uninstall -y pywinpty
PythonEnv\python.exe -m pip uninstall -y PyYAML
PythonEnv\python.exe -m pip uninstall -y pyzmq
PythonEnv\python.exe -m pip uninstall -y PyQt5-Qt5
PythonEnv\python.exe -m pip uninstall -y PyQt5_sip
PythonEnv\python.exe -m pip uninstall -y referencing
PythonEnv\python.exe -m pip uninstall -y requests
PythonEnv\python.exe -m pip uninstall -y rfc3339-validator
PythonEnv\python.exe -m pip uninstall -y rfc3986-validator
PythonEnv\python.exe -m pip uninstall -y rfc3987-syntax
PythonEnv\python.exe -m pip uninstall -y rich
PythonEnv\python.exe -m pip uninstall -y rpds-py
PythonEnv\python.exe -m pip uninstall -y scooby
PythonEnv\python.exe -m pip uninstall -y Send2Trash
PythonEnv\python.exe -m pip uninstall -y simpervisor
PythonEnv\python.exe -m pip uninstall -y sniffio
PythonEnv\python.exe -m pip uninstall -y soupsieve
PythonEnv\python.exe -m pip uninstall -y stack-data
PythonEnv\python.exe -m pip uninstall -y terminado
PythonEnv\python.exe -m pip uninstall -y tetgen
PythonEnv\python.exe -m pip uninstall -y tinycss2
PythonEnv\python.exe -m pip uninstall -y tornado
PythonEnv\python.exe -m pip uninstall -y tqdm
PythonEnv\python.exe -m pip uninstall -y traitlets
PythonEnv\python.exe -m pip uninstall -y trame
PythonEnv\python.exe -m pip uninstall -y trame-client
PythonEnv\python.exe -m pip uninstall -y trame-common
PythonEnv\python.exe -m pip uninstall -y trame-server
PythonEnv\python.exe -m pip uninstall -y trame-vtk
PythonEnv\python.exe -m pip uninstall -y trame-vuetify
PythonEnv\python.exe -m pip uninstall -y types-python-dateutil
PythonEnv\python.exe -m pip uninstall -y typing_extensions
PythonEnv\python.exe -m pip uninstall -y uri-template
PythonEnv\python.exe -m pip uninstall -y urllib3
PythonEnv\python.exe -m pip uninstall -y vtk
PythonEnv\python.exe -m pip uninstall -y wcwidth
PythonEnv\python.exe -m pip uninstall -y webcolors
PythonEnv\python.exe -m pip uninstall -y webencodings
PythonEnv\python.exe -m pip uninstall -y websocket-client
PythonEnv\python.exe -m pip uninstall -y widgetsnbextension
PythonEnv\python.exe -m pip uninstall -y wslink
PythonEnv\python.exe -m pip uninstall -y yarl
PythonEnv\python.exe -m pip uninstall -y pipdeptree
PythonEnv\python.exe -m pip uninstall -y pip
PAUSE
```
+ 然後雙擊運行。正常完成後，按下任意鍵結束。會移除許多不必要的套件。
+ **PythonEnv** 資料夾容量約為399[MB]

### 步驟11(不使用互動式Matplotlib的GUI並精簡套件)
+ 建立一個空白的batch檔案 **C:\PyGimli_Embed_Install\Install_11(If_Want).bat**
+ 修改其內容為
```batch
rem 使用 rd /s /q 刪除資料夾及其所有內容
rd /s /q "PythonEnv\etc"
rd /s /q "PythonEnv\Scripts"
rd /s /q "PythonEnv\share"
rem 使用 del /f /q 刪除檔案
del /f /q "PythonEnv\_asyncio.pyd"
del /f /q "PythonEnv\_bz2.pyd"
del /f /q "PythonEnv\_hashlib.pyd"
del /f /q "PythonEnv\_lzma.pyd"
del /f /q "PythonEnv\_msi.pyd"
del /f /q "PythonEnv\_multiprocessing.pyd"
del /f /q "PythonEnv\_overlapped.pyd"
del /f /q "PythonEnv\_queue.pyd"
del /f /q "PythonEnv\_sqlite3.pyd"
del /f /q "PythonEnv\_ssl.pyd"
del /f /q "PythonEnv\_uuid.pyd"
del /f /q "PythonEnv\_wmi.pyd"
del /f /q "PythonEnv\_zoneinfo.pyd"
del /f /q "PythonEnv\libcrypto-3.dll"
del /f /q "PythonEnv\libssl-3.dll"
del /f /q "PythonEnv\python.cat"
del /f /q "PythonEnv\python3.dll"
del /f /q "PythonEnv\pythonw.exe"
del /f /q "PythonEnv\sqlite3.dll"
del /f /q "PythonEnv\vcruntime140.dll"
del /f /q "PythonEnv\winsound.pyd"
rem 使用 rd /s /q 刪除資料夾及其所有內容
rd /s /q "PythonEnv\Lib\site-packages\trame"
rd /s /q "PythonEnv\Lib\site-packages\win32comext"
rem 使用 del /f /q 刪除檔案
del /f /q "PythonEnv\Lib\site-packages\pylab.py"
del /f /q "PythonEnv\Lib\site-packages\scipy-1.16.2-cp312-cp312-win_amd64.whl"
PAUSE
```
+ 然後雙擊運行。正常完成後，按下任意鍵結束。會移除許多不必要的套件。
+ **PythonEnv** 資料夾容量約為389[MB]
+ 壓縮為 **Lite_PyGimli_Env.zip** 容量約為127[MB]


+ 注意: 如果沒有安裝，可能需要放置vcruntime140.dll與vcruntime140_1.dll到Python.exe同層目錄下
