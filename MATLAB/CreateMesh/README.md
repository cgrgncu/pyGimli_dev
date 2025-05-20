# 規定創建2D網格必須填入的資料
+ 讀 **MeshSettings.json** 來建立網格
+ 輸出網格**FullMesh.vtk**，包含:
  + POINTS
  + CELLS
  + CELL_TYPES (限制必須都是9，四邊形網格)
  + CELL_DATA
    + SCALARS Coverage double 1
    + SCALARS Marker double 1
    + SCALARS Resistivity double 1
    + SCALARS Resistivity_(log10) double 1
    + SCALARS S_Coverage double 1
+ 輸出網格邊界Marker**FullMeshMarkers.json**，包含:
  + MeshMarkers_Readme (index,x1[m],y1[m],x2[m],y2[m],marker)
  + MeshMarkers
