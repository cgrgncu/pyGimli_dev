import json
import numpy as np
from scipy.interpolate import interp1d
import pygimli as pg
import matplotlib.pyplot as plt
#--------------------------------------------
# 指定檔案名稱
vtk_file_name = 'Output_FullMesh.vtk'
json_file_name = 'Output_FullMeshMarkers.json'
#--
try:
    #--
    # 建立網格
    mesh = pg.Mesh(2)
    # 使用計算出的節點座標創建網格
    print("讀取 .vtk 檔...")
    mesh.load(vtk_file_name)
    print("讀取 .vtk 檔...完成!")
    # 展示
    pg.show(mesh,  markers=True, showMesh=True, label="Mesh01")
    plt.savefig('Mesh01b.png')
    #--
    print("讀取 .json 檔...")
    # 開啟並讀取 JSON 檔案
    with open(json_file_name, 'r', encoding='utf-8') as json_file:
        temp_json_data = json.load(json_file)
    print("讀取 .json 檔...完成!")
    # 取出最後一直欄(marker)
    markers = [row[-1] for row in temp_json_data["MeshMarkers"]]
    #print(markers)
    # 設定 針對每一筆記錄，取出 index 與 marker，設定到對應的 boundary
    for entry in temp_json_data['MeshMarkers']:
        indexValue, x1Value, y1Value, x2Value, y2Value, markerValue = entry
        b = mesh.boundaries()[int(indexValue)]
        b.setMarker(int(markerValue))
    # 展示
    pg.show(mesh,  markers=True, showMesh=True, label="Mesh02")
    plt.savefig('Mesh02b.png')
    #--
except FileNotFoundError:
    print(f"錯誤：找不到檔案 '{json_file_name}'")
    exit(1)
except json.JSONDecodeError:
    print(f"錯誤：檔案 '{json_file_name}' 不是有效的 JSON 格式")
    exit(1)
except KeyError as e:
    print(f"錯誤：JSON 檔案中找不到鍵 '{e}'")
    exit(1)
except ImportError:
    print("錯誤：找不到 scipy 函式庫，請先安裝 (pip install scipy)")
    exit(1)
except Exception as e:
    print(f"發生未知錯誤： {e}")
    exit(1)
#--------------------------------------------