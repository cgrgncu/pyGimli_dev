### UP20cm_KMesh009(三次加細基本面積三角網格)
+ 模型名稱: `UP20cm_KMesh009`
+ "Mesh_Setting02_AutoMesh_quality":32,
+ "Mesh_Setting03_AutoMesh_paraDepth":-1,
+ "Mesh_Setting04_AutoMesh_boundary":-1,
+ "Mesh_Setting05_AutoMesh_paraMaxCellSize":0.03125,
+ "Mesh_Setting06_AutoMesh_addNodes":15,
+ "Mesh_Setting07_AutoMesh_paraDX":1,
+ 特色:
  + L=64[m]，電極間距=1[m]，電極數量65:
    + StudyArea_W=65[m]，StudyArea_H=26[m]，面積=1690[m^2]
  + 全網格尺寸:
    + 設計大於FullMesh_W=65*5+65+65*5=715[m]。
    + 設計大於FullMesh_H=26+65*5=351[m]。
  + 粗細資訊:
    + 全網格數量: 106060 [count]。計算時最高占用記憶體約38[GB]
    + 最大內網格單元面積=0.03125 [m^2]。
  + Array: WS (1410筆資料)
    + 均質真實電阻率 = 100 [Ohm-m]
    + Response_Min = 99.9999868759067 [Ohm-m]
    + Response_Max = 100.000009100568 [Ohm-m]
    + K_mesh_Min = 6.38851212638623 [m]
    + K_mesh_Max = 3186.50959298713 [m]
  + 最終花費時間: 00時 57分 58.748秒
+ 解析解K0:
  + Array: WS (1410筆資料)
    + 均質真實電阻率 = 100 [Ohm-m]
    + K0_Response_Min = 97.1531870141123 [Ohm-m]
    + K0_Response_Max = 102.022860205337 [Ohm-m]
    + K0_mesh_Min = 6.40761689776564 [m]
    + K0_mesh_Max = 3178.17798129175 [m]
  + 最終花費時間: 00時 21分 53.675秒
+ 偏差百分比:
  + (Response_Min-K0_Response_Min)/K0_Response_Min = 2.93021767920066 [%]
  + (Response_Max-K0_Response_Max)/K0_Response_Max = -1.98274298593247 [%]
  + (K_mesh_Min-K0_mesh_Min)/K0_mesh_Min = -0.298157203906363 [%]
  + (K_mesh_Max-K0_mesh_Max)/K0_mesh_Max = 0.26215057005693 [%]
