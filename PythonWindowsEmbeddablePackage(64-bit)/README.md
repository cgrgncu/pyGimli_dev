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

### 步驟6(目前測試是不需要此步驟)
+ 建立一個空白的batch檔案 **C:\PyGimli_Embed_Install\Install_06.bat**
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

### 步驟9(想要互動式Matplotlib的GUI才需要)
+ 建立一個空白的batch檔案 **C:\PyGimli_Embed_Install\Install_09.bat**
+ 修改其內容為
```batch
PythonEnv\python.exe -m pip install PyQt5
PAUSE
```
+ 然後雙擊運行。正常完成後，按下任意鍵結束。會安裝 **PyQt5** 。

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
+ 至此，可以把 **PythonEnv** 資料夾搬去任何你想要執行PyGimli的電腦或路徑了，然後搭配正確的呼叫方式。
