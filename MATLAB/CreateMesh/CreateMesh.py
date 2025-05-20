import json
import numpy as np
from scipy.interpolate import interp1d
import pygimli as pg
import matplotlib.pyplot as plt
#--------------------------------------------
# 指定檔案名稱
json_file_name = 'Input_MeshSettings.json'
#--
print("讀取 .json 檔...")
try:
    #--------------------------------------------
    # 讀取檔案並建立網格部分
    # 允許高程Z值有部分缺失，可填null，由軟體進行內插interp1d(kind='linear', fill_value="extrapolate")
    #--
    # 開啟並讀取 JSON 檔案
    with open(json_file_name, 'r', encoding='utf-8') as json_file:
        temp_json_data = json.load(json_file)
    print("讀取 .json 檔...完成!")
    #--
    # 整理資料並內插Z值
    #--
    # 取得 StudyAreaMesh_GridSurfaceNode 的資料並轉換為 NumPy 陣列 (使用 object dtype 以容納 nan)
    NumPy_StudyAreaMesh_GridSurfaceNode_array = np.array(temp_json_data["StudyAreaMesh_GridSurfaceNode"], dtype=object)
    # 分離 X 和原始 Z 座標
    NumPy_StudyAreaMesh_x_coords_original = NumPy_StudyAreaMesh_GridSurfaceNode_array[:, 0].astype(float)
    NumPy_StudyAreaMesh_z_coords_original = NumPy_StudyAreaMesh_GridSurfaceNode_array[:, 1].astype(float)
    # 找到非 NaN 值的索引
    NumPy_StudyAreaMesh_non_nan_z_indices = np.where(~np.isnan(NumPy_StudyAreaMesh_z_coords_original))[0]
    # 如果有效的 Z 值不足，視為錯誤並終止程式
    if len(NumPy_StudyAreaMesh_non_nan_z_indices) <= 1:
        print("錯誤：有效的 Z 值不足，無法進行內插。")
        exit(1)
    else:
        # 創建線性內插函數，用於填補 Z 座標中的 NaN 值
        temp_interpolate_function = interp1d(NumPy_StudyAreaMesh_x_coords_original[NumPy_StudyAreaMesh_non_nan_z_indices], NumPy_StudyAreaMesh_z_coords_original[NumPy_StudyAreaMesh_non_nan_z_indices], kind='linear', fill_value="extrapolate")
        # 找到 NaN 值的索引
        NumPy_StudyAreaMesh_nan_z_indices = np.where(np.isnan(NumPy_StudyAreaMesh_z_coords_original))[0]
        # 使用內插函數填補 NaN 值到 z_coords_interp
        NumPy_StudyAreaMesh_z_coords_interp = NumPy_StudyAreaMesh_z_coords_original.copy()
        NumPy_StudyAreaMesh_z_coords_interp[NumPy_StudyAreaMesh_nan_z_indices] = temp_interpolate_function(NumPy_StudyAreaMesh_x_coords_original[NumPy_StudyAreaMesh_nan_z_indices])
        # 創建包含 X, 原始 Z 和內插 Z 的新陣列
        NumPy_StudyAreaMesh_coords_data = np.column_stack((NumPy_StudyAreaMesh_x_coords_original, NumPy_StudyAreaMesh_z_coords_original, NumPy_StudyAreaMesh_z_coords_interp))
        #print("包含 X, 原始 Z 和內插 Z 的資料：")
        #print(NumPy_StudyAreaMesh_coords_data)
    #--------------------------------------------
    #--------------------------------------------
    # 從參數建立四邊形網格
    print("從參數建立四邊形網格...")
    #--
    # 取得 PaddingMesh_RectangleGrid_LeftPaddingLayerCount 的資料並轉換為 int 變數
    int_PaddingMesh_RectangleGrid_LeftPaddingLayerCount = int(temp_json_data["PaddingMesh_RectangleGrid_LeftPaddingLayerCount"])
    # 取得 PaddingMesh_RectangleGrid_LeftPaddingLayerThicknessFacfor 的資料並轉換為 float 變數
    float_PaddingMesh_RectangleGrid_LeftPaddingLayerThicknessFacfor = float(temp_json_data["PaddingMesh_RectangleGrid_LeftPaddingLayerThicknessFacfor"])
    # 取得 PaddingMesh_RectangleGrid_FirstLeftPaddingLayerThickness 的資料並轉換為 float 變數
    float_PaddingMesh_RectangleGrid_FirstLeftPaddingLayerThickness = float(temp_json_data["PaddingMesh_RectangleGrid_FirstLeftPaddingLayerThickness"])
    # 取得 PaddingMesh_RectangleGrid_RightPaddingLayerCount 的資料並轉換為 int 變數
    int_PaddingMesh_RectangleGrid_RightPaddingLayerCount = temp_json_data["PaddingMesh_RectangleGrid_LeftPaddingLayerCount"]
    # 取得 PaddingMesh_RectangleGrid_RightPaddingLayerThicknessFacfor 的資料並轉換為 float 變數
    float_PaddingMesh_RectangleGrid_RightPaddingLayerThicknessFacfor = float(temp_json_data["PaddingMesh_RectangleGrid_RightPaddingLayerThicknessFacfor"])
    # 取得 PaddingMesh_RectangleGrid_FirstRightPaddingLayerThickness 的資料並轉換為 float 變數
    float_PaddingMesh_RectangleGrid_FirstRightPaddingLayerThickness = float(temp_json_data["PaddingMesh_RectangleGrid_FirstRightPaddingLayerThickness"])
    #--
    # 計算 FullMesh 的X方向上之節點向量的總數量 FullMesh_x_node_count
    int_FullMesh_x_node_count = NumPy_StudyAreaMesh_x_coords_original.size + int_PaddingMesh_RectangleGrid_LeftPaddingLayerCount + int_PaddingMesh_RectangleGrid_RightPaddingLayerCount
    # 建立初始的 FullMesh 的X方向上之節點座標
    NumPy_FullMesh_x_coords = np.full(int_FullMesh_x_node_count, np.nan, dtype=float)
    #print(NumPy_FullMesh_x_coords)
    # 把「內網格」的 座標值填入
    NumPy_FullMesh_x_coords[int_PaddingMesh_RectangleGrid_LeftPaddingLayerCount:int_PaddingMesh_RectangleGrid_LeftPaddingLayerCount+NumPy_StudyAreaMesh_x_coords_original.size] = NumPy_StudyAreaMesh_x_coords_original
    #print(NumPy_FullMesh_x_coords)
    # 處理左側，逐個計算位置並填入
    temp_Thickness=float_PaddingMesh_RectangleGrid_FirstLeftPaddingLayerThickness
    for i in range(int_PaddingMesh_RectangleGrid_LeftPaddingLayerCount):
        temp_target_index=(int_PaddingMesh_RectangleGrid_LeftPaddingLayerCount-i-1)
        NumPy_FullMesh_x_coords[temp_target_index]=NumPy_FullMesh_x_coords[temp_target_index+1]-temp_Thickness
        temp_Thickness=temp_Thickness*float_PaddingMesh_RectangleGrid_LeftPaddingLayerThicknessFacfor
    #print(NumPy_FullMesh_x_coords)
    # 處理右側，逐個計算位置並填入
    temp_Thickness=float_PaddingMesh_RectangleGrid_FirstRightPaddingLayerThickness
    for i in range(int_PaddingMesh_RectangleGrid_RightPaddingLayerCount):
        temp_target_index=(int_FullMesh_x_node_count-int_PaddingMesh_RectangleGrid_RightPaddingLayerCount+i)
        NumPy_FullMesh_x_coords[temp_target_index]=NumPy_FullMesh_x_coords[temp_target_index-1]+temp_Thickness
        temp_Thickness=temp_Thickness*float_PaddingMesh_RectangleGrid_RightPaddingLayerThicknessFacfor
    #print("FullMesh X向量：")
    #print(NumPy_FullMesh_x_coords)
    #--
    # 取得 StudyAreaMesh_RectangleGrid_LayerCount 的資料並轉換為 int 變數
    int_StudyAreaMesh_RectangleGrid_LayerCount = temp_json_data["StudyAreaMesh_RectangleGrid_LayerCount"]
    # 取得 StudyAreaMesh_RectangleGrid_LayerThicknessFacfor 的資料並轉換為 float 變數
    float_StudyAreaMesh_RectangleGrid_LayerThicknessFacfor = float(temp_json_data["StudyAreaMesh_RectangleGrid_LayerThicknessFacfor"])
    # 取得 StudyAreaMesh_RectangleGrid_FirstLayerThickness 的資料並轉換為 float 變數
    float_StudyAreaMesh_RectangleGrid_FirstLayerThickness = float(temp_json_data["StudyAreaMesh_RectangleGrid_FirstLayerThickness"])
    # 取得 PaddingMesh_RectangleGrid_BottomPaddingLayerCount 的資料並轉換為 int 變數
    int_PaddingMesh_RectangleGrid_BottomPaddingLayerCount = temp_json_data["PaddingMesh_RectangleGrid_BottomPaddingLayerCount"]
    # 取得 PaddingMesh_RectangleGrid_BottomPaddingLayerThicknessFacfor 的資料並轉換為 float 變數
    float_PaddingMesh_RectangleGrid_BottomPaddingLayerThicknessFacfor = float(temp_json_data["PaddingMesh_RectangleGrid_BottomPaddingLayerThicknessFacfor"])
    # 取得 PaddingMesh_RectangleGrid_FirstBottomPaddingLayerThickness 的資料並轉換為 float 變數
    float_PaddingMesh_RectangleGrid_FirstBottomPaddingLayerThickness = float(temp_json_data["PaddingMesh_RectangleGrid_FirstBottomPaddingLayerThickness"])
    #--
    # 計算 FullMesh 的Z方向上之節點向量的總數量 FullMesh_z_node_count
    int_FullMesh_z_node_count = int_StudyAreaMesh_RectangleGrid_LayerCount + int_PaddingMesh_RectangleGrid_BottomPaddingLayerCount+1
    # 建立初始的 FullMesh 的Z方向上之節點座標
    NumPy_FullMesh_z_coords = np.full(int_FullMesh_z_node_count, np.nan, dtype=float)
    #print(NumPy_FullMesh_z_coords)
    # 計算 StudyAreaMesh 的Z方向上之節點向量的總數量 FullMesh_z_node_count
    int_StudyAreaMesh_z_node_count = int_StudyAreaMesh_RectangleGrid_LayerCount +1
    # 建立初始的 StudyAreaMesh 的Z方向上之節點座標
    NumPy_StudyAreaMesh_z_coords = np.full(int_StudyAreaMesh_z_node_count, np.nan, dtype=float)
    #print(NumPy_StudyAreaMesh_z_coords)
    # 處理下方，逐個計算位置並填入
    NumPy_FullMesh_z_coords[0]=0
    NumPy_StudyAreaMesh_z_coords[0]=0
    #print(NumPy_FullMesh_z_coords)
    temp_Thickness=float_StudyAreaMesh_RectangleGrid_FirstLayerThickness
    for i in range(int_StudyAreaMesh_RectangleGrid_LayerCount):
        temp_target_index=i+1
        NumPy_FullMesh_z_coords[temp_target_index]=NumPy_FullMesh_z_coords[temp_target_index-1]-temp_Thickness
        NumPy_StudyAreaMesh_z_coords[temp_target_index]=NumPy_StudyAreaMesh_z_coords[temp_target_index-1]-temp_Thickness
        temp_Thickness=temp_Thickness*float_StudyAreaMesh_RectangleGrid_LayerThicknessFacfor
    #print(NumPy_FullMesh_z_coords)
    if float_PaddingMesh_RectangleGrid_FirstBottomPaddingLayerThickness>0 :
        temp_Thickness=float_PaddingMesh_RectangleGrid_FirstBottomPaddingLayerThickness
    else:
        temp_Thickness=(NumPy_FullMesh_z_coords[int_StudyAreaMesh_RectangleGrid_LayerCount-1]-NumPy_FullMesh_z_coords[int_StudyAreaMesh_RectangleGrid_LayerCount])*float_PaddingMesh_RectangleGrid_BottomPaddingLayerThicknessFacfor
    for i in range(int_PaddingMesh_RectangleGrid_BottomPaddingLayerCount):
        temp_target_index=(int_StudyAreaMesh_RectangleGrid_LayerCount+i+1)
        NumPy_FullMesh_z_coords[temp_target_index]=NumPy_FullMesh_z_coords[temp_target_index-1]-temp_Thickness
        temp_Thickness=temp_Thickness*float_PaddingMesh_RectangleGrid_BottomPaddingLayerThicknessFacfor
    #print("FullMesh Z向量：")
    #print(NumPy_FullMesh_z_coords)
    #--
    # 建立網格
    mesh = pg.Mesh(2)
    # 使用計算出的節點座標創建網格
    mesh.createGrid(NumPy_FullMesh_x_coords, NumPy_FullMesh_z_coords)
    # 展示
    pg.show(mesh,  markers=True, showMesh=True, label="Mesh01")
    plt.savefig('Mesh01.png')
    #--
    # 預設使用 mesh.createGrid 就會填入預設的邊界的Marker。
    # BERT在逆推時會自行處理邊界，主要是依賴網格的Marker。PaddingMesh設定為1，StudyAreaMesh設定為2
    # 將判定所有在地表的邊界的Marker都是-1。
    # 將判定所有在PaddingMesh的左側、下側、右側之邊界的Marker都是-2。
    # 將判定所有在StudyAreaMesh的左側、下側、右側之邊界的Marker都是1。
    #--
    # 以下也照BERT的設定進行標記:
    #
    # 設置網格的Marker 全部為1
    mesh.setCellMarkers([1] * mesh.cellCount())
    # 展示
    pg.show(mesh,  markers=True, showMesh=True, label="Mesh02")
    plt.savefig('Mesh02.png')
    #--
    # 取得所有網格中心位置
    cell_centers = mesh.cellCenters()
    # 找出 StudyArea 範圍內的網格
    StudyAreaMesh_Cell_index = (
        (cell_centers[:, 0] >= NumPy_StudyAreaMesh_x_coords_original.min()) &
        (cell_centers[:, 0] <= NumPy_StudyAreaMesh_x_coords_original.max()) &
        (cell_centers[:, 1] <= 0) &
        (cell_centers[:, 1] >= NumPy_StudyAreaMesh_z_coords.min())
    )
    # 設定網格的Marker
    markers = np.ones(mesh.cellCount(), dtype=int)
    markers[StudyAreaMesh_Cell_index]=2 # 參考普通逆推情形，建立兩個標記網格時，PaddingMesh設定為1，StudyAreaMesh設定為2
    mesh.setCellMarkers(markers.tolist())
    # 展示
    pg.show(mesh,  markers=True, showMesh=True, label="Mesh03")
    plt.savefig('Mesh03.png')
    #--
    # 設定 StudyAreaMesh 的 邊界的Marker
    for b in mesh.boundaries():
        #--
        # 找到這條邊界左右兩邊的 cell（外側會回傳 None）
        left_cell  = b.leftCell()
        right_cell = b.rightCell()
        # 拿到它們的 網格的Marker（如果是 None，就回傳一個不可能等於 2 的值）
        m_left  = left_cell.marker()  if left_cell  is not None else 1234
        m_right = right_cell.marker() if right_cell is not None else 1234
        # 如果一側是 1，另一側是 2，就把它標成 2 (參考普通逆推情形，建立兩個標記網格時，PaddingMesh設定為1，StudyAreaMesh設定為2)
        if (m_left == 2 and m_right == 1) :
            if (b.node(0).pos()[0]==b.node(1).pos()[0]) :
                # 這裡是PaddingMesh的右側
                b.setMarker(1) 
            else :
                # 這裡是PaddingMesh的下側
                b.setMarker(1)
        elif (m_left == 1 and m_right == 2) :
            if (b.node(0).pos()[0]==b.node(1).pos()[0]) :
                # 這裡是PaddingMesh的左側
                b.setMarker(1)
    # 展示
    pg.show(mesh,  markers=True, showMesh=True, label="Mesh04")
    plt.savefig('Mesh04.png')
    #--   
    # 設定 FullMesh 的 邊界的Marker
    for b in mesh.boundaries():
        if b.outside():
            if (b.node(0).pos()[1] == 0 and b.node(1).pos()[1] == 0) :
                # 這裡是 FullMesh 的地表
                b.setMarker(-1)
            else :
                # 這裡是 FullMesh 的地表以外
                b.setMarker(-2)
    # 展示
    pg.show(mesh,  markers=True, showMesh=True, label="Mesh05")
    plt.savefig('Mesh05.png')
    #--    
    # 印出 index, x1, y1, x2, y2, marker
    #print("index, x1, y1, x2, y2, marker")
    #for i, b in enumerate(mesh.boundaries()):
    #    print(f"{i}, {b.nodes()[0].pos()[0]:.6f}, {b.nodes()[0].pos()[1]:.6f}, {b.nodes()[1].pos()[0]:.6f}, {b.nodes()[1].pos()[1]:.6f}, {b.marker()}")
    #--
    # 儲存MeshMarkers為JSON檔案
    print('儲存MeshMarkers為JSON檔案...')
    # 開啟檔案，以 UTF-8 編碼手動寫入 JSON 內容
    with open('Output_FullMeshMarkers.json', 'w', encoding='utf-8') as f:
        #--
        # 寫入說明行
        f.write('{\n')
        f.write('"MeshMarkers_Readme":"index,x1[m],y1[m],x2[m],y2[m],marker",\n')
        f.write('"MeshMarkers":[\n')
        #--
        for i, b in enumerate(mesh.boundaries()):
            #--
            # 組成一列文字
            line = f'[{i}, {b.nodes()[0].pos()[0]:.6f}, {b.nodes()[0].pos()[1]:.6f}, {b.nodes()[1].pos()[0]:.6f}, {b.nodes()[1].pos()[1]:.6f}, {b.marker()}]'
            # 最後一列不加逗號，其它加逗號
            if i < mesh.boundaryCount() - 1:
                line += ','
            line += '\n'
            # 寫入
            f.write(line)
            #--
        #--
        # 關閉陣列與大括號
        f.write(']\n')
        f.write('}\n')
        #--
    print('儲存MeshMarkers為JSON檔案...完成!')
    #--
    # 先把預設該存在的資料填1
    mesh['Resistivity'] = np.ones(mesh.cellCount())
    mesh['Resistivity (log10)'] = np.log10(mesh['Resistivity'])
    mesh['Coverage'] = np.ones(mesh.cellCount())
    mesh['S_Coverage'] = np.ones(mesh.cellCount())
    #-- 
    # 輸出VTK
    print('儲存FullMesh為vtk檔案...')
    mesh.exportVTK('Output_FullMesh.vtk')
    print('儲存FullMesh為vtk檔案...完成!')
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